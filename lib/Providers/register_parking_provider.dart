import 'package:flutter/material.dart';
import 'package:parking_space/Models/register_space_model.dart';
import 'package:parking_space/core/register_parking_service.dart';
import 'package:parking_space/core/register_space_service.dart';

class RegisterParkingProvider extends ChangeNotifier {
  final _service = RegisterParkingService();
  bool isLoading = false;
  List<GetRegisterSpaceModel> _getRegisterSpaceModel = [];
  List<GetRegisterSpaceModel> get getRegisterSpaceModel => _getRegisterSpaceModel;

  Future<void> registerParkingSpace(GetRegisterSpaceModel registerSpaceModel) async {
    isLoading = true;
    notifyListeners();
    final response = await _service.registerParking(registerSpaceModel);

    _getRegisterSpaceModel = response;
    isLoading = false;
    notifyListeners();
  }
}