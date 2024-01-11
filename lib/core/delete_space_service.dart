import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:parking_space/Models/allocate_vehicle_model.dart';
import 'package:parking_space/constant/app_constants.dart';
import 'package:parking_space/constant/app_strings.dart';

class DeleteSpaceService {

  Future<dynamic> deleteSpace(int spaceID) async {
    const url = AppConstants.baseUrl + AppConstants.deleteRegisteredSpace;
    final uri = Uri.parse(url+"/$spaceID");
    final response = await http.delete(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map<String, dynamic>;
      return json['message'];
    }else{
      return AppStrings.somethingWentWrong;
    }
  }
}
