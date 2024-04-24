class ModelsModel {
  final String id;
  final int created;
  final String owned_by;

  ModelsModel({required this.id, required this.created, required this.owned_by});

  factory ModelsModel.fromJson(Map<String, dynamic> json) =>
      ModelsModel(id: json['id'], created: json['created'], owned_by: json['owned_by']);

  static List<ModelsModel> modelFromSnapShot(List modelSnapshot){
    return modelSnapshot.map((data) => ModelsModel.fromJson(data)).toList();
  }
}
