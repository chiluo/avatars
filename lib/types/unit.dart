class Unit {
  // 未格式化原始数据
  Unit({required this.unit});

  late Map<String, dynamic> unit;

  // 组件ID
  late String id = unit["itmId"].toString();

  // 组件的封面缩略图
  late String thumbUrl = unit["thumbUrl"];

  Unit.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    thumbUrl = json['thumbUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['thumbUrl'] = thumbUrl;
    return data;
  }
}
