import 'package:chatgpt_flutter/models/models_model.dart';
import 'package:chatgpt_flutter/services/ApiService.dart';
import 'package:chatgpt_flutter/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class ModelsProvider with ChangeNotifier{
  String currentModel="whisper-1";//'gpt-3.5-turbo-16k-0613';
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

  Future<List<ModelsModel>> getAllModels (BuildContext context) async{
    try{
      modelList=await ApiService.getModels();
    }catch(e){
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: Duration(seconds: 1),
        content: TextWidget(
          label: e.toString(),
          fontSize: 15,
        ),
        backgroundColor: Colors.red,
      ));
    }
   // modelList=await ApiService.getModels();
    return modelList;
  }

}