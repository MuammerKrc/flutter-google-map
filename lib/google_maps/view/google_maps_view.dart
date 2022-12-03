import 'package:flightkaracasxy/core/enums/management_enum.dart';
import 'package:flightkaracasxy/core/management_core/base_management.dart';
import 'package:flightkaracasxy/google_maps/management/flight_management.dart';
import 'package:flightkaracasxy/google_maps/management/google_management.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../../core/future_view_core/base_future_view.dart';

class GoogleMapsView extends StatefulWidget {
  const GoogleMapsView({super.key});
  @override
  State<GoogleMapsView> createState() => _GoogleMapsViewState();

  googleManagmet() {}
}

class _GoogleMapsViewState extends State<GoogleMapsView> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (create) => GoogleManagement(context),
      child: Scaffold(
          floatingActionButton: FloatingActionButton(onPressed: (() {
            context.read<GoogleManagement>().googleMapController!.moveCamera(
                CameraUpdate.newCameraPosition(const CameraPosition(
                    target: LatLng(41.060684, 28.967169), zoom: 15)));
          })),
          body: getBody()),
    );
  }
}

class getBody extends StatelessWidget {
  const getBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetFutureView<GoogleManagement>(GetGoogleMap());
  }
}

class GetGoogleMap extends StatelessWidget {
  const GetGoogleMap({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: const CameraPosition(
                target: LatLng(40.9130116, 29.2094771), zoom: 19),
            onMapCreated: (controller) {
              context.read<GoogleManagement>().googleMapController = controller;
            },
            markers: context.read<GoogleManagement>().setMarker()),
        Positioned(
            right: 0,
            left: 0,
            bottom: 100,
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(10),
                child: GetFutureView<FlightManagement>(GetCardOfItem()),
                width: MediaQuery.of(context).size.width - 100,
                height: 120,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    color: Colors.red),
              ),
            ))
      ],
    );
  }
}

class GetCardOfItem extends StatelessWidget {
  const GetCardOfItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: context.read<FlightManagement>().flightModels.length,
        itemBuilder: ((contextts, index) {
          return Text(contextts
                  .read<FlightManagement>()
                  .flightModels[index + 1]
                  .country ??
              "");
        }));
  }
}
