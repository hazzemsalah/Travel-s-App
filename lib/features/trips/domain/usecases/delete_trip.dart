import 'package:trips_app/features/trips/domain/repos/trip_repository.dart';

class DeleteTrip {
  final TripRepository repository;
  DeleteTrip(this.repository);

  Future<void> call(int index){
    return repository.deletTrip(index);
  }
}