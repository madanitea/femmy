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
                        <h3 class="page-title text-truncate text-dark font-weight-medium mb-1">Welcome {{ Auth::user()->full_name }}!</h3>
                        <div class="d-flex align-items-center">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb m-0 p-0">
                                    <li class="breadcrumb-item"><a href="{{ route('dashboard') }}">Dashboard</a>
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
            <!-- ============================================================== -->
            <!-- Container fluid  -->
            <!-- ============================================================== -->
            <div class="container-fluid">
                <!-- *************************************************************** -->
                <!-- Start First Cards -->
                <!-- *************************************************************** -->
                <div class="card-group">
                    <div class="card border-right">
                        <div class="card-body">
                            <div class="d-flex d-lg-flex d-md-block align-items-center">
                                <div>
                                    <div class="d-inline-flex align-items-center">
                                        <h2 class="text-dark mb-1 font-weight-medium">{{ $total_banned_now }}</h2>
                                        <span
                                            class="badge bg-primary font-12 text-white font-weight-medium badge-pill ml-2 d-lg-block d-md-none">#</span>
                                    </div>
                                    <h6 class="text-muted font-weight-normal mb-0 w-100 text-truncate">Currently Banned IP</h6>
                                </div>
                                <div class="ml-auto mt-md-3 mt-lg-0">
                                    <span class="opacity-7 text-muted"><i class="fas fa-ambulance"></i></span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card border-right">
                        <div class="card-body">
                            <div class="d-flex d-lg-flex d-md-block align-items-center">
                                <div>
                                    <h2 class="text-dark mb-1 w-100 text-truncate font-weight-medium">{{ $total_banned }}</h2>
                                    <h6 class="text-muted font-weight-normal mb-0 w-100 text-truncate">Total Banned IP
                                    </h6>
                                </div>
                                <div class="ml-auto mt-md-3 mt-lg-0">
                                    <span class="opacity-7 text-muted"><i class="fas fa-globe"></i></span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card border-right">
                        <div class="card-body">
                            <div class="d-flex d-lg-flex d-md-block align-items-center">
                                <div>
                                    <div class="d-inline-flex align-items-center">
                                        <h2 class="text-dark mb-1 font-weight-medium">{{ $total_host }}</h2>
                                        <span
                                            class="badge bg-danger font-12 text-white font-weight-medium badge-pill ml-2 d-md-none d-lg-block">#</span>
                                    </div>
                                    <h6 class="text-muted font-weight-normal mb-0 w-100 text-truncate">Total Host Monitored</h6>
                                </div>
                                <div class="ml-auto mt-md-3 mt-lg-0">
                                    <span class="opacity-7 text-muted"><i class="fas fa-server"></i></span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-body">
                            <div class="d-flex d-lg-flex d-md-block align-items-center">
                                <div>
                                    <h2 class="text-dark mb-1 font-weight-medium">{{ $total_jail }}</h2>
                                    <h6 class="text-muted font-weight-normal mb-0 w-100 text-truncate">Total Jail</h6>
                                </div>
                                <div class="ml-auto mt-md-3 mt-lg-0">
                                    <span class="opacity-7 text-muted"><i class="fas fa-hospital"></i></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- *************************************************************** -->
                <!-- End First Cards -->
                <!-- *************************************************************** -->
                <!-- *************************************************************** -->
                <!-- Start Sales Charts Section -->
                <!-- *************************************************************** -->
                <div class="row">
                    <div class="col-lg-12 col-md-12">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title mb-4">Banned IP Locations</h4>
                                <canvas id="countryChart"></canvas>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title mb-3">Host Under Attack</h4>
                                <ul class="list-style-none mb-0">
                                    <?php $last='0' ?>
                                    @foreach($host_under_attack as $key => $under_attack)
                                    @if($under_attack->host !== $last)
                                    <li>
                                        <i class="fas fa-circle text-primary font-10 mr-2"></i>
                                        <span class="text-dark">{{ $under_attack->host }}</span>
                                        <span class="text-dark float-right font-weight-medium">{{ $under_attack->time }}</span>
                                        <p class="w-100 text-right">{{ $under_attack->date }}</p>
                                        <hr>
                                    </li>
                                    @endif
                                    <?php $last=$under_attack->host ?>
                                    @endforeach
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-8">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">Recent Activity</h4>
                                <div class="activity mt-4">
                                    @foreach($recent_act as $key => $recent)
                                    <div class="d-flex align-items-start border-left-line">
                                        <div>
                                            <a href="javascript:void(0)" class="btn btn-warning btn-circle mb-2 btn-item">
                                                <i data-feather="bell"></i>
                                            </a>
                                        </div>
                                        <div class="ml-3 mt-2">
                                            <h5 class="text-{{ $recent->level }} font-weight-medium mb-2">{{ $recent->level }}
                                            </h5>
                                            <p class="font-14 mb-2 text-dark">{{ $recent->log }}</p>
                                            <span class="font-weight-light font-14 mb-1 d-block text-muted">{{ $recent->created_at }}</span>
                                        </div>
                                    </div>
                                    @endforeach<a href="{{ route('logs.index') }}" class="font-14 border-bottom pb-1 border-info">Load More</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- *************************************************************** -->
                <!-- End Sales Charts Section -->
                <!-- *************************************************************** -->
                <!-- *************************************************************** -->
                <!-- Start Location and Earnings Charts Section -->
                <!-- *************************************************************** -->
                <div class="row">
                	<div class="col-lg-4 col-md-12">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">Monthly Attack Statistic</h4>
                                <div class="mt-4 position-relative" style="height:294px;">
                                    <canvas id="monthly"></canvas>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-8">
                        <div class="card">
                            <div class="card-body">
                                <div class="d-flex align-items-start">
                                    <h4 class="card-title mb-0">Daily Attack Statistic</h4>
                                </div>
                                <div class="pl-4 mb-5">
                                    <div class="position-relative" style="height: 315px;">
                                        <canvas id="daily"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- *************************************************************** -->
                <!-- End Location and Earnings Charts Section -->
                <!-- *************************************************************** -->
                <!-- *************************************************************** -->
                <!-- Start Top Leader Table -->
                <!-- *************************************************************** -->
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="d-flex align-items-center">
                                    <h4 class="card-title">Last 10 Banned IP Information</h4>
                                </div>
                                <div class="table-responsive">
                                    <table class="table table-borderless table-striped table-hover" id="banbythisjailhistory">
                                    <thead>
                                        <tr>
                                            <th scope="col">#</th>
                                            <th scope="col">IP Address</th>
                                            <th scope="col">Time</th>
                                            <th scope="col">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach($banned_ip as $key => $ban_ip)
                                        <tr>
                                            <th scope="row">{{ ++$i }}</th>
                                            <td>{{ $ban_ip->ip }}</td>
                                            <td>{{ $ban_ip->created_at }}</td>
                                            <td>

                                                @if(count($ban_ip->info) !== 0)
                                                <button type="button" class="btn btn-sm btn-primary" data-toggle="popover" title="IP Information" data-content="<table>
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
                </div>
                <!-- *************************************************************** -->
                <!-- End Top Leader Table -->
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
    <script src="{{ asset('dist/js/pages/chartjs/chartjs.init.js') }}"></script>
    <script src="{{ asset('assets/libs/chart.js/dist/Chart.min.js') }}"></script>
    <script type="text/javascript">
        var countryCanvas = document.getElementById("countryChart");

        Chart.defaults.global.defaultFontFamily = "Lato";
        Chart.defaults.global.defaultFontSize = 18;

        var oilData = {
            labels: [
                @foreach($most_ip_loc as $key => $most)
                "{{ $most->country }}",
                @endforeach
            ],
            datasets: [
                {
                    data: [
                        @foreach($most_ip_loc as $key => $most)
                        "{{ $most->count }}",
                        @endforeach
                    ],
                    backgroundColor: [
                        @foreach($most_ip_loc as $key => $most)
                        "#{{ sprintf('%06X', mt_rand(0, 16777215)) }}",
                        @endforeach
                    ]
                }]
        };

        var pieChart = new Chart(countryCanvas, {
          type: 'doughnut',
          data: oilData
        });

        var ctx = document.getElementById("monthly").getContext('2d');
        var myChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: [
                    @foreach($monthly_stats as $key => $month)
                    "{{ $month->month_str }}",
                    @endforeach
                ],
                datasets: [{
                    label: 'IP Banned ',
                    data: [
                        @foreach($monthly_stats as $key => $month)
                        "{{ $month->ip }}",
                        @endforeach
                    ],
                    borderColor: [
                    @foreach($monthly_stats as $key => $month)
                        "#{{ sprintf('%06X', mt_rand(0, 16777215)) }}",
                    @endforeach
                    ],
                    borderWidth: 5
                }]
            },
            options: {
                scales: {
                    yAxes: [{
                        ticks: {
                            beginAtZero:true
                        }
                    }]
                }
            }
        });

         var ctx = document.getElementById("daily").getContext('2d');
        var myChart = new Chart(ctx, {
            type: 'line',
            data: {
                labels: [
                    @foreach($daily_stats as $key => $daily)
                    "{{ $daily->day }}",
                    @endforeach
                ],
                datasets: [{
                    label: 'IP Banned ',
                    data: [
                        @foreach($daily_stats as $key => $daily)
                        "{{ $daily->ip }}",
                        @endforeach
                    ],
                    borderColor: [
                    @foreach($daily_stats as $key => $daily)
                        "#{{ sprintf('%06X', mt_rand(0, 16777215)) }}",
                    @endforeach
                    ],
                    borderWidth: 5
                }]
            },
            options: {
                scales: {
                    yAxes: [{
                        ticks: {
                            beginAtZero:true
                        }
                    }]
                }
            }
        });
    </script>
@stop