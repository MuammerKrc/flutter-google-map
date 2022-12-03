import 'package:flightkaracasxy/core/management_core/base_management.dart';
import 'package:flightkaracasxy/core/model/flight_model.dart';
import 'package:flightkaracasxy/google_maps/service/google_service.dart';

class GoogleManagement extends BaseManagement {
  GoogleManagement() {
    getFlightData();
  }
  List<FlightModel> flightModels = <FlightModel>[];
  final IGoogleService _service = GoogleService();

  getFlightData() async {
    try {
      setLoading();
      flightModels = await _service.getFlights();
      setSuccess();
    } catch (e) {
      setError();
    }
  }
}
