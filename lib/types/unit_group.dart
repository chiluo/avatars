// 组件分类组（每个分类组下包含多种同分类组件）
import 'dart:math';
import 'unit.dart';
import 'unit_color.dart';

class UnitGroup {
  UnitGroup({required this.origin, required this.colors});
  // 未格式化原始数据
  late Map<String, dynamic> origin;
  // 组件分类组下的全部颜色配置
  late List<UnitColor> colors;

  // 组件分类组ID
  late String id = origin["pId"].toString();

  // 组件分类组的封面缩略图
  late String thumbUrl = origin["thumbUrl"];

  // 组件分类组下的多个组件配置数据
  // 该数据是原始数据，属性包含：int"itmId", String"thumbUrl"
  // 可以根据选中的组件ID和选中的颜色ID获取到对应的图层大图地址
  late List<Unit> units =
      origin["items"].map<Unit>((unit) => Unit(unit: unit)).toList();

  // 通过初始默认组合判断是否是必须存在的图层，随机组合功能时排除掉非必需的组件分类
  late bool necessary = origin["defItmId"] != 0;

  // 渲染该组件分类组需要的全部图层ID，可能由多张图片组成一个“图层”
  // 根据选中的组件ID，颜色ID，图层ID可以获取到一张图层大图地址
  // 索引格式[itemKey][layerKey][colorKey]
  late List<String> layerKeys =
      origin["lyrs"].map<String>((k) => '$k').toList();

  // 选中的组件ID
  late String unitKey = origin["defItmId"].toString();
  set setUnitKey(key) => {unitKey = key};

  // 选中的颜色配置
  late String colorKey = colors[0].id;
  set setColorKey(key) => {colorKey = key};

  // 获取一个随机组件
  Unit get getRandomUnit => units[Random().nextInt(units.length)];
  // 获取一个随机颜色
  UnitColor get getRandomUnitColor => colors[Random().nextInt(colors.length)];

  void random() {
    if (units.isEmpty || colors.isEmpty) return;
    // 随机获取该图层ItemId，该图层为必需就随机1个itmId，非必需Random随机1个itemId或者赋值0
    setUnitKey = necessary ? getRandomUnit.id : '0';
    // 随机获取该图层Color信息
    setColorKey = getRandomUnitColor.id;
  }

  UnitGroup.fromJson(Map<String, dynamic> json) {
    colors =
        json['colors'].map<UnitColor>((c) => UnitColor.fromJson(c)).toList();
    id = json['id'];
    thumbUrl = json['thumbUrl'];
    units = json['units'].map<Unit>((u) => Unit.fromJson(u)).toList();
    necessary = json['necessary'];
    layerKeys = json['layerKeys'].map<String>((k) => '$k').toList();
    unitKey = json['unitKey'];
    colorKey = json['colorKey'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['colors'] = colors.map((c) => c.toJson()).toList();
    data['id'] = id;
    data['thumbUrl'] = thumbUrl;
    data['units'] = units.map((u) => u.toJson()).toList();
    data['necessary'] = necessary;
    data['layerKeys'] = layerKeys;
    data['unitKey'] = unitKey;
    data['colorKey'] = colorKey;
    return data;
  }
}
