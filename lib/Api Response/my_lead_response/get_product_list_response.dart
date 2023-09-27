class ProductListResponse {
  List<SlProduct>? slProduct;
  String? message;

  ProductListResponse({this.slProduct, this.message});

  ProductListResponse.fromJson(Map<String, dynamic> json) {
    if (json['slProduct'] != null) {
      slProduct = <SlProduct>[];
      json['slProduct'].forEach((v) {
        slProduct!.add(new SlProduct.fromJson(v));
      });
    }
    message = json['Message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.slProduct != null) {
      data['slProduct'] = this.slProduct!.map((v) => v.toJson()).toList();
    }
    data['Message'] = this.message;
    return data;
  }
}

class SlProduct {
  bool? disabled;
  String? group;
  bool? selected;
  String? text;
  String? value;

  SlProduct({this.disabled, this.group, this.selected, this.text, this.value});

  SlProduct.fromJson(Map<String, dynamic> json) {
    disabled = json['Disabled'];
    group = json['Group'];
    selected = json['Selected'];
    text = json['Text'];
    value = json['Value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Disabled'] = this.disabled;
    data['Group'] = this.group;
    data['Selected'] = this.selected;
    data['Text'] = this.text;
    data['Value'] = this.value;
    return data;
  }
}