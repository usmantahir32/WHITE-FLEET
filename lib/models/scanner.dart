class ScannerModel {
  List<ScannerData>? data;
  int? currentPage;
  int? totalPages;
  int? totalCount;
  int? pageSize;
  bool? hasPreviousPage;
  bool? hasNextPage;

  bool? succeeded;

  ScannerModel(
      {this.data,
      this.currentPage,
      this.totalPages,
      this.totalCount,
      this.pageSize,
      this.hasPreviousPage,
      this.hasNextPage,
      this.succeeded});

  ScannerModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ScannerData>[];
      json['data'].forEach((v) {
        data!.add(new ScannerData.fromJson(v));
      });
    }
    currentPage = json['currentPage'];
    totalPages = json['totalPages'];
    totalCount = json['totalCount'];
    pageSize = json['pageSize'];
    hasPreviousPage = json['hasPreviousPage'];
    hasNextPage = json['hasNextPage'];

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

    data['succeeded'] = this.succeeded;
    return data;
  }
}

class ScannerData {
  String? id;
  String? serialNumber;
  String? make;
  String? model;
  String? driverId;
  String? driverName;

  ScannerData(
      {this.id,
      this.serialNumber,
      this.make,
      this.model,
      this.driverId,
      this.driverName});

  ScannerData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    serialNumber = json['serialNumber'];
    make = json['make'];
    model = json['model'];
    driverId = json['driverId'];
    driverName = json['driverName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['serialNumber'] = this.serialNumber;
    data['make'] = this.make;
    data['model'] = this.model;
    data['driverId'] = this.driverId;
    data['driverName'] = this.driverName;
    return data;
  }
}
