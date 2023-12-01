@extends('layouts.app')

@section('content')
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="alert alert-info">
            Patients Comments
        </div>
    </div>
    <div class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    @if(isset($reviews) && !$reviews->isEmpty())
                        @foreach ($reviews as $review)
                            @if(isset($review->reviews) && $review->reviews != '')
                                <div class="card mb-4">
                                    <div class="card-body">
                                        <span class="mb-2 text-xs">{{ $review->created_at ?? '-' }}</span>
                                        <p class="mb-2 text-xs">{{ $review->reviews ?? '-' }}</p>
                                    </div>
                                </div>
                            @endif
                        @endforeach
                    @else
                        <div class="card">
                            <div class="card-body">
                                <h6 class="mb-3 text-sm">No Reviews Yet!</h6>
                            </div>
                        </div>
                    @endif
                </div>
            </div>
            <!-- /.row -->
        </div><!-- /.container-fluid -->
    </div>
    <!-- /.content -->
@endsection
