import 'package:trips_app/features/trips/domain/entities/trip.dart';
import 'package:trips_app/features/trips/domain/repos/trip_repository.dart';

class GetTrips {
  final TripRepository repository;
  GetTrips(this.repository);

  Future<List<Trip>> call(){
    return repository.getTrips();
  }
}