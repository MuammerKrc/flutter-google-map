import 'dart:io';

import 'package:flightkaracasxy/core/model/flight_model.dart';
import 'package:flightkaracasxy/core/service_core/service_core.dart';

abstract class IGoogleService extends baseService {
  final String _flightUrl = "users.json";

  Future<List<FlightModel>> getFlights();
}

class GoogleService extends IGoogleService {
  @override
  Future<List<FlightModel>> getFlights() async {
    var dio = await getDio();

    var response = await dio.get(_flightUrl);

    if (response.statusCode == HttpStatus.ok && response.data != null) {
      print(response.data);
    }
    return <FlightModel>[];
  }
}
