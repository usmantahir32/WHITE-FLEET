class DriversModel {
  List<DriverData>? data;
  bool? succeeded;

  DriversModel({this.data, this.succeeded});

  DriversModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <DriverData>[];
      json['data'].forEach((v) {
        data!.add(new DriverData.fromJson(v));
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

class DriverData {
  String? id;
  String? userName;
  String? firstName;
  String? lastName;
  String? email;
  bool? isActive;
  bool? emailConfirmed;
  String? phoneNumber;
  String? imageUrl;
  String? userType;
  String? workType;
  String? profilePicture;

  DriverData(
      {this.id,
      this.userName,
      this.firstName,
      this.lastName,
      this.email,
      this.isActive,
      this.emailConfirmed,
      this.phoneNumber,
      this.imageUrl,
      this.userType,
      this.workType,
      this.profilePicture});

  DriverData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['userName'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    isActive = json['isActive'];
    emailConfirmed = json['emailConfirmed'];
    phoneNumber = json['phoneNumber'];
    imageUrl = json['imageUrl'];
    userType = json['userType'];
    workType = json['workType'];
    profilePicture = json['profilePicture'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userName'] = this.userName;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['isActive'] = this.isActive;
    data['emailConfirmed'] = this.emailConfirmed;
    data['phoneNumber'] = this.phoneNumber;
    data['imageUrl'] = this.imageUrl;
    data['userType'] = this.userType;
    data['workType'] = this.workType;
    data['profilePicture'] = this.profilePicture;
    return data;
  }
}
