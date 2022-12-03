import 'package:flightkaracasxy/core/management_core/base_management.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleManagement extends BaseManagement {
  BuildContext context;
  GoogleManagement(this.context) {
    createMarkerImageFromAsset(context);
  }
  GoogleMapController? googleMapController;
  final CameraPosition kartalPos =
      const CameraPosition(zoom: 19, target: LatLng(40.9130116, 29.2094771));

  BitmapDescriptor? bikingIcon;

  Set<Marker> setMarker() {
    return <Marker>{
      Marker(
        markerId: const MarkerId("CustomizeMarker"),
        position: kartalPos.target,
        icon: bikingIcon!,
        infoWindow: const InfoWindow(title: "Cadde form"),
        onTap: () {
          print("Cadde forma hoşgeldiniz!");
        },
      )
    };
  }

  Future<BitmapDescriptor> createMarkerImageFromAsset(
      BuildContext context) async {
    setLoading();
    if (bikingIcon == null) {
      final ImageConfiguration imageConfiguration =
          createLocalImageConfiguration(context);
      var bitmap = await BitmapDescriptor.fromAssetImage(
          ImageConfiguration(
            devicePixelRatio: 0.2,
          ),
          "assets/images/biking2.png");
      bikingIcon = bitmap;
      setSuccess();
      return bitmap;
    }
    setSuccess();
    return bikingIcon!;
  }
}
