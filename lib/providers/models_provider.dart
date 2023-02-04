import 'package:chatgpt_flutter/models/models_model.dart';
import 'package:chatgpt_flutter/services/ApiService.dart';
import 'package:flutter/material.dart';

class ModelsProvider with ChangeNotifier{
  String currentModel='text-davinci-003';
  String get getCurrentModel{
    return currentModel;
  }
  void setCurrentModel(String newModel){
    currentModel = newModel;
    notifyListeners();
  }

  // list is not yet to be used may be use it late on..
  List<ModelsModel> modelList=[];
  List<ModelsModel> get getModelsList{
    return modelList;
  }

  Future<List<ModelsModel>> getAllModels () async{
    modelList=await ApiService.getModels();
    return modelList;
  }

}