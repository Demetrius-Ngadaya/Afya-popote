@extends('layouts.app')

@section('content')
    <div class="content-header">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h4><b>Patient Appointment Details</b></h4>
                </div>
            </div>
        </div>
    </div>

    <div class="container">
        <div class="card">
            <div class="card-body">
                
            <div class="card-body col-md-12">
    <div class="row">
        <div class="col-md-6">
            <!-- Left card -->
            <div class="card">
                <div class="card-body">
                    <!-- Your left card content here -->
                    <div class="col-xs-12 col-sm-12 col-md-12">
                        <div class="form-group">
                            <strong>Patient Names:</strong>
                            {{ optional($appointment->user)->name ?? 'No data' }}
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-12">
                        <div class="form-group">
                            <strong>Patient Phone number:</strong>
                            {{ optional($appointment->user)->email ?? 'No data' }}
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-12">
                        <div class="form-group">
                            <strong>Appointment Date:</strong>
                            {{ $appointment->date }}
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-12">
                        <div class="form-group">
                            <strong>Appointment Day:</strong>
                            {{ $appointment->day }}
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-12">
                        <div class="form-group">
                            <strong>Patient age:</strong>
                            {{ optional($appointment->user)->age ?? 'No data' }}
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-12">
                        <div class="form-group">
                            <strong>Patient gender:</strong>
                            {{ optional($appointment->user)->gender ?? 'No data' }}
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-12">
                        <div class="form-group">
                            <strong>Patient nationality:</strong>
                            {{ optional($appointment->user)->nationality ?? 'No data' }}
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-12">
                        <div class="form-group">
                            <strong>Patient region:</strong>
                            {{ optional($appointment->user)->region ?? 'No data' }}
                        </div>
                    </div>                    
                </div>
            </div>
        </div>

        <div class="col-md-6">
            <!-- Right card -->
            <div class="card">
                <div class="card-body">
                    <!-- Your right card content here -->
                    <div class="col-xs-12 col-sm-12 col-md-12">
                        <div class="form-group">
                            <strong>Patient district:</strong>
                            {{ optional($appointment->user)->district ?? 'No data' }}
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-12">
                        <div class="form-group">
                            <strong>Patient ward:</strong>
                            {{ optional($appointment->user)->ward ?? 'No data' }}
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-12">
                        <div class="form-group">
                            <strong>Patient disability:</strong>
                            {{ optional($appointment->user)->disability ?? 'No data' }}
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-12">
                        <div class="form-group">
                            <strong>Patient occupation:</strong>
                            {{ optional($appointment->user)->occupation ?? 'No data' }}
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-12">
                        <div class="form-group">
                            <strong>Appointment Made to:</strong>
                            {{ optional($appointment->doctor)->category ?? 'No data' }}
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-12">
                        <div class="form-group">
                            <strong>Appointment Made on:</strong>
                            {{ $appointment->created_at }}
                        </div>
                    </div>
                    <form action="{{ route('patients.update_receive', $patient->id) }}" method="POST" class="w-100">
                        @csrf
                        @method('PUT')

                        <div class="col-xs-12 col-sm-12 col-md-12">
                            <div class="form-group">
                                <strong>Appointment Status:</strong>
                                <select name="status" class="form-control">
                                    <option value="Zilizo_pokewa" {{ $patient->appointments->first() && $patient->appointments->first()->status == 'Zilizo_pokewa' ? 'selected' : '' }}>Receive appointment</option>
                                    <option value="Zilizo_hudumiwa" {{ $patient->appointments->first() && $patient->appointments->first()->status == 'Zilizo_hudumiwa' ? 'selected' : '' }}>Attended appointment</option>
                                    <option value="Zisizo_hudhuririwa" {{ $patient->appointments->first() && $patient->appointments->first()->status == 'Zisizo_hudhuririwa' ? 'selected' : '' }}>Not attended appointment</option>
                                </select>
                            </div>
                        </div>

                            <div class="col-xs-12 col-sm-12 col-md-12 text-center">
                                <a class="btn btn-primary" href="{{ route('receive') }}"> Back</a>
                                <button type="submit" class="btn btn-primary">Save</button>
                            </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>


            </div>
        </div>
    </div>
@endsection
