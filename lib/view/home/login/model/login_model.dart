


import 'package:vexana/vexana.dart';

class LoginModel extends INetworkModel<LoginModel> {
    LoginModel({
        this.accessToken,
        this.tokenType,
        this.expiresIn,
        this.refreshToken,
        this.rank,
        this.nick,
        this.userId,
        this.loginType,
    });

    String? accessToken;
    String? tokenType;
    int? expiresIn;
    String? refreshToken;
    String? rank;
    String? nick;
    String? userId;
    String? loginType;

    LoginModel fromJson(Map<String, dynamic> json) => LoginModel(
        accessToken: json["access_token"] == null ? null : json["access_token"],
        tokenType: json["token_type"] == null ? null : json["token_type"],
        expiresIn: json["expires_in"] == null ? null : json["expires_in"],
        refreshToken: json["refresh_token"] == null ? null : json["refresh_token"],
        rank: json["rank"] == null ? null : json["rank"],
        nick: json["nick"] == null ? null : json["nick"],
        userId: json["user_id"] == null ? null : json["user_id"],
        loginType: json["login_type"] == null ? null : json["login_type"],
    );

    Map<String, dynamic> toJson() => {
        "access_token": accessToken == null ? null : accessToken,
        "token_type": tokenType == null ? null : tokenType,
        "expires_in": expiresIn == null ? null : expiresIn,
        "refresh_token": refreshToken == null ? null : refreshToken,
        "rank": rank == null ? null : rank,
        "nick": nick == null ? null : nick,
        "user_id": userId == null ? null : userId,
        "login_type": loginType == null ? null : loginType,
    };
}