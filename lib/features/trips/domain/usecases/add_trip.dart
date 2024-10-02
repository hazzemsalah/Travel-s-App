import 'package:trips_app/features/trips/domain/entities/trip.dart';
import 'package:trips_app/features/trips/domain/repos/trip_repository.dart';

class AddTrip {
  final TripRepository repository;
  AddTrip(this.repository);

  Future<void> call(Trip trip){
    return repository.addTrip(trip);
  }
}