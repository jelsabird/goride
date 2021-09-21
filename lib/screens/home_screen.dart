import 'package:flutter/material.dart';
import 'package:goride/screens/google_maps_screen.dart';

import 'mapbox_screen.dart';
import 'openstreetmap_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  void _googleMaps() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => GoogleMapsScreen()));
  }

  void _openStreetMap() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => OpenStreetMapScreen()));
  }

  void _mapBox() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => MapboxScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter map demo')),
      body: Column(
        children: [
          InkWell(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://sm.pcmag.com/t/pcmag_uk/review/g/google-map/google-maps_gmbp.3840.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            onTap: _googleMaps,
          ),
          InkWell(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://automating-gis-processes.github.io/site/develop/_images/OSM_logo.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            onTap: _openStreetMap,
          ),
          InkWell(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1f/Mapbox_logo_2019.svg/1024px-Mapbox_logo_2019.svg.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            onTap: _mapBox,
          ),
        ],
      ),
    );
  }
}
