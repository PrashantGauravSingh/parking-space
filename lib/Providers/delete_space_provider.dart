import 'package:flutter/material.dart';
import 'package:parking_space/core/delete_slot_service.dart';
import 'package:parking_space/core/delete_space_service.dart';
import 'package:parking_space/presentation/widget/show_toast_widget.dart';

class DeleteSpaceProvider extends ChangeNotifier {
  final _service = DeleteSpaceService();
  bool isLoading = false;
  dynamic _getDeleteSpaceModel;
  dynamic get getRegisterSpaceModel => _getDeleteSpaceModel;

  Future<void> deleteSpace(int spaceID) async {
    isLoading = true;
    notifyListeners();
    final response = await _service.deleteSpace(spaceID);
    _getDeleteSpaceModel = response;
    isLoading = false;
    ToastWidget().showToastWidget(_getDeleteSpaceModel, Colors.green);
    notifyListeners();
  }
}