import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:chatgpt_flutter/constants/api_const.dart';
import 'package:chatgpt_flutter/models/chat_model.dart';
import 'package:chatgpt_flutter/models/models_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<List<ModelsModel>> getModels() async {
    try {
      var response = await http.get(Uri.parse('$baseUrl/models'),
          headers: {'Authorization': 'Bearer $YOUR_API_KEY'});
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);

      if (jsonResponse['error'] != null) {
        throw HttpException(jsonResponse['error']['message']);
      }
      // print("jsonresponse: $jsonResponse");
      List temp = [];
      for (var value in jsonResponse['data']) {
        temp.add(value);
        // log('temp $value');
      }
      return ModelsModel.modelFromSnapShot(temp);
    } catch (error) {
      log("error $error");
      rethrow;
    }
  }

  //Send Message to model
  static Future<List<ChatModel>> sendMessage(
      {required String message, required String modelId}) async {
    try {
      var response = await http.post(Uri.parse('$baseUrl/completions'),
          headers: {
            'Authorization': 'Bearer $YOUR_API_KEY',
            'Content-Type': 'application/json'
          },
          body: jsonEncode({
            "model": modelId,
            "prompt": message,
            "max_tokens": 1000,
          }));
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);

      if (jsonResponse['error'] != null) {
        throw HttpException(jsonResponse['error']['message']);
      }
      List<ChatModel> chatList = [];

      if (jsonResponse['choices'].length > 0) {
        // log('jsonesponce[choices]text ${jsonResponse['choices'][0]['text']}');
        chatList = List.generate(
          jsonResponse['choices'].length,
          (index) => ChatModel(
            msg: jsonResponse['choices'][index]['text'].toString().trim(),
            chatIndex: 1,
          ),
        );
      }

      return chatList;
    } catch (error) {
      log("error $error");
      rethrow;
    }
  }
}
