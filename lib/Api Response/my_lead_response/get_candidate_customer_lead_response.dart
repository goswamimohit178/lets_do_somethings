class GetCandidateLeadRes {
  List<CustomerLead>? customerLead;
  String? message;

  GetCandidateLeadRes({this.customerLead, this.message});

  GetCandidateLeadRes.fromJson(Map<String, dynamic> json) {
    if (json['CustomerLead'] != null) {
      customerLead = <CustomerLead>[];
      json['CustomerLead'].forEach((v) {
        customerLead!.add(new CustomerLead.fromJson(v));
      });
    }
    message = json['Message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.customerLead != null) {
      data['CustomerLead'] = this.customerLead!.map((v) => v.toJson()).toList();
    }
    data['Message'] = this.message;
    return data;
  }
}

class CustomerLead {
  int? candidateUserId;
  int? customerId;
  String? customerName;
  int? cityId;
  String? cityName;
  String? contactNo;
  int? eSPCustomerProductDetailId;
  int? businessUserId;
  String? businessName;
  int? productId;
  String? productName;
  int? statusId;
  String? statusName;

  CustomerLead(
      {this.candidateUserId,
      this.customerId,
      this.customerName,
      this.cityId,
      this.cityName,
      this.contactNo,
      this.eSPCustomerProductDetailId,
      this.businessUserId,
      this.businessName,
      this.productId,
      this.productName,
      this.statusId,
      this.statusName});

  CustomerLead.fromJson(Map<String, dynamic> json) {
    candidateUserId = json['CandidateUserId'];
    customerId = json['CustomerId'];
    customerName = json['CustomerName'];
    cityId = json['CityId'];
    cityName = json['CityName'];
    contactNo = json['ContactNo'];
    eSPCustomerProductDetailId = json['ESPCustomerProductDetailId'];
    businessUserId = json['BusinessUserId'];
    businessName = json['BusinessName'];
    productId = json['ProductId'];
    productName = json['ProductName'];
    statusId = json['StatusId'];
    statusName = json['StatusName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CandidateUserId'] = this.candidateUserId;

    data['CustomerId'] = this.customerId;
    data['CustomerName'] = this.customerName;
    data['CityId'] = this.cityId;
    data['CityName'] = this.cityName;
    data['ContactNo'] = this.contactNo;
    data['ESPCustomerProductDetailId'] = this.eSPCustomerProductDetailId;
    data['BusinessUserId'] = this.businessUserId;
    data['BusinessName'] = this.businessName;
    data['ProductId'] = this.productId;
    data['ProductName'] = this.productName;
    data['StatusId'] = this.statusId;
    data['StatusName'] = this.statusName;
    return data;
  }
}
