// 图层
class Layer {
  // 未格式化原始数据
  Layer({required this.layer});

  late Map<String, dynamic> layer;
  // 大图地址
  late String url = layer["url"];

  // 图层层级index，按顺序逐层渲染
  late int index = layer["index"];

  Layer.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    index = json['index'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['index'] = index;
    return data;
  }
}
