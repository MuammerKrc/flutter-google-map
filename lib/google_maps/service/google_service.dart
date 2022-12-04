import 'dart:io';

import 'package:flightkaracasxy/core/model/flight_model.dart';
import 'package:flightkaracasxy/core/services/service_core.dart';

abstract class IGoogleService extends baseService {
  final String _flightUrl = "maps.json";
  Future<List<FlightModel>?> getFlights();
}

class GoogleService extends IGoogleService {
  @override
  Future<List<FlightModel>?> getFlights() async {
    var dio = getDio();
    var response = await dio.get(_flightUrl);

    if (response.statusCode == HttpStatus.ok && response.data != null) {
      return response.data
          .map((e) => FlightModel.fromJson(e))
          .cast<FlightModel>()
          .toList();
    }

    return <FlightModel>[];
  }
}
