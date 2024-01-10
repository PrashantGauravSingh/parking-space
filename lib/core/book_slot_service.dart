import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:parking_space/Models/allocate_vehicle_model.dart';
import 'package:parking_space/constant/app_constants.dart';
import 'package:parking_space/constant/app_strings.dart';

class BookSlotService {

  Future<dynamic> bookSlotParking(GetAllocatedVehicleModel allocatedVehicleModel) async {
    const url = AppConstants.baseUrl + AppConstants.spaceAllocation;
    final uri = Uri.parse(url);
    final response = await http.post(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'space_id': allocatedVehicleModel.spaceId,
          'level': allocatedVehicleModel.level,
          'timestamp': allocatedVehicleModel.timeStamp,
          'vsize': allocatedVehicleModel.vSize,
          'vname': allocatedVehicleModel.vName,
          'bay_id':allocatedVehicleModel.bayId

        }));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map<String, dynamic>;
      return json['message'];
    }else{
      return AppStrings.somethingWentWrong;
    }
  }
}
