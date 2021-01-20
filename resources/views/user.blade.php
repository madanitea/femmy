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
                                    <li class="breadcrumb-item"><a href="{{ route('users.index') }}">Users</a>
                                    </li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Alert BOX -->
            @if (count($errors) > 0)
              <div class="alert alert-danger mt-4">
                <strong>Whoops!</strong> Something errors with your input.<br><br>
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
                    @can('user-list')
                    <div class="col-md-6 col-lg-8">
                        <div class="card">
                            <div class="card-body">
                                <div class="d-flex align-items-start mb-4">
                                    <h4 class="card-title mb-0">User List</h4>
                                </div>
                                <div class="table-responsive">
                                <table class="table table-borderless table-hover">
                                    <thead>
                                        <tr>
                                            <th scope="col">#</th>
                                            <th scope="col">Full name</th>
                                            <th scope="col">Email</th>
                                            <th scope="col">Password</th>
                                            <th scope="col">Last updated</th>
                                            <th scope="col">Role</th>
                                            <th scope="col">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                         @foreach ($data as $key => $user)
                                        <tr>
                                         {!! Form::open(['method' => 'PATCH','route' => ['users.update', $user->id],'style'=>'display:inline']) !!}
                                            <th scope="row">{{ ++$i }}</th>
                                            <td><input type="text" class="form-control" name="full_name" value="{{ $user->full_name }}" style="min-width: 200px;"></td>
                                            <td><input type="email" class="form-control" name="email" value="{{ $user->email }}" style="min-width: 200px;"></td>
                                            <td><input type="password" class="form-control" name="password"  autocomplete="off" placeholder="Kata sandi baru" style="min-width: 200px;">
                                            <td>{{ $user->updated_at }}</td>
                                            <td>
                                                @if($user->getRoleNames()=="[]")
                                                    <select class="form-control" style="min-width: 100px;" name="role">
                                                           <option>No role</option>
                                                           @foreach($role as $key => $rolet)
                                                            <option>{{ $rolet->name }}</option>
                                                           @endforeach
                                                    </select>
                                                @else
                                                    @foreach($user->getRoleNames() as $v)
                                                       <select class="form-control" style="min-width: 100px;" name="role">
                                                           <option selected="">{{ $v }}</option>
                                                           @foreach($role as $key => $rolet)
                                                           @if($rolet->name !== $v)
                                                            <option>{{ $rolet->name }}</option>
                                                            @endif
                                                           @endforeach
                                                       </select>
                                                    @endforeach
                                                
                                                @endif
                                            </td>
                                            <td>
                                                @can('user-edit')
                                                <button class="btn btn-sm btn-success" type="submit">Update</button>
                                                @endcan
                                                </form>
                                                {!! Form::close() !!}
                                                @can('user-delete')
                                                {!! Form::open(['method' => 'DELETE','route' => ['users.destroy', $user->id],'style'=>'display:inline']) !!}
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
                    @can('user-create')
                    <div class="col-md-6 col-lg-4">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">Add User</h4>
                                {!! Form::open(array('route' => 'users.store','method'=>'POST')) !!}
                                    <label>Full Name:</label>
                                    <input type="text" name="full_name" class="form-control mb-2">
                                    <label>Email :</label>
                                    <input type="email" name="email" class="form-control mb-2" autocomplete="off">
                                    <label>Password:</label>
                                    <input type="password" name="password" class="form-control mb-2" autocomplete="off">
                                    <label>Confirm Password :</label>
                                    <input type="password" name="confirm-password" class="form-control mb-2" autocomplete="off">
                                    <label>Role :</label>
                                    {!! Form::select('roles[]', $roles,[], array('class' => 'form-control')) !!}
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