class ReSendOtpResponse {
  int? cId;
  String? message;

  ReSendOtpResponse({this.cId, this.message});

  ReSendOtpResponse.fromJson(Map<String, dynamic> json) {
    cId = json['CId'];
    message = json['Message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CId'] = this.cId;
    data['Message'] = this.message;
    return data;
  }
}