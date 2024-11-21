import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

void main() => runApp(MiMapaApp());

class MiMapaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ejemplo OpenStreetMap',
      home: MapaPagina(),
    );
  }
}

class MapaPagina extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OpenStreetMap con Flutter'),
      ),
      body: FlutterMap(
        options: MapOptions(
          initialCenter: LatLng(-16.4897, -68.1193), // La Paz
          initialZoom: 6.0,
        ),
        children: [
          TileLayer(
            urlTemplate:
                'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
            subdomains: ['a', 'b', 'c'],
            userAgentPackageName: 'com.ejemplo.mi_mapa_openstreetmap',
          ),
          MarkerLayer(
            markers: [
              Marker(
                point: LatLng(-16.4897, -68.1193), // La Paz
                width: 80,
                height: 80,
                child: Icon(
                  Icons.location_on,
                  color: Colors.red,
                  size: 40,
                ),
              ),
              Marker(
                point: LatLng(-17.3935, -66.1570), // Cochabamba
                width: 80,
                height: 80,
                child: Icon(
                  Icons.location_on,
                  color: Colors.blue,
                  size: 40,
                ),
              ),
              Marker(
                point: LatLng(-17.7863, -63.1812), // Santa Cruz de la Sierra
                width: 80,
                height: 80,
                child: Icon(
                  Icons.location_on,
                  color: Colors.green,
                  size: 40,
                ),
              ),
            ],
          ),
          PolylineLayer(
            polylines: [
              Polyline(
                points: [
                  LatLng(-16.4897, -68.1193), // La Paz
                  LatLng(-17.3935, -66.1570), // Cochabamba
                  LatLng(-17.7863, -63.1812), // Santa Cruz de la Sierra
                ],
                strokeWidth: 4.0,
                color: Colors.purple,
              ),
            ],
          ),
          PolygonLayer(
            polygons: [
              Polygon(
                points: [
                  LatLng(-16.4897, -68.1193), // La Paz
                  LatLng(-17.3935, -66.1570), // Cochabamba
                  LatLng(-17.7863, -63.1812), // Santa Cruz de la Sierra
                ],
                borderColor: Colors.orange,
                borderStrokeWidth: 3.0,
                color: Colors.orange.withOpacity(0.3),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
