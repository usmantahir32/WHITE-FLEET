class SchoolsModel {
  List<SchoolsData>? data;
  int? currentPage;
  int? totalPages;
  int? totalCount;
  int? pageSize;
  bool? hasPreviousPage;
  bool? hasNextPage;
  // Null? messages;
  bool? succeeded;

  SchoolsModel(
      {this.data,
      this.currentPage,
      this.totalPages,
      this.totalCount,
      this.pageSize,
      this.hasPreviousPage,
      this.hasNextPage,
      // this.messages,
      this.succeeded});

  SchoolsModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <SchoolsData>[];
      json['data'].forEach((v) {
        data!.add(new SchoolsData.fromJson(v));
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

class SchoolsData {
  String? id;
  String? name;
  String? address;
  String? driverId;
  String? driverName;
  String? note;
  List<String>? weekDays;

  SchoolsData({this.id, this.name, this.address, this.note, this.weekDays,this.driverId,this.driverName});

  SchoolsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    driverId=json['driverId'];
    driverName=json['driverName'];
    note = json['note'];
    weekDays = json['weekDays'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['address'] = this.address;
    data['note'] = this.note;
    data['weekDays'] = this.weekDays;
    return data;
  }
}