class GetCustLeadResoourcesRes {
  ObjCustResource? objCustResource;
  String? message;

  GetCustLeadResoourcesRes({this.objCustResource, this.message});

  GetCustLeadResoourcesRes.fromJson(Map<String, dynamic> json) {
    objCustResource = json['objCustResource'] != null
        ? new ObjCustResource.fromJson(json['objCustResource'])
        : null;
    message = json['Message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.objCustResource != null) {
      data['objCustResource'] = this.objCustResource!.toJson();
    }
    data['Message'] = this.message;
    return data;
  }
}

class ObjCustResource {
  List<LcustomerLeadSource>? lcustomerLeadSource;
  List<Lstate>? lstate;
  List<Lbusiness>? lbusiness;
  List<LproductStatus>? lproductStatus;

  ObjCustResource(
      {this.lcustomerLeadSource,
      this.lstate,
      this.lbusiness,
      this.lproductStatus});

  ObjCustResource.fromJson(Map<String, dynamic> json) {
    if (json['lcustomerLeadSource'] != null) {
      lcustomerLeadSource = <LcustomerLeadSource>[];
      json['lcustomerLeadSource'].forEach((v) {
        lcustomerLeadSource!.add(new LcustomerLeadSource.fromJson(v));
      });
    }
    if (json['lstate'] != null) {
      lstate = <Lstate>[];
      json['lstate'].forEach((v) {
        lstate!.add(new Lstate.fromJson(v));
      });
    }
    if (json['lbusiness'] != null) {
      lbusiness = <Lbusiness>[];
      json['lbusiness'].forEach((v) {
        lbusiness!.add(new Lbusiness.fromJson(v));
      });
    }
    if (json['lproductStatus'] != null) {
      lproductStatus = <LproductStatus>[];
      json['lproductStatus'].forEach((v) {
        lproductStatus!.add(new LproductStatus.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.lcustomerLeadSource != null) {
      data['lcustomerLeadSource'] =
          this.lcustomerLeadSource!.map((v) => v.toJson()).toList();
    }
    if (this.lstate != null) {
      data['lstate'] = this.lstate!.map((v) => v.toJson()).toList();
    }
    if (this.lbusiness != null) {
      data['lbusiness'] = this.lbusiness!.map((v) => v.toJson()).toList();
    }
    if (this.lproductStatus != null) {
      data['lproductStatus'] =
          this.lproductStatus!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LcustomerLeadSource {
  int? customerLeadSourceId;
  String? customerLeadSourceName;

  LcustomerLeadSource({this.customerLeadSourceId, this.customerLeadSourceName});

  LcustomerLeadSource.fromJson(Map<String, dynamic> json) {
    customerLeadSourceId = json['CustomerLeadSourceId'];
    customerLeadSourceName = json['CustomerLeadSourceName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CustomerLeadSourceId'] = this.customerLeadSourceId;
    data['CustomerLeadSourceName'] = this.customerLeadSourceName;
    return data;
  }
}

class Lstate {
  int? stateId;
  String? stateName;

  Lstate({this.stateId, this.stateName});

  Lstate.fromJson(Map<String, dynamic> json) {
    stateId = json['StateId'];
    stateName = json['state_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['StateId'] = this.stateId;
    data['state_name'] = this.stateName;
    return data;
  }
}

class Lbusiness {
  int? businessUserId;
  String? businessName;

  Lbusiness({this.businessUserId, this.businessName});

  Lbusiness.fromJson(Map<String, dynamic> json) {
    businessUserId = json['BusinessUserId'];
    businessName = json['BusinessName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['BusinessUserId'] = this.businessUserId;
    data['BusinessName'] = this.businessName;
    return data;
  }
}

class LproductStatus {
  int? productStatusId;
  String? productStatusName;

  LproductStatus({this.productStatusId, this.productStatusName});

  LproductStatus.fromJson(Map<String, dynamic> json) {
    productStatusId = json['ProductStatusId'];
    productStatusName = json['ProductStatusName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ProductStatusId'] = this.productStatusId;
    data['ProductStatusName'] = this.productStatusName;
    return data;
  }
}