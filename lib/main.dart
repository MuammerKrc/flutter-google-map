import 'package:flightkaracasxy/google_maps/management/flight_management.dart';
import 'package:flightkaracasxy/google_maps/view/google_maps_view.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => FlightManagement()),
    ], child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'Google Map', home: GoogleMapsView());
  }
}
