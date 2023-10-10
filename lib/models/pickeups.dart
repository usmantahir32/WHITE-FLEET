// ignore_for_file: unnecessary_question_mark

class PickupsModel {
  List<PickupData>? data;
  int? currentPage;
  int? totalPages;
  int? totalCount;
  int? pageSize;
  bool? hasPreviousPage;
  bool? hasNextPage;
  Null? messages;
  bool? succeeded;

  PickupsModel(
      {this.data,
      this.currentPage,
      this.totalPages,
      this.totalCount,
      this.pageSize,
      this.hasPreviousPage,
      this.hasNextPage,
      this.messages,
      this.succeeded});

  PickupsModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <PickupData>[];
      json['data'].forEach((v) {
        data!.add(new PickupData.fromJson(v));
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

class PickupData {
  String? id;
  String? name;
  String? address;
  String? note;
  List? weekdays;
  String? driverId;
  String? driverName;

  PickupData(
      {this.id,
      this.driverId,
      this.driverName,
      this.name,
      this.address,
      this.note,
      this.weekdays});

  PickupData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    driverId = json['driverId'];
    driverName = json['driverName'];
    // address = json['address'];
    // note = json["note"];
    // weekdays = json["weekdays"] ?? [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data["address"] = this.address;
    data["note"] = note;
    data['driverId'] = this.driverId;
    data['driverName'] = this.driverName;
    data["weekdays"] = weekdays;
    return data;
  }
}
