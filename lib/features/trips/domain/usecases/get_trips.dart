import 'package:dartz/dartz.dart';
import 'package:trips_app/core/failure.dart';
import 'package:trips_app/features/trips/domain/entities/trip.dart';
import 'package:trips_app/features/trips/domain/repos/trip_repository.dart';

class GetTrips {
  final TripRepository repository;
  GetTrips(this.repository);

  Future<Either<Failure, List<Trip>>> call(){
    return repository.getTrips();
  }
}