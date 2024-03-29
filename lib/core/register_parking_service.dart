import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:parking_space/Models/register_space_model.dart';
import 'package:parking_space/constant/app_constants.dart';
import 'package:parking_space/constant/app_strings.dart';

class RegisterParkingService {

  Future<dynamic> registerParking(
      GetRegisterSpaceModel registerSpaceModel) async {
    const url = AppConstants.baseUrl + AppConstants.space;
    final uri = Uri.parse(url);
    final response = await http.post(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'id': registerSpaceModel.id,
          'space_name': registerSpaceModel.spaceName
        }));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map<String, dynamic>;
      return json['message'];
    }else{
      return AppStrings.somethingWentWrong;
    }
  }
}
