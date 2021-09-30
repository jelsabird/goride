import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_tappable_polyline/flutter_map_tappable_polyline.dart';
import 'package:latlong2/latlong.dart';

class OpenStreetMapScreen extends StatefulWidget {
  @override
  _OpenStreetMapScreenState createState() => _OpenStreetMapScreenState();
}

class _OpenStreetMapScreenState extends State<OpenStreetMapScreen> {
  List<LatLng> points = <LatLng>[
    LatLng(58.96051425865622, 5.710915382344477),
    LatLng(58.95430478380219, 5.719545288009343),
    LatLng(58.95541424517902, 5.70339188390381),
    LatLng(58.96045135975318, 5.7107120744034265),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OpenStreetMaps'),
      ),
      body: FlutterMap(
        options: MapOptions(
          plugins: [
            TappablePolylineMapPlugin(),
          ],
          center: LatLng(58.96051425865622, 5.710915382344477),
          zoom: 14.0,
        ),
        layers: [
          TileLayerOptions(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c'],
          ),
          MarkerLayerOptions(
            markers: [
              Marker(
                width: 80.0,
                height: 80.0,
                point: LatLng(58.96051425865622, 5.710915382344477),
                builder: (ctx) => Container(
                  child: Image.asset('icons/destination_map_marker.png'),
                ),
              ),
              Marker(
                width: 80.0,
                height: 80.0,
                point: LatLng(58.96045135975318, 5.7107120744034265),
                builder: (ctx) => Container(
                  child: Image.asset('icons/destination_map_marker.png'),
                ),
              ),
            ],
          ),
          TappablePolylineLayerOptions(
              // Will only render visible polylines, increasing performance
              polylineCulling: true,
              pointerDistanceTolerance: 20,
              polylines: [
                TaggedPolyline(
                  tag: 'My Polyline',
                  // An optional tag to distinguish polylines in callback
                  points: points,
                  color: Colors.blue,
                  strokeWidth: 8.0,
                ),
              ],
              onTap: (polylines, tapPosition) => print('Tapped: ' +
                  polylines.map((polyline) => polyline.tag).join(',') +
                  ' at ' +
                  tapPosition.globalPosition.toString()),
              onMiss: (tapPosition) {
                print('No polyline was tapped at position ' +
                    tapPosition.globalPosition.toString());
              })
        ],
      ),
    );
  }
}
