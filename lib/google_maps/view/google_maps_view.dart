import 'package:flightkaracasxy/core/model/flight_model.dart';
import 'package:flightkaracasxy/core/widgets/appbars/app_bar.dart';
import 'package:flightkaracasxy/core/widgets/cards/ped_card.dart';
import 'package:flightkaracasxy/google_maps/management/flight_management.dart';
import 'package:flightkaracasxy/google_maps/management/google_management.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../../core/future_views/base_future_view.dart';
import '../../core/widgets/dividers/row_divider.dart';

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
          appBar: AppBarWidgets(),
          floatingActionButton: _getFloatingActionButton(),
          body: Stack(
            children: const [getBody(), _bottomListView()],
          )),
    );
  }

  AppBar getAppBar() => AppBar(
        title: const Text(""),
      );
}

class _bottomListView extends StatelessWidget {
  const _bottomListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        right: 5,
        left: MediaQuery.of(context).size.width * 0.1,
        height: 100,
        bottom: 20,
        child: GetFutureView<FlightManagement>(
          GetCardOfItem(),
        ));
  }
}

class _getFloatingActionButton extends StatelessWidget {
  const _getFloatingActionButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(onPressed: (() {
      context.read<GoogleManagement>().googleMapController!.moveCamera(
          CameraUpdate.newCameraPosition(const CameraPosition(
              target: LatLng(41.060684, 28.967169), zoom: 15)));
    }));
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
    return GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition:
            const CameraPosition(target: LatLng(38.9637, 35.2433), zoom: 7),
        onMapCreated: (controller) {
          context.read<GoogleManagement>().googleMapController = controller;
        },
        markers: context.read<GoogleManagement>().setMarker());
  }
}

class GetCardOfItem extends StatelessWidget {
  const GetCardOfItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: PageController(viewportFraction: 0.8),
        itemCount: context.read<FlightManagement>().flightModels.length,
        onPageChanged: (int index) {
          var items = context.read<FlightManagement>().flightModels[index];
          context.read<GoogleManagement>().googleMapController!.moveCamera(
              CameraUpdate.newCameraPosition(CameraPosition(
                  target: LatLng(items.lat ?? 0, items.long ?? 0), zoom: 15)));
        },
        scrollDirection: Axis.horizontal,
        itemBuilder: ((contexts, index) {
          final item = context.read<FlightManagement>().flightModels[index];
          return PedCard(
              imageurl: item.detail?.photoUrl ?? "",
              title: item.detail?.name ?? "",
              onPressed: () {
                showModalBottomSheet(
                    enableDrag: true,
                    shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(25))),
                    context: context,
                    builder: (contexts) => _bottomSheet(item));
              });
        }));
  }

  Column _bottomSheet(FlightModel model) => Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          RowDivider(
            colors: Colors.grey,
            indent: 0.45,
          ),
          Image.network(
            model.detail?.photoUrl ?? "",
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
          ),
          Expanded(
            child: Text(model.detail?.description ?? ""),
          )
        ],
      );
}
