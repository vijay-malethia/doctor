class ResponseModel {
  String id;
  String listItem;
  bool isActive;
  ResponseModel({
    required this.id,
    required this.listItem,
    required this.isActive,
  });

  factory ResponseModel.fromJson(Map<String, dynamic> json) {
    return ResponseModel(
        id: json['id'], listItem: json['listItem'], isActive: json['isActive']);
  }
}
