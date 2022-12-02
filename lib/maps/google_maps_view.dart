import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapsView extends StatefulWidget {
  const GoogleMapsView({super.key});

  @override
  State<GoogleMapsView> createState() => _GoogleMapsViewState();
}

class _GoogleMapsViewState extends State<GoogleMapsView> {
  @override
  Widget build(BuildContext context) {
    final CameraPosition kartalPos =
        CameraPosition(zoom: 19, target: LatLng(40.9130116, 29.2094771));

    BitmapDescriptor? bikingIcon;

    Set<Marker> _setMarker() {
      return <Marker>{
        Marker(
          markerId: MarkerId("CustomizeMarker"),
          position: kartalPos.target,
          icon: bikingIcon!,
          infoWindow: InfoWindow(title: "Cadde form"),
          onTap: () {
            print("Cadde forma hoşgeldiniz!");
          },
        )
      };
    }

    Future<BitmapDescriptor> _createMarkerImageFromAsset(
        BuildContext context) async {
      if (bikingIcon == null) {
        final ImageConfiguration imageConfiguration =
            createLocalImageConfiguration(context);
        var bitmap = await BitmapDescriptor.fromAssetImage(
            ImageConfiguration(
              devicePixelRatio: 0.2,
            ),
            "assets/images/biking2.png");
        bikingIcon = bitmap;
        return bitmap;
      }
      return bikingIcon!;
    }

    return Scaffold(
        body: FutureBuilder(
      future: _createMarkerImageFromAsset(context),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: CameraPosition(
                  target: LatLng(40.9130116, 29.2094771), zoom: 19),
              onMapCreated: (controller) {},
              markers: _setMarker());
        } else {
          return CircularProgressIndicator();
        }
      },
    ));
  }
}
