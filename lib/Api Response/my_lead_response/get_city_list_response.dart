class CityListResponse {
  List<SlCity>? slCity;
  String? message;

  CityListResponse({this.slCity, this.message});

  CityListResponse.fromJson(Map<String, dynamic> json) {
    if (json['slCity'] != null) {
      slCity = <SlCity>[];
      json['slCity'].forEach((v) {
        slCity!.add(new SlCity.fromJson(v));
      });
    }
    message = json['Message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.slCity != null) {
      data['slCity'] = this.slCity!.map((v) => v.toJson()).toList();
    }
    data['Message'] = this.message;
    return data;
  }
}

class SlCity {
  bool? disabled;
  String? group;
  bool? selected;
  String? text;
  String? value;

  SlCity({this.disabled, this.group, this.selected, this.text, this.value});

  SlCity.fromJson(Map<String, dynamic> json) {
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