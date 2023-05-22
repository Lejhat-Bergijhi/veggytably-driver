import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

import '../controllers/map_controller.dart';

class MapPage extends StatelessWidget {
  final GeoController geoController = Get.put(GeoController());

  MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Map"),
      ),
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              center: LatLng(-7.758668, 110.3806492),
              zoom: 13.0,
            ),
            children: [
              // Map Layer
              TileLayer(
                urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                userAgentPackageName: 'dev.fleaflet.flutter_map.example',
              ),
              // Marker
              MarkerLayer(
                markers: [
                  // start marker
                  Marker(
                    point: LatLng(-7.758668, 110.3806492),
                    width: 80,
                    height: 80,
                    builder: (context) => IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.location_on),
                      color: Colors.green,
                      iconSize: 45,
                    ),
                  ),
                  // end marker
                  Marker(
                    point: LatLng(-7.7674489, 110.3761053),
                    width: 80,
                    height: 80,
                    builder: (context) => IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.location_on),
                      color: Colors.red,
                      iconSize: 45,
                    ),
                  ),
                  // self marker
                  Marker(
                    point: geoController.currentPosition,
                    width: 80,
                    height: 80,
                    builder: (context) => IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.person_pin_circle),
                      color: Colors.blue,
                      iconSize: 45,
                    ),
                  ),
                ],
              )
            ],
          ),
          Obx(
            () => Text(
              "Current Position: ${geoController.currentPosition}",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
