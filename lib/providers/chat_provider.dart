import 'package:chatgpt_flutter/models/chat_model.dart';
import 'package:chatgpt_flutter/services/ApiService.dart';
import 'package:flutter/material.dart';

class ChatProvider with ChangeNotifier{
  List<ChatModel> chatList=[];
  List<ChatModel> get getChatList{
    return chatList;
  }
  
  void addUserMessage({required String msg}){
    chatList.add(ChatModel(msg: msg, chatIndex: 0));
    notifyListeners();
  }
  
  Future<void> sendMessageAndGetAns({required String msg,required String chosenModelID}) async{
    chatList.addAll(await ApiService.sendMessage(
      message: msg,
      modelId: chosenModelID,
    ));
    notifyListeners();
  }

  void clearChatList(){
    print("clearing");
    chatList=[];
    notifyListeners();
  }
}