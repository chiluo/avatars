import 'package:flutter/material.dart';

class LayerColorsPicker extends StatefulWidget {
  const LayerColorsPicker({
    super.key,
    required this.onPick,
    required this.value,
    required this.selected,
    required this.checkColor,
    required this.backgroundColor,
    required this.radius,
  });
  final GestureTapCallback onPick;
  final int value;
  final bool selected;
  final Color checkColor;
  final Color backgroundColor;
  final double radius;
  @override
  State<LayerColorsPicker> createState() => _LayerColorsPickerState();
}

class _LayerColorsPickerState extends State<LayerColorsPicker> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: widget.onPick,
      child: Container(
        width: size.width / 9,
        height: size.width / 9,
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Color(widget.value),
          border: Border.all(
            color: widget.checkColor,
            width: widget.selected ? 6 : 0,
          ),
          borderRadius: BorderRadius.circular(widget.radius / 2),
        ),
        child: SizedBox(
          width: size.width / 9,
          height: size.width / 9,
          child: widget.selected
              ? Center(
                  child: Icon(
                  Icons.check,
                  color: widget.checkColor,
                ))
              : const SizedBox(),
        ),
      ),
    );
  }
}
