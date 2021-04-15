import 'package:freezed_annotation/freezed_annotation.dart';

part 'response_model.freezed.dart';
part 'response_model.g.dart';

@freezed
abstract class ResponseModel implements _$ResponseModel {
  // @JsonSerializable(anyMap: true, fieldRename: FieldRename.snake)
  const factory ResponseModel({
    required int userId,
    required int id,
    required String title,
    required String body,
  }) = _ResponseModel;

  const ResponseModel._();

  factory ResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ResponseModelFromJson(json);
}
