import 'package:flutter/material.dart';
import 'package:parking_space/Models/register_space_model.dart';
import 'package:parking_space/core/register_space_service.dart';

class RegisterSpaceProvider extends ChangeNotifier {
  final _service = RegisterSpaceService();
  bool isLoading = false;
   List<GetRegisterSpaceModel> _getRegisterSpaceModel = [];
  List<GetRegisterSpaceModel> get getRegisterSpaceModel => _getRegisterSpaceModel;

  Future<void> getAllRegisteredSpace() async {
    isLoading = true;
    notifyListeners();
    final response = await _service.getAllRegisteredSpace();

    _getRegisterSpaceModel = response;
    isLoading = false;
    notifyListeners();
  }
}