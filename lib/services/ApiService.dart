import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:chatgpt_flutter/constants/api_const.dart';
import 'package:chatgpt_flutter/models/models_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<List<ModelsModel>> getModels() async {
    try {
      print("hello");
      var response= await http.get(Uri.parse('$baseUrl/models'),
          headers: {'Authorization': 'Bearer $YOUR_API_KEY'});
      print("hello2");
      Map<String,dynamic> jsonResponse= jsonDecode(response.body);

      if(jsonResponse['error']!=null){
        throw HttpException(jsonResponse['error']['message']);
      }
      print("jsonresponse: $jsonResponse");
      print("hello3");
      List temp =[];
      for(var value in jsonResponse['data']){
        temp.add(value);
        log('temp $value');
      }
      return ModelsModel.modelFromSnapShot(temp);
    } catch (error) {
      log("error $error");
      print("isman");
      rethrow;
    }
  }
}
