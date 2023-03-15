import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'dart:ui' as ui;

class UIImage2ImageProvider extends ImageProvider<UIImage2ImageProvider> {
  const UIImage2ImageProvider(this.image, {this.scale = 1.0});
  final ui.Image image;
  final double scale;

  @override
  ImageStreamCompleter load(UIImage2ImageProvider key, decode) {
    return MultiFrameImageStreamCompleter(
      codec: _loadAsync(key),
      scale: key.scale,
    );
  }

  Future<ui.Codec> _loadAsync(UIImage2ImageProvider key) async {
    assert(key == this);
    //image转ByteData
    final a = await image.toByteData(format: ui.ImageByteFormat.png);
    ImmutableBuffer immutableBuffer =
        await ui.ImmutableBuffer.fromUint8List(a!.buffer.asUint8List());
    var codec = await PaintingBinding.instance
        .instantiateImageCodecFromBuffer(immutableBuffer);
    return codec;
  }

  @override
  Future<UIImage2ImageProvider> obtainKey(ImageConfiguration configuration) {
    return SynchronousFuture<UIImage2ImageProvider>(this);
  }

  @override
  bool operator ==(dynamic other) {
    if (other.runtimeType != runtimeType) return false;
    final UIImage2ImageProvider typedOther = other;
    return image == typedOther.image && scale == typedOther.scale;
  }

  @override
  int get hashCode => Object.hash(image.hashCode, scale);

  @override
  String toString() =>
      '$runtimeType(${describeIdentity(image)}, scale: $scale)';
}
