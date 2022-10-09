import 'package:flutter/material.dart';
import 'package:travel_app/tools/colors/colors.dart';
import 'package:travel_app/widgets/app_text.dart';

class ResponsiveButton extends StatelessWidget {
  final bool? isResponsive;
  final double? width;

  const ResponsiveButton(
      {super.key, this.width = 120, this.isResponsive = false});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: isResponsive == true ? double.maxFinite : width,
        height: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Appcolors.mainColor),
        child: Row(
            mainAxisAlignment: isResponsive == true
                ? MainAxisAlignment.spaceBetween
                : MainAxisAlignment.center,
            children: [
              isResponsive == true
                  ? Container(
                      margin: const EdgeInsets.only(left: 20),
                      child: const AppTextWidget(
                        text: 'Book right now',
                        color: Colors.white,
                      ),
                    )
                  : Container(),
              const Icon(
                Icons.arrow_right_alt_outlined,
                color: Colors.white,
              )
            ]),
      ),
    );
  }
}
