import 'package:json_annotation/json_annotation.dart';

/// This allows the `GetRegisterSpaceModel` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'register_space_model.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable()
class GetRegisterSpaceModel {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'space_name')
  final String? spaceName;


  GetRegisterSpaceModel({this.id, this.spaceName,});

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$GetRegisterSpaceModelFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory GetRegisterSpaceModel.fromJson(Map<String, dynamic> json) => _$GetRegisterSpaceModelFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$GetRegisterSpaceModelToJson`.
  Map<String, dynamic> toJson() => _$GetRegisterSpaceModelToJson(this);
}