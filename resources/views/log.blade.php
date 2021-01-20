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
                                    <li class="breadcrumb-item"><a href="{{ route('logs.index') }}">Logs</a>
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
            @can('log-list')
            <div class="container-fluid">
                <!-- Start Location and Earnings Charts Section -->
                <!-- *************************************************************** -->
                <div class="row">
                    <div class="col-md-12 col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="table-responsive">
                                <table class="table table-hover">
                                    <tbody>
                                        @if($logs == '[]')
                                            There's no log yet.
                                        @endif
                                        @foreach($logs as $key => $log)
                                        <tr>
                                            <th scope="row" width="5%">{{ ++$i }}</th>
                                            <td width="15%">{{ $log->created_at }}</td>
                                            <td>{{ $log->log }}</td>
                                            <td><span class="badge badge-{{ $log->level }}">{{ $log->level }}</span></td>
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
            @endcan
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