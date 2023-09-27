class OtpVerifyResponse {
  bool? verified;
  String? message;

  OtpVerifyResponse({this.verified, this.message});

  OtpVerifyResponse.fromJson(Map<String, dynamic> json) {
    verified = json['Verified'];
    message = json['Message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Verified'] = this.verified;
    data['Message'] = this.message;
    return data;
  }
}
