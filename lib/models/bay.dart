// ignore_for_file: unnecessary_question_mark

class BayModel {
  List<BayData>? data;
  int? currentPage;
  int? totalPages;
  int? totalCount;
  int? pageSize;
  bool? hasPreviousPage;
  bool? hasNextPage;
  Null? messages;
  bool? succeeded;

  BayModel(
      {this.data,
      this.currentPage,
      this.totalPages,
      this.totalCount,
      this.pageSize,
      this.hasPreviousPage,
      this.hasNextPage,
      this.messages,
      this.succeeded});

  BayModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <BayData>[];
      json['data'].forEach((v) {
        data!.add(new BayData.fromJson(v));
      });
    }
    currentPage = json['currentPage'];
    totalPages = json['totalPages'];
    totalCount = json['totalCount'];
    pageSize = json['pageSize'];
    hasPreviousPage = json['hasPreviousPage'];
    hasNextPage = json['hasNextPage'];
    messages = json['messages'];
    succeeded = json['succeeded'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['currentPage'] = this.currentPage;
    data['totalPages'] = this.totalPages;
    data['totalCount'] = this.totalCount;
    data['pageSize'] = this.pageSize;
    data['hasPreviousPage'] = this.hasPreviousPage;
    data['hasNextPage'] = this.hasNextPage;
    data['messages'] = this.messages;
    data['succeeded'] = this.succeeded;
    return data;
  }
}

class BayData {
  String? id;
  String? name;
  String? driverID;
  String? driverName;

  BayData({this.id, this.name,this.driverID,
  this.driverName});

  BayData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    driverID=json['driverId'];
    driverName=json['driverName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['driverId']=this.driverID;
    data['driverName']=this.driverName;
    data['name'] = this.name;
    return data;
  }
}
