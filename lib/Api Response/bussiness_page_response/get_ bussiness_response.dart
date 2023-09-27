class GetBussinessListResponse {
  List<LBusiness>? lBusiness;
  String? message;

  GetBussinessListResponse({this.lBusiness, this.message});

  GetBussinessListResponse.fromJson(Map<String, dynamic> json) {
    if (json['lBusiness'] != null) {
      lBusiness = <LBusiness>[];
      json['lBusiness'].forEach((v) {
        lBusiness!.add(new LBusiness.fromJson(v));
      });
    }
    message = json['Message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.lBusiness != null) {
      data['lBusiness'] = this.lBusiness!.map((v) => v.toJson()).toList();
    }
    data['Message'] = this.message;
    return data;
  }
}

class LBusiness {
  int? businessUserId;
  String? companyName;
  String? brandName;
  String? businessLogo;
  Null? businessLogoURL;
  int? earningRangeMin;
  int? earningRangeMax;
  String? earningRangeUnit;
  String? productShortDesc;

  LBusiness(
      {this.businessUserId,
        this.companyName,
        this.brandName,
        this.businessLogo,
        this.businessLogoURL,
        this.earningRangeMin,
        this.earningRangeMax,
        this.earningRangeUnit,
        this.productShortDesc});

  LBusiness.fromJson(Map<String, dynamic> json) {
    businessUserId = json['BusinessUserId'];
    companyName = json['CompanyName'];
    brandName = json['BrandName'];
    businessLogo = json['BusinessLogo'];
    businessLogoURL = json['BusinessLogoURL'];
    earningRangeMin = json['EarningRange_Min'];
    earningRangeMax = json['EarningRange_Max'];
    earningRangeUnit = json['EarningRange_Unit'];
    productShortDesc = json['ProductShortDesc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['BusinessUserId'] = this.businessUserId;
    data['CompanyName'] = this.companyName;
    data['BrandName'] = this.brandName;
    data['BusinessLogo'] = this.businessLogo;
    data['BusinessLogoURL'] = this.businessLogoURL;
    data['EarningRange_Min'] = this.earningRangeMin;
    data['EarningRange_Max'] = this.earningRangeMax;
    data['EarningRange_Unit'] = this.earningRangeUnit;
    data['ProductShortDesc'] = this.productShortDesc;
    return data;
  }
}