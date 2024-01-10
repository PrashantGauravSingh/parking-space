import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:parking_space/Models/allocate_vehicle_model.dart';
import 'package:parking_space/constant/app_constants.dart';
import 'package:parking_space/constant/app_strings.dart';

class DeleteSlotService {

  Future<dynamic> deleteSlotParking(String bayID) async {
    const url = AppConstants.baseUrl + AppConstants.deleteAllocatedBay;
    final uri = Uri.parse(url+"/$bayID");
    print(uri.toString());
    final response = await http.delete(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map<String, dynamic>;
      return json['message'];
    }else{
      print(AppStrings.somethingWentWrong);

      return AppStrings.somethingWentWrong;
    }
  }
}
