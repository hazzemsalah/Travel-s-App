import 'package:trips_app/features/trips/domain/entities/trip.dart';

abstract class TripRepository {
  Future<Trip> getTrips();
  Future<void> addTrip(Trip travel);
  Future<void> deletTrip(int index);
}