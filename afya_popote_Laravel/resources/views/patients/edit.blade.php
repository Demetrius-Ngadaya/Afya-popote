@extends('patients.layout')

@section('content')
    <div class="row">
        <div class="col-lg-12 margin-tb">
            <div class="pull-left">
                <h4>Edit patients status</h4>
            </div>
            <div class="pull-right">
                <a class="btn btn-primary" href="{{ route('patients.index') }}"> Back</a>
            </div>
        </div>
    </div>

    @if ($errors->any())
        <div class="alert alert-danger">
            <strong>Whoops!</strong> There were some problems with your input.<br><br>
            <ul>
                @foreach ($errors->all() as $error)
                    <li>{{ $error }}</li>
                @endforeach
            </ul>
        </div>
    @endif

    <form action="{{ route('patients.update', $patient->id) }}" method="POST">
        @csrf
        @method('PUT')

        <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-12">

                <div class="form-group">
                    <strong>Appointment Status:</strong>
                    <select name="status" class="form-control">
                        <option value="Zilizo_pokelewa" {{ $patient->appointments->first() && $patient->appointments->first()->status == 'Zilizo_pokelewa' ? 'selected' : '' }}>Receive appointment</option>
                        <option value="Nilizo_hudumiwa" {{ $patient->appointments->first() && $patient->appointments->first()->status == 'Nilizo_hudumiwa' ? 'selected' : '' }}>Attended appointment</option>
                        <option value="Nisizo_hudhuria" {{ $patient->appointments->first() && $patient->appointments->first()->status == 'Nisizo_hudhuria' ? 'selected' : '' }}>Not attended appointment</option>
                    </select>
                </div>

            </div>
            <div class="col-xs-12 col-sm-12 col-md-12 text-center">
                <button type="submit" class="btn btn-primary">Submit</button>
            </div>
        </div>

    </form>
@endsection
