import 'package:flutter/material.dart';
import 'cached_network_image.dart';
import '../constant.dart';

class LayerTypePicker extends StatefulWidget {
  const LayerTypePicker({
    super.key,
    required this.onPick,
    required this.url,
    required this.selected,
    required this.checkColor,
    required this.backgroundColor,
  });

  final GestureTapCallback onPick;
  final String url;
  final bool selected;
  final Color checkColor;
  final Color backgroundColor;
  @override
  State<LayerTypePicker> createState() => _LayerTypePickerState();
}

class _LayerTypePickerState extends State<LayerTypePicker> {
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
          width: size.width / 7.5,
          height: size.width / 7.5,
          padding: EdgeInsets.all(size.width / 80),
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                width: widget.selected ? 5 : 0,
                color: widget.backgroundColor,
              ),
            ),
          ),
          child: Container(
            margin: const EdgeInsets.all(9),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
