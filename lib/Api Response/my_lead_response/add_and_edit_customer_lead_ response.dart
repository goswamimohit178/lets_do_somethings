class AddEditCustomerLeadRes {
  int? customerId;
  String? message;

  AddEditCustomerLeadRes({this.customerId, this.message});

  AddEditCustomerLeadRes.fromJson(Map<String, dynamic> json) {
    customerId = json['CustomerId'];
    message = json['Message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CustomerId'] = this.customerId;
    data['Message'] = this.message;
    return data;
  }
}