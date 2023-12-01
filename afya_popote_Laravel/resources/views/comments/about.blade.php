@extends('layouts.app')

@section('content')
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1 class="m-0">{{ __('About us') }}</h1>
                </div><!-- /.col -->
            </div><!-- /.row -->
        </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <div class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-body">
                            



                            {{-- check reviews is not empty --}}
                                @if(isset($reviews) && !$reviews->isEmpty())
                                    <ul class="list-group">
                                        @foreach ($reviews as $review)
                                            @if(isset($review->reviews) && $review->reviews != '')
                                                <li class="list-group-item border-0 d-flex p-4 mb-2 bg-gray-100 border-radius-lg">
                                                    <div class="d-flex flex-column">
                                                        <h6 class="mb-3 text-sm">{{ $review->reviewed_by }}</h6>
                                                        <div class="flex justify-between">
                                                            <span class="mb-2 text-xs">{{ $review->reviews ?? '-' }}</span>
                                                            <span class="mb-2 text-xs">{{ $review->created_at ?? '-' }}</span>
                                                        </div>
                                                    </div>
                                                </li>
                                            @endif

                                        @endforeach
                                    </ul>
                                @else
                                    <div class="border-0 d-flex p-4 mb-2 mt-3 bg-gray-100 border-radius-lg">
                                        <h6 class="mb-3 text-sm">No Reviews Yet!</h6>
                                    </div>
                                @endif

                        </div>
                    </div>
                </div>
            </div>
            <!-- /.row -->
        </div><!-- /.container-fluid -->
    </div>
    <!-- /.content -->
@endsection