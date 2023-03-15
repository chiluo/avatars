import 'dart:core';
import 'ui.image2provider.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:palette_generator/palette_generator.dart';
import 'dart:ui' as ui;

class LayerCanvas {
  // 通过该key获取组合后的图片信息 截图取色用
  static final GlobalKey layersCanvasKey = GlobalKey();

  // 获取canvas数据流
  static Future<ui.Image> getAvatarCanvasImage() async {
    RenderRepaintBoundary boundary = layersCanvasKey.currentContext!
        .findRenderObject() as RenderRepaintBoundary;
    return await boundary.toImage();
  }

  // 保存当前canvas png
  static Future<bool> capturePng() async {
    ui.Image image = await getAvatarCanvasImage();
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    if (byteData == null) return false;
    var res = await ImageGallerySaver.saveImage(
      quality: 100,
      byteData.buffer.asUint8List(),
    );
    return res['isSuccess'];
  }

  // 获取当前头像前景背景色
  static Future<List<Color>> getPaletteGenerator() async {
    try {
      ui.Image image = await getAvatarCanvasImage();
      UIImage2ImageProvider imgProvider = UIImage2ImageProvider(image);
      PaletteGenerator paletteGenerator =
          await PaletteGenerator.fromImageProvider(imgProvider);

      if (paletteGenerator.lightMutedColor == null ||
          paletteGenerator.dominantColor == null) return [];

      // 若两色相同获取补色
      if (paletteGenerator.lightMutedColor!.color.value ==
          paletteGenerator.dominantColor!.color.value) {
        return [
          getComplementaryColor(paletteGenerator.dominantColor!.color),
          paletteGenerator.dominantColor!.color
        ];
      }
      return [
        paletteGenerator.lightMutedColor!.color,
        paletteGenerator.dominantColor!.color
      ];
    } catch (e) {
      return [];
    }
  }

  static Color getComplementaryColor(Color color) {
    int r = 255 - color.red;
    int g = 255 - color.green;
    int b = 255 - color.blue;
    return Color.fromRGBO(r, g, b, 1);
  }
}
