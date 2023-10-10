import 'package:intl/intl.dart';

class VanRegoModel {
  List<VanRegoData>? data;
  int? currentPage;
  int? totalPages;
  int? totalCount;
  int? pageSize;
  bool? hasPreviousPage;
  bool? hasNextPage;
  // Null? messages;
  bool? succeeded;

  VanRegoModel(
      {this.data,
      this.currentPage,
      this.totalPages,
      this.totalCount,
      this.pageSize,
      this.hasPreviousPage,
      this.hasNextPage,
      // this.messages,
      this.succeeded});

  VanRegoModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <VanRegoData>[];
      json['data'].forEach((v) {
        data!.add(new VanRegoData.fromJson(v));
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

class VanRegoData {
  String? id;
  String? vanNumber;
  String? regoNumber;
  String? company;
  String? size;
  String? driverName;
  String? driverId;
  String? regoExpiry;

  VanRegoData(
      {this.id,
      this.driverName,
      this.vanNumber,
      this.regoNumber,
      this.driverId,
      this.company,
      this.size,
      this.regoExpiry});

  VanRegoData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    vanNumber = json['vanNumber'];
    driverId=json['driverId'];
    regoNumber = json['regoNumber'];
    driverName=json['driverName'];
    company = json["company"];
    size = json["size"];
    regoExpiry = formatDateTimeToISO8601(json["regoExpiry"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['vanNumbers'] = this.vanNumber;
    data['driverId']=this.driverId;
    data["regoNumber"] = this.regoNumber;
    data['driverName']=this.driverName;
    data["company"] = company;
    data["size"] = size;
    data["regoExpiry"] = regoExpiry;
    return data;
  }

  formatDateTimeToISO8601(dateTime) {
    DateTime now = DateTime.parse(dateTime);
    var formatter = DateFormat('yyyy-MM-dd');
    var formatted = formatter.format(now);

    return formatted;
  }
}
