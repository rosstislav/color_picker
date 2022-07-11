class StateModel {
  final String name;
  final String code;

  StateModel({
    required this.name,
    required this.code,
  });

  factory StateModel.fromJson(Map<String, dynamic> json) => StateModel(
        name: json['name'] ?? '',
        code: json['code'] ?? '',
      );
}
