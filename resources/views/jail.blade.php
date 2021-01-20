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
                                    <li class="breadcrumb-item"><a href="TA-Jail.html">Jails</a>
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
            <!-- Container fluid  -->
            <!-- ============================================================== -->
            <div class="container-fluid">
                <!-- *************************************************************** -->
                <!-- Start First Cards -->
                <!-- *************************************************************** -->
                <h3>Choose Host</h3>
                <div class="row">
                    <div class="col-12">
                        <!-- Row -->
                        <div class="row">
                            <!-- column -->
                            @can('host-list')
                            @foreach($hosts as $key => $host)
                            <div class="col-lg-3 col-md-6">
                                <!-- Card -->
                                <div class="card">
                                    <div class="card-body">
                                        <h4 class="card-title"><i class="fas fa-server"></i> {{ $host->name }}</h4>
                                        <h6 class="badge badge-warning">{{ $host->ip }}:{{ $host->port }}</h6>
                                        <p class="card-text">{{ $host->description }}</p>
                                        @can('jail-list')
                                        <a href="{{ route('jails.manage',[$host->id]) }}" class="btn btn-success">Manage <i class="fas fa-arrow-right"></i></a>
                                        @endcan
                                    </div>
                                </div>
                                <!-- Card -->
                            </div>
                            @endforeach
                            @endcan
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