import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:parking_space/Models/register_space_model.dart';
import 'package:parking_space/constant/app_constants.dart';

class RegisterSpaceService {

  Future<List<GetRegisterSpaceModel>> getAllRegisteredSpace() async {
    const url = AppConstants.baseUrl+AppConstants.space;
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;
      final registerSpace = json.map((e) {
        return GetRegisterSpaceModel(
          id: e['id'],
          spaceName: e['space_name'],
        );
      }).toList();
      return registerSpace;
    }
    return [];
    // throw "Something went wrong";
  }
}
