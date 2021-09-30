import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_mapbox_navigation/library.dart';

class MapboxScreen extends StatefulWidget {
  @override
  _MapboxScreenState createState() => _MapboxScreenState();
}

class _MapboxScreenState extends State<MapboxScreen> {
  final _source = WayPoint(
      name: "Source",
      latitude: 58.96051425865622,
      longitude: 5.710915382344477);
  final _stop1 = WayPoint(
      name: "Way Point 1",
      latitude: 58.95430478380219,
      longitude: 5.719545288009343);
  final _stop2 = WayPoint(
      name: "Way Point 2",
      latitude: 58.95541424517902,
      longitude: 5.70339188390381);
  final _destination = WayPoint(
      name: "Destination",
      latitude: 58.96045135975318,
      longitude: 5.7107120744034265);

  late MapBoxOptions _options;
  late MapBoxNavigationViewController _controller;

  @override
  void initState() {
    super.initState();
    initialize();
  }

  Future<void> initialize() async {
    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    _options = MapBoxOptions(
        zoom: 14.0,
        tilt: 0.0,
        bearing: 30.0,
        enableRefresh: false,
        alternatives: true,
        voiceInstructionsEnabled: true,
        bannerInstructionsEnabled: true,
        allowsUTurnAtWayPoints: true,
        mode: MapBoxNavigationMode.cycling,
        units: VoiceUnits.metric,
        simulateRoute: false,
        animateBuildRoute: false,
        longPressDestinationEnabled: true,
        language: "no");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mapbox'),
      ),
      body: Center(
        child: Column(children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.grey,
              child: MapBoxNavigationView(
                  options: _options,
                  onRouteEvent: _onEmbeddedRouteEvent,
                  onCreated: (MapBoxNavigationViewController controller) async {
                    _controller = controller;
                    controller.initialize();

                    var wayPoints = <WayPoint>[];
                    wayPoints.add(_source);
                    wayPoints.add(_stop1);
                    wayPoints.add(_stop2);
                    wayPoints.add(_destination);

                    _controller.buildRoute(wayPoints: wayPoints);
                  }),
            ),
          )
        ]),
      ),
    );
  }

  Future<void> _onEmbeddedRouteEvent(e) async {
    switch (e.eventType) {
      case MapBoxEvent.progress_change:
        break;
      case MapBoxEvent.route_building:
      case MapBoxEvent.route_built:
        setState(() {});
        break;
      case MapBoxEvent.route_build_failed:
        setState(() {});
        break;
      case MapBoxEvent.navigation_running:
        setState(() {});
        break;
      case MapBoxEvent.on_arrival:
        break;
      case MapBoxEvent.navigation_finished:
      case MapBoxEvent.navigation_cancelled:
        setState(() {});
        break;
      default:
        break;
    }
    setState(() {});
  }
}
