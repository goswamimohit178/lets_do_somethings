class BussinessDetailsResponse {
  VBusinessDetail? vBusinessDetail;
  String? message;

  BussinessDetailsResponse({this.vBusinessDetail, this.message});

  BussinessDetailsResponse.fromJson(Map<String, dynamic> json) {
    vBusinessDetail = json['vBusinessDetail'] != null
        ? new VBusinessDetail.fromJson(json['vBusinessDetail'])
        : null;
    message = json['Message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.vBusinessDetail != null) {
      data['vBusinessDetail'] = this.vBusinessDetail!.toJson();
    }
    data['Message'] = this.message;
    return data;
  }
}

class VBusinessDetail {
  int? businessUserId;
  String? companyName;
  Null? brandName;
  String? businessLogo;
  Null? businessLogoURL;
  int? earningRangeMin;
  int? earningRangeMax;
  String? earningRangeUnit;
  String? productShortDesc;
  String? businessDescription;
  String? serviceDescription;
  List<OBusinessproduct>? oBusinessproduct;

  VBusinessDetail(
      {this.businessUserId,
        this.companyName,
        this.brandName,
        this.businessLogo,
        this.businessLogoURL,
        this.earningRangeMin,
        this.earningRangeMax,
        this.earningRangeUnit,
        this.productShortDesc,
        this.businessDescription,
        this.serviceDescription,
        this.oBusinessproduct});

  VBusinessDetail.fromJson(Map<String, dynamic> json) {
    businessUserId = json['BusinessUserId'];
    companyName = json['CompanyName'];
    brandName = json['BrandName'];
    businessLogo = json['BusinessLogo'];
    businessLogoURL = json['BusinessLogoURL'];
    earningRangeMin = json['EarningRange_Min'];
    earningRangeMax = json['EarningRange_Max'];
    earningRangeUnit = json['EarningRange_Unit'];
    productShortDesc = json['ProductShortDesc'];
    businessDescription = json['BusinessDescription'];
    serviceDescription = json['ServiceDescription'];
    if (json['oBusinessproduct'] != null) {
      oBusinessproduct = <OBusinessproduct>[];
      json['oBusinessproduct'].forEach((v) {
        oBusinessproduct!.add(new OBusinessproduct.fromJson(v));
      });
    }
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
    data['BusinessDescription'] = this.businessDescription;
    data['ServiceDescription'] = this.serviceDescription;
    if (this.oBusinessproduct != null) {
      data['oBusinessproduct'] =
          this.oBusinessproduct!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OBusinessproduct {
  int? businessUserId;
  int? businessProductId;
  String? productName;
  Null? productDescription;
  Null? productImage;
  String? productFileName;
  Null? productImagePath;

  OBusinessproduct(
      {this.businessUserId,
        this.businessProductId,
        this.productName,
        this.productDescription,
        this.productImage,
        this.productFileName,
        this.productImagePath});

  OBusinessproduct.fromJson(Map<String, dynamic> json) {
    businessUserId = json['BusinessUserId'];
    businessProductId = json['BusinessProductId'];
    productName = json['ProductName'];
    productDescription = json['ProductDescription'];
    productImage = json['ProductImage'];
    productFileName = json['ProductFileName'];
    productImagePath = json['ProductImagePath'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['BusinessUserId'] = this.businessUserId;
    data['BusinessProductId'] = this.businessProductId;
    data['ProductName'] = this.productName;
    data['ProductDescription'] = this.productDescription;
    data['ProductImage'] = this.productImage;
    data['ProductFileName'] = this.productFileName;
    data['ProductImagePath'] = this.productImagePath;
    return data;
  }
}