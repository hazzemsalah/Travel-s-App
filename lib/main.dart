import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:trips_app/features/trips/data/models/trip_model.dart';
import 'package:trips_app/features/trips/presentation/pages/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // initialize Hive
  await Hive.initFlutter((await getApplicationDocumentsDirectory()).path);
  Hive.registerAdapter(TripModelAdapter());
  await Hive.openBox<TripModel>('trips');

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Travel's App",
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}
