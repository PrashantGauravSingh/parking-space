import 'package:json_annotation/json_annotation.dart';

/// This allows the `GetAllocatedVehicleModel` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'allocate_vehicle_model.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable()
class GetAllocatedVehicleModel {
  @JsonKey(name: 'space_id')
  final int? spaceId;
  @JsonKey(name: 'timestamp')
  final String? timeStamp;
  @JsonKey(name: 'vsize')
  final String? vSize;
  @JsonKey(name: 'vname')
  final String? vName;
  @JsonKey(name: 'level')
  final String? level;
  @JsonKey(name: 'bay_id')
  final String? bayId;


  GetAllocatedVehicleModel({this.spaceId, this.timeStamp,this.level,this.vSize,this.vName,this.bayId});

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$GetAllocatedVehicleModelFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory GetAllocatedVehicleModel.fromJson(Map<String, dynamic> json) => _$GetAllocatedVehicleModelFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$GetAllocatedVehicleModelToJson`.
  Map<String, dynamic> toJson() => _$GetAllocatedVehicleModelToJson(this);
}