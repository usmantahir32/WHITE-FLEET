// ignore_for_file: unnecessary_question_mark

class DriverDetailModel {
  DriverDetailData? data;
  bool? succeeded;

  DriverDetailModel({this.data, this.succeeded});

  DriverDetailModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new DriverDetailData.fromJson(json['data']) : null;
    if (json['messages'] != null) {
      json['messages'].forEach((v) {});
    }
    succeeded = json['succeeded'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    // if (this.messages != null) {
    //   data['messages'] = this.messages!.map((v) => v.toJson()).toList();
    // }
    data['succeeded'] = this.succeeded;
    return data;
  }
}

class DriverDetailData {
  RegRequest? regRequest;
  // List<String>? createTasks;
  int? profilePercentage;
  int? noOfPackages;
  int? enquiryCompletion;
  int? jobRate;
  int? taskCompletion;
  int? rating;

  DriverDetailData(
      {this.regRequest,
      // this.createTasks,
      this.profilePercentage,
      this.noOfPackages,
      this.enquiryCompletion,
      this.jobRate,
      this.taskCompletion,
      this.rating});

  DriverDetailData.fromJson(Map<String, dynamic> json) {
    regRequest = json['regRequest'] != null
        ? new RegRequest.fromJson(json['regRequest'])
        : null;
    if (json['createTasks'] != null) {
      // createTasks = <String>[];
      // json['createTasks'].forEach((v) {
      //   createTasks!.add(new String.fromJson(v));
      // });
    }
    profilePercentage = json['profilePercentage'];
    noOfPackages = json['noOfPackages'];
    enquiryCompletion = json['enquiryCompletion'];
    jobRate = json['jobRate'];
    taskCompletion = json['taskCompletion'];
    rating = json['rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.regRequest != null) {
      data['regRequest'] = this.regRequest!.toJson();
    }
    // if (this.createTasks != null) {
    //   data['createTasks'] = this.createTasks!.map((v) => v.toJson()).toList();
    // }
    data['profilePercentage'] = this.profilePercentage;
    data['noOfPackages'] = this.noOfPackages;
    data['enquiryCompletion'] = this.enquiryCompletion;
    data['jobRate'] = this.jobRate;
    data['taskCompletion'] = this.taskCompletion;
    data['rating'] = this.rating;
    return data;
  }
}

class RegRequest {
  UserAddress? userAddress;
  UserInsurance? userInsurance;
  UserContractor? userContractor;
  UserLicense? userLicense;
  UserVehicle? userVehicle;
  UserRegistration? userRegistration;
  String? saveType;

  RegRequest(
      {this.userAddress,
      this.userInsurance,
      this.userContractor,
      this.userLicense,
      this.userVehicle,
      this.userRegistration,
      this.saveType});

  RegRequest.fromJson(Map<String, dynamic> json) {
    userAddress = json['userAddress'] != null
        ? new UserAddress.fromJson(json['userAddress'])
        : null;
    userInsurance = json['userInsurance'] != null
        ? new UserInsurance.fromJson(json['userInsurance'])
        : null;
    userContractor = json['userContractor'] != null
        ? new UserContractor.fromJson(json['userContractor'])
        : null;
    userLicense = json['userLicense'] != null
        ? new UserLicense.fromJson(json['userLicense'])
        : null;
    userVehicle = json['userVehicle'] != null
        ? new UserVehicle.fromJson(json['userVehicle'])
        : null;
    userRegistration = json['userRegistration'] != null
        ? new UserRegistration.fromJson(json['userRegistration'])
        : null;
    saveType = json['saveType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.userAddress != null) {
      data['userAddress'] = this.userAddress!.toJson();
    }
    if (this.userInsurance != null) {
      data['userInsurance'] = this.userInsurance!.toJson();
    }
    if (this.userContractor != null) {
      data['userContractor'] = this.userContractor!.toJson();
    }
    if (this.userLicense != null) {
      data['userLicense'] = this.userLicense!.toJson();
    }
    if (this.userVehicle != null) {
      data['userVehicle'] = this.userVehicle!.toJson();
    }
    if (this.userRegistration != null) {
      data['userRegistration'] = this.userRegistration!.toJson();
    }
    data['saveType'] = this.saveType;
    return data;
  }
}

class UserAddress {
  String? userId;
  String? subOrb;
  String? state;
  String? postcode;
  String? unit;
  String? streetAddress;
  String? lat;
  String? lon;

  UserAddress(
      {this.userId,
      this.subOrb,
      this.state,
      this.postcode,
      this.unit,
      this.streetAddress,
      this.lat,
      this.lon});

  UserAddress.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    subOrb = json['subOrb'];
    state = json['state'];
    postcode = json['postcode'];
    unit = json['unit'];
    streetAddress = json['streetAddress'];
    lat = json['lat'];
    lon = json['lon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['subOrb'] = this.subOrb;
    data['state'] = this.state;
    data['postcode'] = this.postcode;
    data['unit'] = this.unit;
    data['streetAddress'] = this.streetAddress;
    data['lat'] = this.lat;
    data['lon'] = this.lon;
    return data;
  }
}

class UserInsurance {
  String? userId;
  String? motorInsurance;
  String? insuranceCompany;

  UserInsurance({this.userId, this.motorInsurance, this.insuranceCompany});

  UserInsurance.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    motorInsurance = json['motorInsurance'];
    insuranceCompany = json['insuranceCompany'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['motorInsurance'] = this.motorInsurance;
    data['insuranceCompany'] = this.insuranceCompany;
    return data;
  }
}

class UserContractor {
  String? userId;
  String? contractName;
  String? contractorId;
  String? supervisorName;
  String? supervisorId;
  String? availability;
  String? fullTime;
  String? availabilityDate;

  UserContractor(
      {this.userId,
      this.contractName,
      this.contractorId,
      this.supervisorName,
      this.supervisorId,
      this.availability,
      this.fullTime,
      this.availabilityDate});

  UserContractor.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    contractName = json['contractName'];
    contractorId = json['contractorId'];
    supervisorName = json['supervisorName'];
    supervisorId = json['supervisorId'];
    availability = json['availability'];
    fullTime = json['fullTime'];
    availabilityDate = json['availabilityDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['contractName'] = this.contractName;
    data['contractorId'] = this.contractorId;
    data['supervisorName'] = this.supervisorName;
    data['supervisorId'] = this.supervisorId;
    data['availability'] = this.availability;
    data['fullTime'] = this.fullTime;
    data['availabilityDate'] = this.availabilityDate;
    return data;
  }
}

class UserLicense {
  String? userId;
  String? licenceNumber;
  String? expiryDate;
  String? issuedby;
  String? internationalorLocal;
  String? licenseDoc;

  UserLicense(
      {this.userId,
      this.licenceNumber,
      this.expiryDate,
      this.issuedby,
      this.internationalorLocal,
      this.licenseDoc});

  UserLicense.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    licenceNumber = json['licenceNumber'];
    expiryDate = json['expiryDate'];
    issuedby = json['issuedby'];
    internationalorLocal = json['internationalorLocal'];
    licenseDoc = json['licenseDoc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['licenceNumber'] = this.licenceNumber;
    data['expiryDate'] = this.expiryDate;
    data['issuedby'] = this.issuedby;
    data['internationalorLocal'] = this.internationalorLocal;
    data['licenseDoc'] = this.licenseDoc;
    return data;
  }
}

class UserVehicle {
  String? userId;
  bool? ownVehicle;
  bool? willingtoRent;
  String? contractorVan;
  String? registrationNumber;
  String? model;
  String? manufactoringYear;
  String? vehicletype;
  String? manualorAutomatic;

  UserVehicle(
      {this.userId,
      this.ownVehicle,
      this.willingtoRent,
      this.contractorVan,
      this.registrationNumber,
      this.model,
      this.manufactoringYear,
      this.vehicletype,
      this.manualorAutomatic});

  UserVehicle.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    ownVehicle = json['ownVehicle'];
    willingtoRent = json['willingtoRent'];
    contractorVan = json['contractorVan'];
    registrationNumber = json['registrationNumber'];
    model = json['model'];
    manufactoringYear = json['manufactoringYear'];
    vehicletype = json['vehicletype'];
    manualorAutomatic = json['manualorAutomatic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['ownVehicle'] = this.ownVehicle;
    data['willingtoRent'] = this.willingtoRent;
    data['contractorVan'] = this.contractorVan;
    data['registrationNumber'] = this.registrationNumber;
    data['model'] = this.model;
    data['manufactoringYear'] = this.manufactoringYear;
    data['vehicletype'] = this.vehicletype;
    data['manualorAutomatic'] = this.manualorAutomatic;
    return data;
  }
}

class UserRegistration {
  String? userId;
  String? firstname;
  String? lastname;
  String? middlename;
  String? username;
  String? phonenumber;
  String? homephone;
  String? email;
  String? password;
  String? confirmPassword;
  String? isPermanentResident;
  String? gender;
  String? livedInAustralia;
  String? passportNumber;
  String? origin;
  String? visaClause;
  String? visaExpiryDate;
  String? dateOfBirth;
  String? userPhoto;
  String? deviceIp;
  String? shortPin;
  String? userType;
  bool? isPerDay;
  bool? isActive;

  UserRegistration(
      {this.userId,
      this.firstname,
      this.lastname,
      this.middlename,
      this.username,
      this.phonenumber,
      this.homephone,
      this.email,
      this.password,
      this.confirmPassword,
      this.isPermanentResident,
      this.gender,
      this.livedInAustralia,
      this.passportNumber,
      this.origin,
      this.visaClause,
      this.visaExpiryDate,
      this.dateOfBirth,
      this.userPhoto,
      this.deviceIp,
      this.shortPin,
      this.userType,
      this.isPerDay,
      this.isActive});

  UserRegistration.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    middlename = json['middlename'];
    username = json['username'];
    phonenumber = json['phonenumber'];
    homephone = json['homephone'];
    email = json['email'];
    password = json['password'];
    confirmPassword = json['confirmPassword'];
    isPermanentResident = json['isPermanentResident'];
    gender = json['gender'];
    livedInAustralia = json['livedInAustralia'];
    passportNumber = json['passportNumber'];
    origin = json['origin'];
    visaClause = json['visaClause'];
    visaExpiryDate = json['visaExpiryDate'];
    dateOfBirth = json['dateOfBirth'];
    userPhoto = json['userPhoto'];
    deviceIp = json['deviceIp'];
    shortPin = json['shortPin'];
    userType = json['userType'];
    isPerDay = json['isPerDay'];
    isActive = json['isActive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['middlename'] = this.middlename;
    data['username'] = this.username;
    data['phonenumber'] = this.phonenumber;
    data['homephone'] = this.homephone;
    data['email'] = this.email;
    data['password'] = this.password;
    data['confirmPassword'] = this.confirmPassword;
    data['isPermanentResident'] = this.isPermanentResident;
    data['gender'] = this.gender;
    data['livedInAustralia'] = this.livedInAustralia;
    data['passportNumber'] = this.passportNumber;
    data['origin'] = this.origin;
    data['visaClause'] = this.visaClause;
    data['visaExpiryDate'] = this.visaExpiryDate;
    data['dateOfBirth'] = this.dateOfBirth;
    data['userPhoto'] = this.userPhoto;
    data['deviceIp'] = this.deviceIp;
    data['shortPin'] = this.shortPin;
    data['userType'] = this.userType;
    data['isPerDay'] = this.isPerDay;
    data['isActive'] = this.isActive;
    return data;
  }
}
