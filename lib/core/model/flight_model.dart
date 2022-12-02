import 'package:flightkaracasxy/core/model/Detail_model.dart';

class FlightModel {
  String? country;
  DetailModel? detail;
  double? lat;
  double? long;

  FlightModel({this.country, this.detail, this.lat, this.long});

  FlightModel.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    detail = json['detail'] != null
        ? new DetailModel.fromJson(json['detail'])
        : null;
    lat = json['lat'];
    long = json['long'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country'] = this.country;
    if (this.detail != null) {
      data['detail'] = this.detail!.toJson();
    }
    data['lat'] = this.lat;
    data['long'] = this.long;
    return data;
  }
}
