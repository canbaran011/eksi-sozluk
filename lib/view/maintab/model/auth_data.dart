import 'package:json_annotation/json_annotation.dart';



@JsonSerializable()
class AuthData {
  String? rank;
  String? accessToken;
  String? tokenType;
  String? expiresIn;
  

  AuthData(
      {this.rank,
      this.accessToken,
      this.tokenType,
      this.expiresIn});

  AuthData.fromJson(Map<String, dynamic> json) {
    rank = json['rank'];
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    expiresIn = json['expires_in'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rank'] = this.rank;
    data['access_token'] = this.accessToken;
    data['token_type'] = this.tokenType;
    data['expires_in'] = this.expiresIn;
    return data;
  }
}
