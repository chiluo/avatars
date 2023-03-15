import 'package:flutter/material.dart';
import '../constant.dart';

class Button extends StatefulWidget {
  const Button({
    super.key,
    required this.onTap,
    required this.text,
    required this.icon,
    required this.backgroundColor,
    required this.textColor,
  });
  final GestureTapCallback onTap;
  final String text;
  final Widget icon;
  final Color backgroundColor;
  final Color textColor;

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: animatedDuration,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(color: widget.backgroundColor),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              widget.icon,
              const SizedBox(width: 10),
              Text(
                widget.text,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: widget.textColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
