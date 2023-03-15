// 组件可以设置的颜色
class UnitColor {
  // 未格式化原始数据
  UnitColor({required this.color});
  late Map<String, dynamic> color;

  // ID
  late String id = color["cId"].toString();

  // 色值
  late int value = int.parse('0xFF${color["cd"].replaceAll('#', '')}');

  UnitColor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['value'] = value;
    return data;
  }
}
