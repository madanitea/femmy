@extends('template')
@section('main')
        <!-- ============================================================== -->
        <!-- Page wrapper  -->
        <!-- ============================================================== -->
        <div class="page-wrapper">
            <!-- ============================================================== -->
            <!-- Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-7 align-self-center">
                        <div class="d-flex align-items-center">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb m-0 p-0">
                                    <li class="breadcrumb-item"><a href="{{ route('jails.index') }}">Jails</a>
                                    </li>
                                    <li class="breadcrumb-item"><a href="{{ route('jails.manage',[$host->id]) }}">{{ $host->name }}</a>
                                    </li>
                                    <li class="breadcrumb-item"><a href="{{ route('jails.detail',[$host->id,$jails->id]) }}">{{ $jailname->name }} ({{ $filter->name }} Filter)</a>
                                    </li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>


            <!-- Notification Alerts! -->
            @if (count($errors) > 0)
              <div class="alert alert-danger mt-4">
                <strong>Whoops!</strong> There were some problems with your input.<br><br>
                <ul>
                   @foreach ($errors->all() as $error)
                     <li>{{ $error }}</li>
                   @endforeach
                </ul>
              </div>
            @endif
            @if ($message = Session::get('success'))
                <div class="alert alert-success mt-4">
                  <p>{{ $message }}</p>
                </div>
            @endif
            <!-- ============================================================== -->
            <!-- End Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- Container fluid  -->
            <!-- ============================================================== -->
            <div class="container-fluid">
                <!-- Start Location and Earnings Charts Section -->
                <!-- *************************************************************** -->
                <div class="row">
                    <div class="col-md-6 col-lg-4">
                        <div class="card">
                            <div class="card-body">
                                <div class="d-flex align-items-start mb-4">
                                    <h4 class="card-title mb-0">Add Trusted IP Address</h4>
                                </div>
                                {!! Form::open(['method' => 'POST','route' => ['trusted_ips.store',$jails->host_id,$jails->id],'style'=>'display:inline']) !!}  
                                <div class="input-group mb-3">
                                    <input type="text" class="form-control" name="ip" placeholder="x.x.x.x or x.x.x.x/x">
                                    <div class="input-group-append">
                                    <button type="submit" class="btn btn-success"><i class="fas fa-shield-alt"></i> Add</button>
                                    </div>
                                </div>
                                {!! Form::close() !!}
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-8">
                        <div class="card">
                            <div class="card-body">
                                <div class="d-flex align-items-start mb-4">
                                    <h4 class="card-title mb-0">Trusted IP Address</h4>
                                </div>
                                @if($trusted_ip == "[]")
                                    <p>There is no ip trusted.</p>
                                @endif
                                @foreach($trusted_ip as $key => $trusted)
                                <span class="badge badge-success p-0 pt-0 pl-2" style="font-size: 12pt;">{{ $trusted->ip }} 
                                    {!! Form::open(['method' => 'DELETE','route' => ['trusted_ips.destroy', $jails->host_id,$jails->id,$trusted->id],'style'=>'display:inline']) !!}
                                                    {!! Form::submit('X', ['class' => 'btn btn-sm btn-danger']) !!}
                                    {!! Form::close() !!}
                                </span>
                                @endforeach
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6 col-lg-8">
                        <div class="card">
                            <div class="card-body">
                                <div class="d-flex align-items-start mb-4">
                                    <h4 class="card-title mb-0">Ban IP Address</h4>
                                </div>
                                {!! Form::open(['method' => 'POST','route' => ['banned_ips.store',$jails->host_id,$jails->id],'style'=>'display:inline']) !!}  
                                <div class="input-group mb-3">
                                    <input type="text" name="ip" class="form-control" placeholder="Insert an IP to ban. (x.x.x.x)">
                                      <div class="input-group-append">
                                        <button type="submit" class="btn btn-danger"><i class="fas fa-lock"></i> Ban</button>
                                      </div>
                                    {!! Form::close() !!}
                                </div>
                                <div class="d-flex align-items-start mb-4">
                                    <h4 class="card-title mb-0">IPs banned by this jail</h4>
                                </div>
                                <div class="table-responsive">
                                <table class="table table-borderless table-striped table-hover" id="banbythisjailhistory">
                                    <thead>
                                        <tr>
                                            <th scope="col">#</th>
                                            <th scope="col">IP Address</th>
                                            <th scope="col">Time</th>
                                            <th scope="col">Abuse</th>
                                            <th scope="col">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach($banned_ip as $key => $ban_ip)
                                        <tr>
                                            <th scope="row">{{ ++$i }}</th>
                                            <td>{{ $ban_ip->ip }}</td>
                                            <td>{{ $ban_ip->created_at }}</td>
                                            <td>{{ $ban_ip->abuse }}</td>
                                            <td>
                                                {!! Form::open(['method' => 'DELETE','route' => ['banned_ips.destroy', $jails->host_id,$jails->id,$ban_ip->id],'style'=>'display:inline']) !!}
                                                    {!! Form::submit('Unban', ['class' => 'btn btn-sm btn-warning']) !!}
                                                {!! Form::close() !!}
                                                @if(count($ban_ip->info) !== 0)
                                                <br><button type="button" class="btn btn-sm btn-primary" data-toggle="popover" title="IP Information" data-content="<table>
                                                <tr><td>Country</td><td>: {{ $ban_ip->info['country'] }}</td></tr>
                                                <tr><td>Region</td><td>: {{  $ban_ip->info['regionName'] }}</td></tr>
                                                <tr><td>City</td><td>: {{  $ban_ip->info['city'] }}</td></tr>
                                                <tr><td>Latitude</td><td>: {{  $ban_ip->info['lat'] }}</td></tr>
                                                <tr><td>Longitude</td><td>: {{  $ban_ip->info['lon'] }}</td></tr>
                                                <tr><td>Timezone</td><td>: {{  $ban_ip->info['timezone'] }}</td></tr>
                                                <tr><td>ISP</td><td>: {{  $ban_ip->info['isp'] }}</td></tr>
                                                <tr><td>Organization</td><td>: {{  $ban_ip->info['org'] }}</td></tr>
                                                <tr><td>AS</td><td>: {{  $ban_ip->info['as'] }}</td></tr>
                                            </table>">See IP Info</button>
                                                @else
                                                <p class="badge badge-info">No IP info for Private IP</p>
                                                @endif
                                            </td>
                                        </tr>
                                        @endforeach
                                    </tbody>
                                </table>
                            </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-4">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">Jail Details</h4>
                                {!! Form::open(['method' => 'PATCH','route' => ['jails.update', $jails->id],'style'=>'display:inline']) !!}                                 
                                    <input type="hidden" name="host_id" value="{{ $jails->host_id }}">
                                    <label>Name :</label>
                                    <input type="text" name="" class="form-control mb-2" value="{{ $jails->name }}" disabled="">
                                    <input type="hidden" name="filter_id" class="form-control" value="{{ $jails->filter_id }}" disabled="">
                                    <label>Find time (minutes) :</label>
                                    <input type="number" name="find_time" class="form-control mb-2" value="{{ $jails->find_time }}">
                                    <label>Max retry :</label>
                                    <input type="number" name="max_retry" class="form-control mb-2" value="{{ $jails->max_retry }}">
                                    <label>Ban time (minutes) :</label>
                                    <input type="number" name="ban_time" class="form-control mb-2" value="{{ $jails->ban_time }}">
                                    <label>Log path :</label>
                                    <input type="text" name="logpaths" class="form-control mb-2" value="{{ $jails->logpath }}" disabled="">
                                    <br>
                                    <button type="submit" class="btn btn-success"><i class="fas fa-check"></i> Apply</button>
                                {!! Form::close() !!}
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6 col-lg-8">
                        <div class="card">
                            <div class="card-body">
                                <div class="d-flex align-items-start mb-4">
                                    <h4 class="card-title mb-0">Banned IPs history on this jail</h4>
                                </div>
                                <div class="table-responsive">
                                <table class="table table-borderless table-striped table-hover" id="banbythisjail">
                                    <thead>
                                        <tr>
                                            <th scope="col">#</th>
                                            <th scope="col">IP Address</th>
                                            <th scope="col">Time</th>
                                            <th scope="col">Abuse</th>
                                            <th scope="col">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach($historys as $key => $history)
                                        <tr>
                                            <th scope="row">{{ ++$u }}</th>
                                            <td>{{ $history->ip }}</td>
                                            <td>{{ $history->created_at }}</td>
                                            <td>{{ $history->abuse }}</td>
                                            <td>

                                                @if(count($history->info) !== 0)
                                                <button type="button" class="btn btn-sm btn-primary" data-toggle="popover" title="IP Information" data-content="<table>
                                                <tr><td>Country</td><td>: {{ $history->info['country'] }}</td></tr>
                                                <tr><td>Region</td><td>: {{  $history->info['regionName'] }}</td></tr>
                                                <tr><td>City</td><td>: {{  $history->info['city'] }}</td></tr>
                                                <tr><td>Latitude</td><td>: {{  $history->info['lat'] }}</td></tr>
                                                <tr><td>Longitude</td><td>: {{  $history->info['lon'] }}</td></tr>
                                                <tr><td>Timezone</td><td>: {{  $history->info['timezone'] }}</td></tr>
                                                <tr><td>ISP</td><td>: {{  $history->info['isp'] }}</td></tr>
                                                <tr><td>Organization</td><td>: {{  $history->info['org'] }}</td></tr>
                                                <tr><td>AS</td><td>: {{  $history->info['as'] }}</td></tr>
                                            </table>">See IP Info</button>
                                                @else
                                                <p class="badge badge-info">No IP info for Private IP</p>
                                                @endif
                                        </td>
                                        </tr>
                                        @endforeach
                                    </tbody>
                                </table>
                            </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- *************************************************************** -->
                <!-- End Location and Earnings Charts Section -->
                <!-- *************************************************************** -->
            </div>
            <!-- ============================================================== -->
            <!-- End Container fluid  -->
            <!-- ============================================================== -->
        </div>
        <!-- ============================================================== -->
        <!-- End Page wrapper  -->
        <!-- ============================================================== -->
@stop
@section('script')
    <script type="text/javascript">
        $(document).ready(function() {
            $('#banbythisjail').DataTable();
            $('#banbythisjailhistory').DataTable();
        } );
    </script>
@stop