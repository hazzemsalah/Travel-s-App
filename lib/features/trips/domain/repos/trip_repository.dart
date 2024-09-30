import 'package:trips_app/features/trips/domain/entities/trip.dart';

abstract class TripRepository {
  Future<List<Trip>> getTrips();
  Future<void> addTrip(Trip trip);
  Future<void> deletTrip(int index);
}