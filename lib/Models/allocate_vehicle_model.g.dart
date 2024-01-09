// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'allocate_vehicle_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllocatedVehicleModel _$GetAllocatedVehicleModelFromJson(
        Map<String, dynamic> json) =>
    GetAllocatedVehicleModel(
      spaceId: json['space_id'] as int?,
      timeStamp: json['timestamp'] as String?,
      level: json['level'] as String?,
      vSize: json['vsize'] as String?,
      vName: json['vname'] as String?,
      bayId: json['bay_id'] as String?,
    );

Map<String, dynamic> _$GetAllocatedVehicleModelToJson(
        GetAllocatedVehicleModel instance) =>
    <String, dynamic>{
      'space_id': instance.spaceId,
      'timestamp': instance.timeStamp,
      'vsize': instance.vSize,
      'vname': instance.vName,
      'level': instance.level,
      'bay_id': instance.bayId,
    };
