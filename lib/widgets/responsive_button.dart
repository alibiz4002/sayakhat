import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/tools/colors/colors.dart';

class ResponsiveButton extends StatelessWidget {
  final bool? isResponsive;
  final double? width;

  const ResponsiveButton({super.key, this.width, this.isResponsive = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Appcolors.mainColor),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(4, (index) {
            return Icon(Icons.arrow_forward_ios,
                color: Colors.white,
                size: (index == 0
                    ? 5
                    : index == 1
                        ? 9
                        : index == 2
                            ? 14
                            : index == 3
                                ? 18
                                : 0));
          })),
    );
  }
}
