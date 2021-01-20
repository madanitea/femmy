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
                                    <li class="breadcrumb-item"><a href="TA-Filter.html">Roles</a>
                                    </li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
            <!-- ============================================================== -->
            <!-- End Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->

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
            <!-- Container fluid  -->
            <!-- ============================================================== -->
            <div class="container-fluid">
                <!-- Start Location and Earnings Charts Section -->
                <!-- *************************************************************** -->
                @can('role-create')
                <div class="row">
                    <div class="col-md-12 col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="d-flex align-items-start mb-4">
                                    <h4 class="card-title mb-0">Create Role</h4>
                                </div>
                                <div class="form-group">
                                    {!! Form::open(array('route' => 'roles.store','method'=>'POST')) !!}
                                    <label>Role Name</label>
                                    {!! Form::text('name', null, array('placeholder' => 'Name','class' => 'form-control')) !!}<br>
                                    <label for="exampleFormControlTextarea1">Content</label>
                                    <div class="form-group">
                                        <strong>Permission:</strong>
                                        <div style="max-height: 150px;overflow: hidden;overflow-y: scroll;">
                                            @foreach($permission as $value)
                                                <label>{{ Form::checkbox('permission[]', $value->id, false, array('class' => 'name')) }}
                                                {{ $value->name }}</label><br>
                                            @endforeach
                                        </div>
                                    </div><br>
                                    <button class="btn btn-success float-right" type="submit">+ Create</button>
                                    {!! Form::close() !!}
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                @endcan
                <h3>Available Roles</h3>
                @can('role-list')
                <div class="row">
                    <div class="col-12">
                        <!-- Row -->
                        <div class="row">
                            @foreach ($roles as $key => $role)
                            <!-- column -->
                            <div class="col-lg-3 col-md-6">
                                <!-- Card -->
                                <div class="card">
                                    <div class="card-body">
                                        <h4 class="card-title">{{ $role->name }}
                                         @can('role-delete')
                                            {!! Form::open(['method' => 'DELETE','route' => ['roles.destroy', $role->id],'style'=>'display:inline']) !!}
                                                <button class="btn btn-sm btn-danger float-right"><i class="fa fa-trash-alt"></i></button>
                                            {!! Form::close() !!}
                                        @endcan</h4>
                                        @can('role-edit')
                                        {!! Form::model($role, ['method' => 'PATCH','route' => ['roles.update', $role->id]]) !!}
                                        <div class="form-group">
                                            <strong>Permission:</strong>
                                            <div class="" style="max-height: 150px;overflow: hidden;overflow-y: scroll;">
                                                @foreach($permission as $value)
                                                    <label>{{ Form::checkbox('permission[]', $value->id, in_array($value->id, $role->permission) ? true : false, array('class' => 'name')) }}
                                                    {{ $value->name }}</label><br>
                                            @endforeach
                                            </div>
                                        </div>
                                        <button type="submit" class="btn btn-sm btn-primary form-control">Update <i class="fas fa-arrow-up"></i></button>
                                        {!! Form::close() !!}
                                        @endcan
                                    </div>
                                </div>
                                <!-- Card -->
                            </div>
                            @endforeach
                        </div>
                        <!-- Row -->
                    </div>
                </div>
                @endcan
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