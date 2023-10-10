import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:whitefleet/constants/api.dart';
import 'package:whitefleet/constants/snackbar.dart';
import 'package:whitefleet/models/enquiry_chat.dart';
import 'package:whitefleet/services/api.dart';

class EnquiryChatCont extends GetxController {
  Rxn<EnquiryChatModel> chat = Rxn<EnquiryChatModel>();
  EnquiryChatModel? get getChat => chat.value;
  TextEditingController msgCont = TextEditingController();

  Future<List<ChatRequests>?> getEnquiryChat(String enquiryID) async {
    try {
      final response = await ApiService.get(
          "${ApiConstants.endpoint}enquiry/enquiries/chat/$enquiryID");
      if (response != null) {
        if (response.statusCode == 200) {
          EnquiryChatModel model=EnquiryChatModel.fromJson(jsonDecode(response.body));
          // chat.value = EnquiryChatModel.fromJson(jsonDecode(response.body));
        // final chatRequests= chat.value!.data!.chatRequests!.reversed.toList() ;
        // chat.value!.data!.chatRequests=chatRequests;
        // chat.refresh();
       
         model.data!.chatRequests!.sort((a,b)=>a.messagedDate!.compareTo(b.messagedDate!));
         final result=model.data!.chatRequests!.reversed.toList();
        return result;
        } else {
          showSnackbar(true, "Something went wrong");
        }
      } else {
        showSnackbar(true, "Something went wrong");
      }
    } catch (e) {
      print(e);
      showSnackbar(true, "Something went wrong");
    }
  }

  Future<void> sendMsg(String enquiryID) async {
    try {
      if (msgCont.text.isNotEmpty) {
        String msg = msgCont.text;
        msgCont.clear();
        await ApiService.post(
            "${ApiConstants.endpoint}enquiry/enquiries/reply",
            {"id": enquiryID, "name": msg});
       
      }
    } catch (e) {
      showSnackbar(true, "Something went wrong");
    }
  }
  // Future<void> uploadMedia(String path)async{
  //   final response=await ApiService.post('${ApiConstants.endpoint}enquiry/enquiries/upload', {})
  // }
}
