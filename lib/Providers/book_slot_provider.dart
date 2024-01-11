import 'package:flutter/material.dart';
import 'package:parking_space/Models/allocate_vehicle_model.dart';
import 'package:parking_space/core/book_slot_service.dart';
import 'package:parking_space/presentation/widget/show_toast_widget.dart';

class BookSlotProvider extends ChangeNotifier {
  final _service = BookSlotService();
  bool isLoading = false;
  dynamic _getBookSlotModel;
  dynamic get getRegisterSpaceModel => _getBookSlotModel;

  Future<void> bookSlot(GetAllocatedVehicleModel allocatedVehicleModel) async {
    isLoading = true;
    notifyListeners();
    final response = await _service.bookSlotParking(allocatedVehicleModel);
    _getBookSlotModel = response;

    ToastWidget().showToastWidget(_getBookSlotModel, Colors.green);
    isLoading = false;
    notifyListeners();
  }
}