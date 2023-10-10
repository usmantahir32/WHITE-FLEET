class WaveModel {
  List<WaveData>? data;
  int? currentPage;
  int? totalPages;
  int? totalCount;
  int? pageSize;
  bool? hasPreviousPage;
  bool? hasNextPage;

  bool? succeeded;

  WaveModel(
      {this.data,
      this.currentPage,
      this.totalPages,
      this.totalCount,
      this.pageSize,
      this.hasPreviousPage,
      this.hasNextPage,
      this.succeeded});

  WaveModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <WaveData>[];
      json['data'].forEach((v) {
        data!.add(new WaveData.fromJson(v));
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

class WaveData {
  String? id;
  String? name;
  String? startTime;
  String? endTime;
  String? driverId;
  String? driverName;
  WaveData({this.id, this.name, this.startTime, this.endTime,this.driverId,
  this.driverName});

  WaveData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    driverId=json['driverId'];
    driverName=json['driverName'];
    startTime = json['startTime'];
    endTime = json['endTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['driverName']=this.driverName;
    data['driverId']=this.driverId;
    data['startTime'] = this.startTime;
    data['endTime'] = this.endTime;
    return data;
  }
}
