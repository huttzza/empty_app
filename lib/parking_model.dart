import 'dart:convert';

class Space {
  bool isEmpty;
  double x1, y1, x2, y2;

  Space(this.isEmpty, this.x1, this.y1, this.x2, this.y2);

  Space.fromJson(Map<String, dynamic> json)
      : isEmpty = json['isEmpty'],
        x1 = json['x1'],
        y1 = json['y1'],
        x2 = json['x2'],
        y2 = json['y2'];
}

List<Space> parseSpaces(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Space>((json) => Space.fromJson(json)).toList();
}
