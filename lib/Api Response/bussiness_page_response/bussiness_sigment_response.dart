class BussinessSigmentResponse {
  List<LSegment>? lSegment;
  String? message;

  BussinessSigmentResponse({this.lSegment, this.message});

  BussinessSigmentResponse.fromJson(Map<String, dynamic> json) {
    if (json['lSegment'] != null) {
      lSegment = <LSegment>[];
      json['lSegment'].forEach((v) {
        lSegment!.add(new LSegment.fromJson(v));
      });
    }
    message = json['Message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.lSegment != null) {
      data['lSegment'] = this.lSegment!.map((v) => v.toJson()).toList();
    }
    data['Message'] = this.message;
    return data;
  }
}

class LSegment {
  int? segmentId;
  String? segmentName;

  LSegment({this.segmentId, this.segmentName});

  LSegment.fromJson(Map<String, dynamic> json) {
    segmentId = json['SegmentId'];
    segmentName = json['SegmentName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['SegmentId'] = this.segmentId;
    data['SegmentName'] = this.segmentName;
    return data;
  }
}