import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubit/app_cubits.dart';
import 'package:travel_app/tools/colors/colors.dart';

import '../widgets/app_large_text.dart';
import '../widgets/app_text.dart';
import '../widgets/responsive_button.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = [
    "welcome-two.png",
    "welcome-one.png",
    "welcome-three.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.blue,
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: ((context, index) {
            return Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/${images[index]}'),
                    fit: BoxFit.cover),
              ),
              child: Container(
                  margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const AppLargeTextWidget(text: 'Trips'),
                            const AppTextWidget(
                              text: 'Mountain',
                              size: 30,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const SizedBox(
                                width: 250,
                                child: AppTextWidget(
                                  text:
                                      'Mountain hikes give you an incredible sense of freedom along with endurance tests',
                                  color: Appcolors.textColor2,
                                  size: 14,
                                )),
                            const SizedBox(height: 40),
                            GestureDetector(
                              onTap: () {
                                BlocProvider.of<AppCubits>(context).getData();
                               
                              },
                              child: SizedBox(
                                width: 200,
                                child: Row(
                                  children: const [
                                    ResponsiveButton(
                                      width: 120,
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: List.generate(3, (indexDots) {
                            return Container(
                              margin: const EdgeInsets.only(bottom: 2),
                              width: 8,
                              height: index == indexDots ? 25 : 8,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: index == indexDots
                                      ? Appcolors.mainColor
                                      : Appcolors.mainColor.withOpacity(0.3)),
                            );
                          }),
                        )
                      ])),
            );
          })),
    );
  }
}
