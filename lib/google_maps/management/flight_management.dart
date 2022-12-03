import 'package:flightkaracasxy/core/management_core/base_management.dart';
import 'package:flightkaracasxy/core/model/flight_model.dart';
import 'package:flightkaracasxy/google_maps/service/google_service.dart';

class FlightManagement extends BaseManagement {
  FlightManagement() {
    getFlightData();
  }
  List<FlightModel> flightModels = <FlightModel>[];
  final IGoogleService _service = GoogleService();

  getFlightData() async {
    try {
      setLoading();
      var response = await _service.getFlights();
      flightModels = response!;
      setSuccess();
    } catch (e) {
      setError();
    }
  }
}
