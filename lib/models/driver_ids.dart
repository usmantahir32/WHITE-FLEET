// ignore_for_file: unnecessary_question_mark

class DriverIDsModel {
  List<DriverIdsData>? data;
  int? currentPage;
  int? totalPages;
  int? totalCount;
  int? pageSize;
  bool? hasPreviousPage;
  bool? hasNextPage;
  Null? messages;
  bool? succeeded;

  DriverIDsModel(
      {this.data,
      this.currentPage,
      this.totalPages,
      this.totalCount,
      this.pageSize,
      this.hasPreviousPage,
      this.hasNextPage,
      this.messages,
      this.succeeded});

  DriverIDsModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <DriverIdsData>[];
      json['data'].forEach((v) {
        data!.add(new DriverIdsData.fromJson(v));
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

class DriverIdsData {
  String? id;
  String? temparoryId;
  String? driverId;
  String? driverName;

  DriverIdsData({this.id, this.temparoryId, this.driverId, this.driverName});

  DriverIdsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    temparoryId = json['temparoryId'];
    driverName = json['driverName'];
    driverId = json['driverId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['temparoryId'] = this.temparoryId;
    data['driverName'] = this.driverName;
    data['driverId'] = this.driverId;
    return data;
  }
}
