import 'package:trips_app/features/trips/data/datasources/trip_local_datasource.dart';
import 'package:trips_app/features/trips/data/models/trip_model.dart';
import 'package:trips_app/features/trips/domain/entities/trip.dart';
import 'package:trips_app/features/trips/domain/repos/trip_repository.dart';

class TripRepositoryImpl implements TripRepository {
  final TripLocalDatasource localDataSource;

  TripRepositoryImpl(this.localDataSource);

  @override
  Future<void> addTrip(Trip trip) async {
    final tripModel = TripModel.fromEntity(trip);
    localDataSource.addTrip(tripModel);
  }

  @override
  Future<void> deletTrip(int index) async {
    localDataSource.deleteTrip(index);
  }

  @override
  Future<List<Trip>> getTrips() async {
    final tripModel = localDataSource.getTrips();
    List<Trip> res = tripModel.map((model) => model.toEntity()).toList();
    return res;
  }
}
