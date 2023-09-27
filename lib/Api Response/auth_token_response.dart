
class AuthTokenResponse {
  String? accessToken;
  int? expiresIn;
  String? tokenType;

  AuthTokenResponse({this.accessToken, this.expiresIn, this.tokenType});

  AuthTokenResponse.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    expiresIn = json['Expires_In'];
    tokenType = json['token_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['access_token'] = this.accessToken;
    data['Expires_In'] = this.expiresIn;
    data['token_type'] = this.tokenType;
    return data;
  }
}