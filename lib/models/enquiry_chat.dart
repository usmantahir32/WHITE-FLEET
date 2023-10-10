class EnquiryChatModel {
  Data? data;
  bool? succeeded;

  EnquiryChatModel({this.data, this.succeeded});

  EnquiryChatModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    
    succeeded = json['succeeded'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
   
    data['succeeded'] = this.succeeded;
    return data;
  }
}

class Data {
  List<String>? attachments;
  List<ChatRequests>? chatRequests;
  bool? driverAssigned;

  Data({this.attachments, this.chatRequests, this.driverAssigned});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['attachments'] != null) {
      attachments = <String>[];
      json['attachments'].forEach((v) {
        attachments!.add(v);
      });
    }
    if (json['chatRequests'] != null) {
      chatRequests = <ChatRequests>[];
      json['chatRequests'].forEach((v) {
        chatRequests!.add(new ChatRequests.fromJson(v));
      });
    }
    driverAssigned = json['driverAssigned'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.attachments != null) {
      data['attachments'] = this.attachments!.map((v) => v).toList();
    }
    if (this.chatRequests != null) {
      data['chatRequests'] = this.chatRequests!.map((v) => v.toJson()).toList();
    }
    data['driverAssigned'] = this.driverAssigned;
    return data;
  }
}

class ChatRequests {
  String? from;
  String? messagedDate;
  String? comments;
  bool? isSent;

  ChatRequests({this.from, this.messagedDate, this.comments, this.isSent});

  ChatRequests.fromJson(Map<String, dynamic> json) {
    from = json['from'];
    messagedDate = json['messagedDate'];
    comments = json['comments'];
    isSent = json['isSent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['from'] = this.from;
    data['messagedDate'] = this.messagedDate;
    data['comments'] = this.comments;
    data['isSent'] = this.isSent;
    return data;
  }
}