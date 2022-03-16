
import 'package:eksi_sozluk/view/maintab/model/auth_data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'auth_model.g.dart';

@JsonSerializable()
class AuthModel extends INetworkModel<AuthModel> {
  bool? success;
  String? message;
  AuthData? data;

  @override
  AuthModel fromJson(Map<String, dynamic> json) {
    return _$AuthModelFromJson(json);
  }

  @override
  Map<String, dynamic>? toJson() {
    return _$AuthModelToJson(this);
  }
}
