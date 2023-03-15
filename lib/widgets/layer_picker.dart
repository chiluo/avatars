import 'cached_network_image.dart';
import 'package:flutter/material.dart';

import '../constant.dart';

class LayerPreviewPicker extends StatefulWidget {
  const LayerPreviewPicker({
    super.key,
    required this.onPick,
    required this.url,
    required this.selected,
    required this.checkColor,
    required this.backgroundColor,
    required this.radius,
  });
  final GestureTapCallback onPick;
  final String url;
  final bool selected;
  final Color checkColor;
  final Color backgroundColor;
  final double radius;

  @override
  State<LayerPreviewPicker> createState() => _LayerPreviewPickerState();
}

class _LayerPreviewPickerState extends State<LayerPreviewPicker> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: widget.onPick,
      child: CachedNetworkImageBox(
        url: widget.url,
        loaderColor: widget.checkColor,
        builder: (context, imageProvider) => AnimatedContainer(
          duration: animatedDuration,
          width: size.width / 8.5,
          height: size.width / 8.5,
          margin: EdgeInsets.all(size.width / 100),
          decoration: BoxDecoration(
            color: widget.checkColor,
            border: Border.all(
              width: widget.selected ? 4 : 0,
              color: widget.checkColor,
            ),
            borderRadius: BorderRadius.circular(widget.radius / 2),
            image: DecorationImage(image: imageProvider, fit: BoxFit.contain),
          ),
          child: Container(
            width: size.width / 8.5,
            height: size.width / 8.5,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(widget.radius / 3),
              color:
                  widget.backgroundColor.withOpacity(widget.selected ? .6 : 0),
            ),
            child: widget.selected
                ? Icon(Icons.check, color: widget.checkColor)
                : const SizedBox(),
          ),
        ),
      ),
    );
  }
}
