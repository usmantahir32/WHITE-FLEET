class InvoiceConfigDataModel {
  List<InvoiceConfig>? data;
  // List<Null>? messages;
  bool? succeeded;

  InvoiceConfigDataModel({this.data, this.succeeded});

  InvoiceConfigDataModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <InvoiceConfig>[];
      json['data'].forEach((v) {
        data!.add(new InvoiceConfig.fromJson(v));
      });
    }
    // if (json['messages'] != null) {
    //   messages = <Null>[];
    //   json['messages'].forEach((v) {
    //     messages!.add(new Null.fromJson(v));
    //   });
    // }
    succeeded = json['succeeded'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    // if (this.messages != null) {
    //   data['messages'] = this.messages!.map((v) => v.toJson()).toList();
    // }
    data['succeeded'] = this.succeeded;
    return data;
  }
}

class InvoiceConfig {
  String? id;
  String? name;
  List<RateConfigTypes>? rateConfigTypes;

  InvoiceConfig({this.id, this.name, this.rateConfigTypes});

  InvoiceConfig.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['rateConfigTypes'] != null) {
      rateConfigTypes = <RateConfigTypes>[];
      json['rateConfigTypes'].forEach((v) {
        rateConfigTypes!.add(new RateConfigTypes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.rateConfigTypes != null) {
      data['rateConfigTypes'] =
          this.rateConfigTypes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RateConfigTypes {
  String? id;
  String? name;
  String? rateConfigId;
  double? ifOwnAmount;
  double? ifNotOwnAmount;

  RateConfigTypes(
      {this.id,
      this.name,
      this.rateConfigId,
      this.ifOwnAmount,
      this.ifNotOwnAmount});

  RateConfigTypes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    rateConfigId = json['rateConfigId'];
    ifOwnAmount = json['ifOwnAmount'];
    ifNotOwnAmount = json['ifNotOwnAmount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['rateConfigId'] = this.rateConfigId;
    data['ifOwnAmount'] = this.ifOwnAmount;
    data['ifNotOwnAmount'] = this.ifNotOwnAmount;
    return data;
  }
}
