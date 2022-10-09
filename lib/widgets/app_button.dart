import 'package:flutter/material.dart';
import 'package:travel_app/widgets/app_text.dart';

class AppButton extends StatelessWidget {
  final bool? isIcon;
  final Color color;
  final String? text;
  final IconData? icon;
  final Color backgroundColor;
  final double size;
  final Color borderColor;
  const AppButton(
      {super.key,
      this.isIcon = false,
      this.text = 'hi',
      required this.color,
      this.icon,
      required this.backgroundColor,
      required this.borderColor,
      required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
            border: Border.all(color: borderColor, width: 1.0),
            borderRadius: BorderRadius.circular(15),
            color: backgroundColor),
        child: isIcon == false
            ? Center(
                child: AppTextWidget(text: text!, color: color),
              )
            : Center(
                child: Icon(
                  icon,
                  color: color,
                ),
              ));
  }
}
