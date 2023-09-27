class CandidateKycResponse {
  int? candidateUserId;
  String? message;

  CandidateKycResponse({this.candidateUserId, this.message});

  CandidateKycResponse.fromJson(Map<String, dynamic> json) {
    candidateUserId = json['CandidateUserId'];
    message = json['Message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CandidateUserId'] = this.candidateUserId;
    data['Message'] = this.message;
    return data;
  }
}