class DriverEnquiryModel {
  List<DriverEnquiryData>? data;
  List<Null>? messages;
  bool? succeeded;

  DriverEnquiryModel({this.data, this.messages, this.succeeded});

  DriverEnquiryModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <DriverEnquiryData>[];
      json['data'].forEach((v) {
        data!.add(new DriverEnquiryData.fromJson(v));
      });
    }
    succeeded = json['succeeded'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['succeeded'] = this.succeeded;
    return data;
  }
}

class DriverEnquiryData {
  String? enquiryId;
  String? caseNumber;
  String? driverCode;
  String? contractId;
  String? supervisor;
  String? driverId;
  String? customerAddress;
  String? deliveredAddress;
  String? priority;
  String? createdDate;
  String? value;
  String? comments;
  String? lat;
  String? lon;
  String? delLat;
  String? delLon;
  String? resolveBy;
  String? additionalEmail;
  String? urls;
  bool? isActive;

  DriverEnquiryData(
      {this.enquiryId,
        this.caseNumber,
        this.driverCode,
        this.contractId,
        this.supervisor,
        this.driverId,
        this.customerAddress,
        this.deliveredAddress,
        this.priority,
        this.createdDate,
        this.value,
        this.comments,
        this.lat,
        this.lon,
        this.delLat,
        this.delLon,
        this.resolveBy,
        this.additionalEmail,
        this.urls,
        this.isActive});

  DriverEnquiryData.fromJson(Map<String, dynamic> json) {
    enquiryId = json['enquiryId'];
    caseNumber = json['caseNumber'];
    driverCode = json['driverCode'];
    contractId = json['contractId'];
    supervisor = json['supervisor'];
    driverId = json['driverId'];
    customerAddress = json['customerAddress'];
    deliveredAddress = json['deliveredAddress'];
    priority = json['priority'];
    createdDate = json['createdDate'];
    value = json['value'];
    comments = json['comments'];
    lat = json['lat'];
    lon = json['lon'];
    delLat = json['delLat'];
    delLon = json['delLon'];
    resolveBy = json['resolveBy'];
    additionalEmail = json['additionalEmail'];
    urls = json['urls'];
    isActive = json['isActive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['enquiryId'] = this.enquiryId;
    data['caseNumber'] = this.caseNumber;
    data['driverCode'] = this.driverCode;
    data['contractId'] = this.contractId;
    data['supervisor'] = this.supervisor;
    data['driverId'] = this.driverId;
    data['customerAddress'] = this.customerAddress;
    data['deliveredAddress'] = this.deliveredAddress;
    data['priority'] = this.priority;
    data['createdDate'] = this.createdDate;
    data['value'] = this.value;
    data['comments'] = this.comments;
    data['lat'] = this.lat;
    data['lon'] = this.lon;
    data['delLat'] = this.delLat;
    data['delLon'] = this.delLon;
    data['resolveBy'] = this.resolveBy;
    data['additionalEmail'] = this.additionalEmail;
    data['urls'] = this.urls;
    data['isActive'] = this.isActive;
    return data;
  }
}