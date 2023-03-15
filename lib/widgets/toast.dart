import 'package:flutter/material.dart';

class Toast extends StatefulWidget {
  const Toast({
    super.key,
    required this.child,
    required this.show,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
  });
  final Widget child;
  final bool show;
  final String text;
  final Color backgroundColor;
  final Color textColor;
  @override
  State<Toast> createState() => _ToastState();
}

class _ToastState extends State<Toast> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        widget.child,
        AnimatedPositioned(
          left: 30,
          bottom: widget.show ? 40 : -60,
          width: size.width - 60,
          height: 50,
          curve: Curves.fastOutSlowIn,
          duration: const Duration(milliseconds: 500),
          child: Container(
            decoration: BoxDecoration(color: widget.backgroundColor),
            child: Center(
              child: Text(
                widget.text,
                style: TextStyle(
                  color: widget.textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                  letterSpacing: 2,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
