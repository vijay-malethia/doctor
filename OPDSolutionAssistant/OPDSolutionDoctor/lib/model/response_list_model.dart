class ResponseListModel {
  String id;
  String listItem;
  bool isActive;
  ResponseListModel({
    required this.id,
    required this.listItem,
    required this.isActive,
  });

  factory ResponseListModel.fromJson(Map<String, dynamic> json) {
    return ResponseListModel(
        id: json['id'], listItem: json['listItem'], isActive: json['isActive']);
  }
}
