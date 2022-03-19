import 'package:eksi_sozluk/view/maintab/model/authdata.dart';
import 'package:vexana/vexana.dart';

class AuthModel extends INetworkModel<AuthModel>{
  AuthModel({
    this.success,
    this.message,
    this.data,
  });

  bool? success;
  String? message;
  AuthData? data;

  AuthModel fromJson(Map<String, dynamic> json) => AuthModel(
        success: json["Success"] == null ? null : json["Success"],
        message: json["Message"] == null ? null : json["Message"],
        data: json["Data"] == null ? null : AuthData.fromJson(json["Data"]),
      );

  Map<String, dynamic> toJson() => {
        "Success": success == null ? null : success,
        "Message": message == null ? null : message,
        "Data": data == null ? null : data!.toJson(),
      };
}
