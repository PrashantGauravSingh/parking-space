import 'package:flutter/material.dart';
import 'package:parking_space/Models/allocate_vehicle_model.dart';
import 'package:parking_space/core/delete_slot_service.dart';
import 'package:parking_space/presentation/widget/show_toast_widget.dart';

class DeleteSlotProvider extends ChangeNotifier {
  final _service = DeleteSlotService();
  bool isLoading = false;
  dynamic _getBookSlotModel;
  dynamic get getRegisterSpaceModel => _getBookSlotModel;

  Future<void> deleteSlot(String bayID) async {
    isLoading = true;
    notifyListeners();
    final response = await _service.deleteSlotParking(bayID);
    _getBookSlotModel = response;
    isLoading = false;
    ToastWidget().showToastWidget(_getBookSlotModel, Colors.green);
    notifyListeners();
  }
}