import 'package:flutter/material.dart';

import '../widgets/app_large_text.dart';
import '../widgets/app_text.dart';

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
                      image: AssetImage('assets/imges/${images[index]}'),
                      fit: BoxFit.cover),
                ),
                child: Container(
                    margin:
                        const EdgeInsets.only(top: 150, left: 20, right: 20),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const AppLargeTextWidget(text: 'Trips'),
                            const AppTextWidget(
                              text: 'Mountain',
                              size: 30,
                            ),
                            Container(
                              width: 250,
                              child: const AppTextWidget(
                                  text:
                                      'Mountain hikes give you an incredible sense of freedom along with endurance tests',
                                  color: Colors.grey),
                            )
                          ],
                        )
                      ],
                    )));
          })),
    );
  }
}
