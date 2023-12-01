@extends('layouts.app')

@section('content')
    <!-- Main content -->
    <div class="content py-3">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                </div>
            </div>
            <div class="alert alert-info">
                        List of all Received Appointments 
                    </div>

            @if ($message = Session::get('success'))
                <div class="alert alert-success">
                    <p>{{ $message }}</p>
                </div>
            @endif
        
            <table id="example" class="table table-striped table-bordered nowrap" style="width:100%">
                <tr>
                    <th>No</th>
                    <th>Name</th>
                    <th>Phone</th>
                    <th>Appointment Date</th>
                    <th>Appointment Day</th>
                    <th>Type of Doctor</th>
                    <th>Action</th>
                </tr>
                @foreach ($receivedAppointmentsCount as $appointment)
    <tr>
        <td>{{ ++$i }}</td>
        <td>{{ optional($appointment->user)->name ?? 'No data' }}</td>
        <td>{{ optional($appointment->user)->email ?? 'No data' }}</td>
        <td>{{ $appointment->date }}</td>
        <td>{{ $appointment->day }}</td>
        <td>{{ optional($appointment->doctor)->category ?? 'No data' }}</td>
        <td>           
        <a class="btn btn-info" href="{{ route('patients.appointments.show', ['patient' => $appointment->user->id, 'appointment' => $appointment->id]) }}">Show</a>

          </td>
    </tr>
@endforeach
            </table>
        </div><!-- /.container-fluid -->
    </div>
    <!-- /.content -->
@endsection
