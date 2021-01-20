<!DOCTYPE html>
<html dir="ltr">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="../assets/images/favicon.png">
    <!-- <title>{{ config('app.name', 'Laravel') }}</title> -->
    <title>Fail2Cen</title>
    <!-- Custom CSS -->
    <link href="../dist/css/style.css" rel="stylesheet">
    {!! NoCaptcha::renderJs() !!}
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
</head>

<body style="height: 100vh;width: 100vw;">
        <!-- ============================================================== -->
        <!-- Preloader - style you can find in spinners.css -->
        <!-- ============================================================== -->
        <div class="preloader">
            <div class="lds-ripple">
                <div class="lds-pos"></div>
                <div class="lds-pos"></div>
            </div>
        </div>
        <!-- ============================================================== -->
        <!-- Preloader - style you can find in spinners.css -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Login box.scss -->
        <!-- ============================================================== -->
        <div class="position-relative" style="height: 100vh;display: flex;width: 100vw;">
            <div class="row align-item-center" style="width: 100vw;"><!-- 
                <div class="col-lg-7 col-md-4 modal-bg-img" style="background-image: url(../assets/images/bg-4-login.jpg);">
                </div> -->
                <div class="col-lg-3 col-md-4 col-sm-12 bg-white align-item-center w-100">
                    <div style="padding: 3vh;margin-left: 0.7vw;margin-top: 3vh;" class="">
                        <div class="text-center">
                            <img src="../assets/images/femmy-logo-2.png" width="80%" alt="wrapkit">
                        </div>
                        <form class="mt-4" method="POST" action="{{ route('login') }}">
                            @csrf
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <label class="text-dark" for="uname">{{ __('E-Mail Address') }}</label>
                                        <input id="email" type="email" class="form-control @error('email') is-invalid @enderror" name="email" value="{{ old('email') }}" required autocomplete="email" autofocus placeholder="{{ __('Enter email here') }}">
                                        @error('email')
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <label class="text-dark" for="uname">{{ __('Password') }}</label>
                                        <input id="password" type="password" class="form-control @error('password') is-invalid @enderror" name="password" required autocomplete="current-password" placeholder="{{ __('Enter password here') }}">
                                        @error('password')
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="form-group p-0" style="transform: scale(0.864);margin-left: -19px;">
                                        {!! app('captcha')->display() !!}
                                        @if ($errors->has('g-recaptcha-response'))
                                            <span class="help-block text-dark">
                                                <strong>{{ $errors->first('g-recaptcha-response') }}</strong>
                                            </span>
                                        @endif
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="form-group ml-4">
                                        <input class="form-check-input" type="checkbox" name="remember" id="remember" {{ old('remember') ? 'checked' : '' }}>
                                        <label class="form-check-label" for="remember">
                                            {{ __('Remember Me') }}
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-12 text-center">
                                    <button type="submit" class="btn btn-block btn-dark" style="border-radius: 5px;">Log In</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="col-lg-9 col-md-8 col-sm-12 align-item-center w-100" style="background-image: url(../assets/images/bg-4-login.jpg);background-size: cover;">
                    
                </div>
            </div>
        </div>
        <!-- ============================================================== -->
        <!-- Login box.scss -->
        <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- All Required js -->
    <!-- ============================================================== -->
    <script src="../assets/libs/jquery/dist/jquery.min.js "></script>
    <!-- Bootstrap tether Core JavaScript -->
    <script src="../assets/libs/popper.js/dist/umd/popper.min.js "></script>
    <script src="../assets/libs/bootstrap/dist/js/bootstrap.min.js "></script>
    <!-- ============================================================== -->
    <!-- This page plugin js -->
    <!-- ============================================================== -->
    <script>
        $(".preloader ").fadeOut();
    </script>
</body>

</html>