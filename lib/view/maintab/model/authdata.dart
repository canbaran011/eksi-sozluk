class AuthData {
    AuthData({
        this.rank,
        this.accessToken,
        this.tokenType,
        this.expiresIn,
        this.issued,
        this.expires,
    });

    String? rank;
    String? accessToken;
    String? tokenType;
    String? expiresIn;
    String? issued;
    String? expires;

    factory AuthData.fromJson(Map<String, dynamic> json) => AuthData(
        rank: json["rank"] == null ? null : json["rank"],
        accessToken: json["access_token"] == null ? null : json["access_token"],
        tokenType: json["token_type"] == null ? null : json["token_type"],
        expiresIn: json["expires_in"] == null ? null : json["expires_in"],
        issued: json[".issued"] == null ? null : json[".issued"],
        expires: json[".expires"] == null ? null : json[".expires"],
    );

    Map<String, dynamic> toJson() => {
        "rank": rank == null ? null : rank,
        "access_token": accessToken == null ? null : accessToken,
        "token_type": tokenType == null ? null : tokenType,
        "expires_in": expiresIn == null ? null : expiresIn,
        ".issued": issued == null ? null : issued,
        ".expires": expires == null ? null : expires,
    };
}