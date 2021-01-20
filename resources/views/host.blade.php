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
                                    <li class="breadcrumb-item"><a href="TA-Host.html">Hosts</a>
                                    </li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Notification Section -->
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
                    @can('host-list')
                    <div class="col-md-6 col-lg-8">
                        <div class="card">
                            <div class="card-body">
                                <div class="d-flex align-items-start mb-4">
                                    <h4 class="card-title mb-0">Hosts List</h4>
                                </div>
                                <div class="table-responsive">
                                <table class="table table-borderless table-hover">
                                    <thead>
                                        <tr>
                                            <th scope="col">#</th>
                                            <th scope="col">Name</th>
                                            <th scope="col">IP Address</th>
                                            <th scope="col">Port</th>
                                            <th scope="col">Description</th>
                                            <th scope="col">Agent Key</th>
                                            <th scope="col">Updated At</th>
                                            <th scope="col">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach ($hosts as $key => $host)
                                        <tr>
                                            @can('host-edit')
                                            {!! Form::open(['method' => 'PATCH','route' => ['hosts.update', $host->id],'style'=>'display:inline']) !!}
                                            @endcan
                                            <th scope="row">{{ ++$i }}</th>
                                            <td><input type="text" class="form-control" name="name" value="{{ $host->name }}" style="min-width: 200px;"></td>
                                            <td><input type="text" class="form-control" name="ip" value="{{ $host->ip }}" style="min-width: 200px;"></td>
                                            <td><input type="number" class="form-control" name="port" value="{{ $host->port }}" style="min-width: 200px;"></td>
                                            <td><input type="text" class="form-control" name="description" value="{{ $host->description }}" style="min-width: 200px;"></td>
                                            <td><input type="text" class="form-control" name="api_key" value="{{ $host->api_key }}" style="min-width: 200px;"></td>
                                            <td>{{ $host->updated_at }}</td>
                                            <td>
                                            @can('host-edit')
                                            <button class="btn btn-sm btn-success">Update</button>
                                            {!! Form::close() !!}
                                            @endcan
                                            @can('host-delete')
                                            {!! Form::open(['method' => 'DELETE','route' => ['hosts.destroy', $host->id],'style'=>'display:inline']) !!}
                                                    {!! Form::submit('Delete', ['class' => 'btn btn-danger btn-sm']) !!}
                                                {!! Form::close() !!}
                                            @endcan
                                            </td>
                                        </tr>
                                        @endforeach
                                    </tbody>
                                </table>
                            </div>
                            </div>
                        </div>
                    </div>
                    @endcan
                    @can('host-create')
                    <div class="col-md-6 col-lg-4">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">Add Host</h4>
                                {!! Form::open(array('route' => 'hosts.store','method'=>'POST')) !!}
                                    <label>Name :</label>
                                    <input type="text" name="name" class="form-control mb-2">
                                    <label>IP :</label>
                                    <input type="text" name="ip" class="form-control mb-2">
                                    <label>Port :</label>
                                    <input type="number" name="port" class="form-control mb-2">
                                    <label>Agent Key :</label>
                                    <input type="text" name="api_key" class="form-control mb-2">
                                    <label>Description :</label>
                                    <input type="text" name="description" class="form-control mb-2">
                                    <br>
                                    <button type="submit" class="btn btn-success">+ Add</button>
                                {!! Form::close() !!}
                            </div>
                        </div>
                    </div>
                    @endcan
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
@stop