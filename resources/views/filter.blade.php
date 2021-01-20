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
                                    <li class="breadcrumb-item"><a href="{{ route('filters.index') }}">Filters</a>
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
                @can('filter-create')
                <div class="row">
                    <div class="col-md-12 col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="d-flex align-items-start mb-4">
                                    <h4 class="card-title mb-0">Create Custom Filter</h4>
                                </div>
                                <div class="form-group">
                                    {!! Form::open(array('route' => 'filters.store','method'=>'POST')) !!}
                                    <label>Filter Name</label>
                                    <input type="text" name="name" class="form-control w-30" placeholder="Insert filter name here."><br>
                                    <label for="content">Content</label>
                                    <textarea class="form-control" name="content" id="content" rows="3" placeholder="Just like you write a file in filter.d" style="font-family: consolas;"></textarea><br>
                                    <button class="btn btn-success float-right" type="submit">+ Create</button>
                                    {!! Form::close() !!}
                                    <a href="https://www.regextester.com/" class="btn btn-primary float-right" target="_BLANK">Test Regex</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                @endcan
                @can('filter-list')
                <h3>Available Custom Filters</h3>
                <div class="badge badge-warning badge-lg mb-3"><b>ReadMe!</b> Delete feature is still under developement.</div>
                <div class="row">
                    <div class="col-12">
                        <!-- Row -->
                        <div class="row">
                            <!-- column -->
                            @foreach($filters as $key => $filter)
                            <div class="col-lg-6 col-md-6">
                                <!-- Card -->
                                <div class="card">
                                    <div class="card-body">
                                        <h4 class="card-title"><i class="fas fa-umbrella"></i> {{ $filter->name }}<small>.conf</small></h4>
                                        {!! Form::open(['method' => 'PATCH','route' => ['filters.update', $filter->id],'style'=>'display:inline']) !!}
                                        <label for="failregex">Content</label>
                                        <textarea class="form-control mb-3" name="content" id="failregex" rows="5" placeholder="Separate regex with Enter/New line." style="font-family: consolas;">{{ $filter->content }}</textarea>
                                        @can('filter-edit')
                                            <button class="btn btn-sm btn-success" type="submit">Update</button>
                                        @endcan
                                        {!! Form::close() !!}
                                        @can('filter-delete')
                                        {!! Form::open(['method' => 'DELETE','route' => ['filters.destroy', $filter->id],'style'=>'display:inline']) !!}
                                            {!! Form::submit('Delete', ['class' => 'btn btn-danger btn-sm']) !!}
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
                <h3>Available Default Filters</h3>
                <div class="row">
                    <div class="col-12">
                        <!-- Row -->
                        <div class="row">
                            <!-- column -->
                            @foreach($filters_default as $key => $filter)
                            <div class="col-lg-3 col-md-4">
                                <!-- Card -->
                                <div class="card">
                                    <div class="card-body border-top border-right border-success rounded-top">
                                        <h4 class="card-title"><i class="fas fa-umbrella"></i> {{ $filter->name }}<small>.conf</small></h4>
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