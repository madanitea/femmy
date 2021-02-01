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
                                    <li class="breadcrumb-item"><a href="{{ route('jails.index') }}/{{ $host->id }}">{{ $host->name }}</a>
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
                <!-- *************************************************************** -->
                <!-- Start First Cards -->
                <!-- *************************************************************** -->
                <h3>Choose Jail
                @can('jail-create') 
                    or <button class="btn btn-primary" onclick="alert('Sorry, this feature is still under developement.')">+ Create Jail (Custom)</button> or 
                    <button class="btn btn-success" data-toggle="modal" data-target="#CreateJail">+ Create Jail (Wizard)</button>
                    </h3>
                    <!-- Modal -->
                    <div class="modal fade" id="CreateJail" tabindex="-1" role="dialog" aria-labelledby="Create Jail" aria-hidden="true">
                      <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content">
                          <div class="modal-header">
                            <h5 class="modal-title" id="CreateJailTitle">Create Jail on {{ $host->name }}</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                              <span aria-hidden="true">&times;</span>
                            </button>
                          </div>
                          <div class="modal-body">
                            {!! Form::open(array('route' => 'jails.store','method'=>'POST')) !!}
                                    <input type="hidden" name="host_id" value="{{ $host->id }}">
                                    <label>Name :</label>
                                    <input type="text" name="name" class="form-control mb-2" placeholder="Jail name">
                                    <label>Port/Service :</label>
                                    <input type="text" name="port" class="form-control mb-2" placeholder="Separate port/service by comma">
                                    <label>Filter :</label>
                                    <select name="filter_id" class="form-control mb-2">
                                        @foreach($filters as $key => $filter)
                                        <option value="{{ $filter->id }}">{{ $filter->name }}</option>
                                        @endforeach
                                    </select> 
                                    <label>Find time (minutes):</label>
                                    <input type="number" name="find_time" class="form-control mb-2" placeholder="in minutes">
                                    <label>Max retry :</label>
                                    <input type="number" name="max_retry" class="form-control mb-2" placeholder="Maximum retry">
                                    <label>Ban time (minutes):</label>
                                    <input type="number" name="ban_time" class="form-control mb-2" placeholder="in minutes">
                                    <input type="hidden" name="status" value="Enabled">
                                    <label>Log path :</label>
                                    <input type="text" name="logpath" class="form-control mb-2" placeholder="Insert logpath here, example : /var/log/httpd/access.log">
                          </div>
                          <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                            <button type="submit" class="btn btn-primary">+ Create Jail</button></div>
                            {!! Form::close() !!}
                        </div>
                      </div>
                    </div>
                @endcan
                <div class="row">
                    <div class="col-12">
                        <!-- Row -->
                        <div class="row">
                            <!-- column -->
                            @foreach($jails as $key => $jail)
                            <div class="col-lg-3 col-md-6">
                                <!-- Card -->
                                <div class="card">
                                    <div class="card-body">
                                        <h4 class="card-title"><i class="fas fa-lock"></i> {{ $jail->name }} 
                                        @if($jail->status == 'Enabled')
                                        <span class="badge badge-success">{{ $jail->status }}</span></h4>
                                        {!! Form::open(['method' => 'PATCH','route' => ['jails.disable', $jail->id],'style'=>'display:inline']) !!}
                                        <input type="hidden" name="host_id" value="{{ $host->id }}">
                                        <button type="submit" class="btn btn-warning">Disable</button>
                                        {!! Form::close() !!}
                                        @else
                                        <span class="badge badge-danger">{{ $jail->status }}</span></h4>
                                        {!! Form::open(['method' => 'PATCH','route' => ['jails.enable', $jail->id],'style'=>'display:inline']) !!}
                                        <input type="hidden" name="host_id" value="{{ $host->id }}">
                                        <button type="submit" class="btn btn-success">Enable</button>
                                        {!! Form::close() !!}
                                        @endif
                                        <br>
                                        <a href="{{ route('jails.detail',[$host->id,$jail->id]) }}" class="btn btn-primary mt-2">Details / Configure <i class="fas fa-arrow-right"></i></a>
                                    </div>
                                </div>
                                <!-- Card -->
                            </div>
                            @endforeach
                            <!-- column -->
                        </div>
                        <!-- Row -->
                    </div>
                </div>
                <!-- *************************************************************** -->
                <!-- End First Cards -->
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
@stop