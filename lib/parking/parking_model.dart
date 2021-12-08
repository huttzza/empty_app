import 'dart:convert';

class Space {
  bool isFull;

  Space(this.isFull);

  Space.fromJson(Map<String, dynamic> json) : isFull = json['is_full'];

  @override
  String toString() {
    return '[$isFull]';
  }
}

List<Space> parseSpaces(response) {
  // print(response);
  // final parsed = json.decode(response).cast<Map<String, dynamic>>();
  return response.map<Space>((json) => Space.fromJson(json)).toList();
}
