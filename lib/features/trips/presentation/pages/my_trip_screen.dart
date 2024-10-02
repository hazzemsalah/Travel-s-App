import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:trips_app/features/trips/presentation/providers/trip_provide.dart';
import 'package:trips_app/features/trips/presentation/widgets/custom_seatch_bar.dart';
import 'package:trips_app/features/trips/presentation/widgets/travel_card.dart';



class MyTripsScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //ref.read(tripListNotifierProvider.notifier).loadTrips();
    final tripList = ref.watch(tripListNotifierProvider);

    return SingleChildScrollView(
      physics: const ScrollPhysics(),
      child: Column(
        children: [
          CustomSearchBar(),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: tripList.length,
            itemBuilder: (context, index) {
              final trip = tripList[index];
              return TravelCard(
                imageUrl: trip.photos.isNotEmpty ? trip.photos[0] : 'https://images.unsplash.com/photo-1499856871958-5b9627545d1a?auto=format&fit=crop&q=60&w=500&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8MXx8fGVufDB8fHx8fA%3D%3D',
                title: trip.title,
                description: trip.description,
                date: DateFormat.yMMMEd().format(trip.date).toString(),
                location: trip.location,
                onDelete: (){
                  ref.read(tripListNotifierProvider.notifier).removeTrip(index);
                  ref.read(tripListNotifierProvider.notifier).loadTrips();
                },
              );
            },
          ),
        ],
      ),
    );
  }
}