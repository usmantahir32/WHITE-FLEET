// ignore_for_file: unnecessary_question_mark

class RouteModel {
  List<RouteData>? data;
  int? currentPage;
  int? totalPages;
  int? totalCount;
  int? pageSize;
  bool? hasPreviousPage;
  bool? hasNextPage;
  Null? messages;
  bool? succeeded;

  RouteModel(
      {this.data,
      this.currentPage,
      this.totalPages,
      this.totalCount,
      this.pageSize,
      this.hasPreviousPage,
      this.hasNextPage,
      this.messages,
      this.succeeded});

  RouteModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <RouteData>[];
      json['data'].forEach((v) {
        data!.add(new RouteData.fromJson(v));
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

class RouteData {
  String? id;
  String? name;
  String ?driverId;
  String? driverName;
  RouteData({this.id, this.name,this.driverId,this.driverName});

  RouteData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    driverId=json['driverId'];
    driverName=json['driverName'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['driverId']=this.driverId;
    data['driverName']=this.driverName;
    data['name'] = this.name;
    return data;
  }
}
