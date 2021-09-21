import 'package:google_maps_flutter/google_maps_flutter.dart';

class Route {
  final LatLng start;
  final LatLng destination;
  final List<LatLng> waypoints;

  Route({
    required this.start,
    required this.destination,
    this.waypoints = const [],
  });
}
