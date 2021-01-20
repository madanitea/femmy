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
                                    <li class="breadcrumb-item"><a href="TA-User.html">Profile</a>
                                    </li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                    <div class="col-5 align-self-center">
                        <div class="customize-input float-right">
                            <div class="custom-select-set bg-white border-0 custom-shadow custom-radius">
                                <i class="fas fa-calendar-alt mr-3"></i>19 July 2020
                            </div>
                        </div>
                    </div>
                </div>
            </div>
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
                    <div class="col-md-12 col-lg-4">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">Madani Besari, Profile</h4>
                                <form>
                                    <label>Full name :</label>
                                    <input type="text" name="fullname" class="form-control mb-2" value="Madani Besari">
                                    <label>Username :</label>
                                    <input type="text" name="fullname" class="form-control mb-2" value="medbesari">
                                    <label>Password :</label>
                                    <input type="password" name="fullname" class="form-control mb-2">
                                    <label>Level :</label>
                                    <select class="form-control mb-2">
                                        <option selected="">Super Admin</option>
                                        <option>Admin</option>
                                    </select>
                                    <br>
                                    <button type="submit" class="btn btn-success float-right"><i class="fas fa-arrow-up"></i> Update</button>
                                </form>
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
            <!-- ============================================================== -->
            <!-- footer -->
            <!-- ============================================================== -->
            <footer class="footer text-center text-muted">
                All Rights Reserved by Adminmart. Designed and Developed by <a
                    href="https://wrappixel.com">WrapPixel</a>.
            </footer>
            <!-- ============================================================== -->
            <!-- End footer -->
            <!-- ============================================================== -->
        </div>
        <!-- ============================================================== -->
        <!-- End Page wrapper  -->
        <!-- ============================================================== -->
@stop
@section('script')
@stop