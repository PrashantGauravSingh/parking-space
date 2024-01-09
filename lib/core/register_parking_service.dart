import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:parking_space/Models/register_space_model.dart';
import 'package:parking_space/constant/app_constants.dart';

class RegisterParkingService {

  Future<dynamic> registerParking(GetRegisterSpaceModel registerSpaceModel) async {
    const url = AppConstants.baseUrl + AppConstants.space;
    final uri = Uri.parse(url);
print(uri);
print(registerSpaceModel.spaceName);
    final response = await http.post(uri, body: registerSpaceModel as List);
    print(response.toString());
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;
      return json;
    }
  }
}