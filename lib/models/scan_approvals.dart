// ignore_for_file: unnecessary_question_mark

class ScanApprovalsModel {
  List<ScanApprovalsData>? data;
  bool? succeeded;

  ScanApprovalsModel({this.data, this.succeeded});

  ScanApprovalsModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ScanApprovalsData>[];
      json['data'].forEach((v) {
        data!.add(new ScanApprovalsData.fromJson(v));
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

class ScanApprovalsData {
  String? id;
  String? driverId;
  String? driverName;
  Null? workType;
  String? empId;
  Null? userId;
  String? dateOfScan;
  int? expressPost;
  int? signItems;
  int? callForReturns;
  int? eParcelInitial;
  int? eparcelSubSequent;
  int? unknownArticles;
  int? unknownBDM;
  String? wcc;
  String? runType;
  bool? isSuperApproved;
  int? totalItems;
  String? supervisorId;
  Null? packageDetails;
  Null? scannedImage;
  String? url;

  ScanApprovalsData(
      {this.id,
      this.driverId,
      this.driverName,
      this.workType,
      this.empId,
      this.userId,
      this.dateOfScan,
      this.expressPost,
      this.signItems,
      this.callForReturns,
      this.eParcelInitial,
      this.eparcelSubSequent,
      this.unknownArticles,
      this.unknownBDM,
      this.wcc,
      this.runType,
      this.isSuperApproved,
      this.totalItems,
      this.supervisorId,
      this.packageDetails,
      this.scannedImage,
      this.url});

  ScanApprovalsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    driverId = json['driverId'];
    driverName = json['driverName'];
    workType = json['workType'];
    empId = json['empId'];
    userId = json['userId'];
    dateOfScan = json['dateOfScan'];
    expressPost = json['expressPost'];
    signItems = json['signItems'];
    callForReturns = json['callForReturns'];
    eParcelInitial = json['eParcelInitial'];
    eparcelSubSequent = json['eparcelSubSequent'];
    unknownArticles = json['unknownArticles'];
    unknownBDM = json['unknownBDM'];
    wcc = json['wcc'];
    runType = json['runType'];
    isSuperApproved = json['isSuperApproved'];
    totalItems = json['totalItems'];
    supervisorId = json['supervisorId'];
    packageDetails = json['packageDetails'];
    scannedImage = json['scannedImage'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['driverId'] = this.driverId;
    data['driverName'] = this.driverName;
    data['workType'] = this.workType;
    data['empId'] = this.empId;
    data['userId'] = this.userId;
    data['dateOfScan'] = this.dateOfScan;
    data['expressPost'] = this.expressPost;
    data['signItems'] = this.signItems;
    data['callForReturns'] = this.callForReturns;
    data['eParcelInitial'] = this.eParcelInitial;
    data['eparcelSubSequent'] = this.eparcelSubSequent;
    data['unknownArticles'] = this.unknownArticles;
    data['unknownBDM'] = this.unknownBDM;
    data['wcc'] = this.wcc;
    data['runType'] = this.runType;
    data['isSuperApproved'] = this.isSuperApproved;
    data['totalItems'] = this.totalItems;
    data['supervisorId'] = this.supervisorId;
    data['packageDetails'] = this.packageDetails;
    data['scannedImage'] = this.scannedImage;
    data['url'] = this.url;
    return data;
  }
}
