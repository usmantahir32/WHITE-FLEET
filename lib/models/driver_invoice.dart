
class DriverInvoiceModel {
  List<DriverInvoiceData>? driverRateConfiguration;

  DriverInvoiceModel({this.driverRateConfiguration});

  DriverInvoiceModel.fromJson(Map<String, dynamic> json) {
    if (json['driverRateConfiguration'] != null) {
      driverRateConfiguration = <DriverInvoiceData>[];
      json['driverRateConfiguration'].forEach((v) {
        driverRateConfiguration!.add(new DriverInvoiceData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.driverRateConfiguration != null) {
      data['driverRateConfiguration'] =
          this.driverRateConfiguration!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DriverInvoiceData {
  String? driverRateConfiguraionId;
  String? runType;
  String? rateConfigypeName;
  int? priceIfOwn;
  int? priceIfNotOwn;
  String? relationId;
  String? runTypeName;

  DriverInvoiceData(
      {this.driverRateConfiguraionId,
      this.runType,
      this.rateConfigypeName,
      this.priceIfOwn,
      this.priceIfNotOwn,
      this.relationId,
      this.runTypeName});

  DriverInvoiceData.fromJson(Map<String, dynamic> json) {
    driverRateConfiguraionId = json['driverRateConfiguraionId'];
    runType = json['runType'];
    rateConfigypeName = json['rateConfigypeName'];
    priceIfOwn = json['priceIfOwn'];
    priceIfNotOwn = json['priceIfNotOwn'];
    relationId = json['relationId'];
    runTypeName = json['runTypeName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['driverRateConfiguraionId'] = this.driverRateConfiguraionId;
    data['runType'] = this.runType;
    data['rateConfigypeName'] = this.rateConfigypeName;
    data['priceIfOwn'] = this.priceIfOwn;
    data['priceIfNotOwn'] = this.priceIfNotOwn;
    data['relationId'] = this.relationId;
    data['runTypeName'] = this.runTypeName;
    return data;
  }
}