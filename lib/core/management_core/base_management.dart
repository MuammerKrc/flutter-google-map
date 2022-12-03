import 'package:flightkaracasxy/core/enums/management_enum.dart';
import 'package:flutter/material.dart';

abstract class BaseManagement extends ChangeNotifier {
  ManagementResponse response = ManagementResponse.Loading;

  GetDataOnService(Function function) {
    setLoading();
    try {
      function();
      setSuccess();
    } catch (e) {
      setError();
    }
  }

  setSuccess() {
    response = ManagementResponse.SuccessResponse;
    notifyListeners();
  }

  setError() {
    response = ManagementResponse.ErrorResponse;
    notifyListeners();
  }

  setLoading() {
    response = ManagementResponse.Loading;
    notifyListeners();
  }
}
