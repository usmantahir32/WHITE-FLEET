class DepposModel {
  List<DeppoData>? data;
  int? currentPage;
  int? totalPages;
  int? totalCount;
  int? pageSize;
  bool? hasPreviousPage;
  bool? hasNextPage;
  // Null? messages;
  bool? succeeded;

  DepposModel(
      {this.data,
      this.currentPage,
      this.totalPages,
      this.totalCount,
      this.pageSize,
      this.hasPreviousPage,
      this.hasNextPage,
      // this.messages,
      this.succeeded});

  DepposModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <DeppoData>[];
      json['data'].forEach((v) {
        data!.add(new DeppoData.fromJson(v));
      });
    }
    currentPage = json['currentPage'];
    totalPages = json['totalPages'];
    totalCount = json['totalCount'];
    pageSize = json['pageSize'];
    hasPreviousPage = json['hasPreviousPage'];
    hasNextPage = json['hasNextPage'];
    // messages = json['messages'];
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
    // data['messages'] = this.messages;
    data['succeeded'] = this.succeeded;
    return data;
  }
}

class DeppoData {
  String? id;
  String? name;
  String? address;
  String? note;
  List? weekdays;
  String? driverId;
  String? driverName;
  DeppoData({this.id,this.driverId,this.driverName, this.name, this.address, this.note, this.weekdays});

  DeppoData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
     driverId=json['driverId'];
    driverName=json['driverName'];
    address = json['address'];
    note = json["note"];
    weekdays = json["weekDays"] ?? [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['driverId']=this.driverId;
    data['driverName']=this.driverName;
    data["address"] = this.address;
    data["note"] = note;
    data["weekDays"] = weekdays;
    return data;
  }
}
