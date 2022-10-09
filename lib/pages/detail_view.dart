import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubit/app_cubit_states.dart';
import 'package:travel_app/cubit/app_cubits.dart';
import 'package:travel_app/tools/colors/colors.dart';
import 'package:travel_app/widgets/app_button.dart';
import 'package:travel_app/widgets/app_large_text.dart';
import 'package:travel_app/widgets/app_text.dart';

import '../widgets/responsive_button.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int selectedindex = -1;
  int gottenStars = 4;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubits, Cubitstates>(builder: ((context, state) {
      DetailState infoDetails = state as DetailState;
      return Scaffold(
        body: SizedBox(
            width: double.maxFinite,
            height: double.maxFinite,
            child: Stack(
              children: [
                Positioned(
                    left: 0,
                    right: 0,
                    child: Container(
                      width: double.maxFinite,
                      height: 350,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                'http://mark.bslmeiyu.com/uploads/${infoDetails.place.images}'),
                            fit: BoxFit.cover),
                      ),
                    )),
                Positioned(
                    left: 20,
                    top: 50,
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            BlocProvider.of<AppCubits>(context).goHome();
                          },
                          icon: const Icon(Icons.menu),
                          color: Colors.white,
                        ),
                      ],
                    )),
                Positioned(
                    top: 320,
                    child: Container(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 30),
                      width: MediaQuery.of(context).size.width,
                      height: 500,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AppLargeTextWidget(
                                    text: infoDetails.place.name,
                                    color: Colors.black.withOpacity(0.8)),
                                AppLargeTextWidget(
                                  text: '\$ ${infoDetails.place.price}',
                                  color: Appcolors.mainColor,
                                )
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                const Icon(Icons.location_on,
                                    color: Appcolors.mainColor),
                                const SizedBox(width: 5),
                                AppTextWidget(
                                    text: infoDetails.place.location,
                                    color: Appcolors.textColor1),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                Wrap(
                                  children: List.generate(5, (index) {
                                    return Icon(Icons.star,
                                        color: index < infoDetails.place.stars
                                            ? Appcolors.starColor
                                            : Appcolors.textColor2);
                                  }),
                                ),
                                const SizedBox(width: 10),
                                AppTextWidget(
                                    text: '(${infoDetails.place.stars}.0)',
                                    color: Appcolors.textColor2),
                              ],
                            ),
                            const SizedBox(height: 25),
                            AppLargeTextWidget(
                              text: 'People',
                              color: Colors.black.withOpacity(0.8),
                              size: 20,
                            ),
                            const SizedBox(height: 5),
                            const AppTextWidget(
                              text: 'Number of visitors',
                              color: Appcolors.mainTextColor,
                            ),
                            const SizedBox(height: 15),
                            Wrap(
                              children: List.generate(5, (index) {
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectedindex = index;
                                    });
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(right: 10),
                                    child: AppButton(
                                        color: selectedindex == index
                                            ? Colors.white
                                            : Colors.black,
                                        backgroundColor: selectedindex == index
                                            ? Colors.black
                                            : Appcolors.buttonBackground,
                                        borderColor: selectedindex == index
                                            ? Colors.black
                                            : Appcolors.buttonBackground,
                                        text: (index + 1).toString(),
                                        size: 50),
                                  ),
                                );
                              }),
                            ),
                            const SizedBox(height: 20),
                            AppLargeTextWidget(
                                text: 'Description:',
                                color: Colors.black.withOpacity(0.8),
                                size: 20),
                            const SizedBox(height: 10),
                            AppTextWidget(
                                text: infoDetails.place.description,
                                color: Appcolors.mainTextColor),
                          ]),
                    )),
                Positioned(
                    bottom: 20,
                    left: 20,
                    right: 20,
                    child: Row(
                      children:const [
                        AppButton(
                            color: Appcolors.textColor2,
                            backgroundColor: Colors.white,
                            borderColor: Appcolors.textColor1,
                            isIcon: true,
                            icon: Icons.favorite_border,
                            size: 60),
                         SizedBox(width: 20),
                         ResponsiveButton(
                          isResponsive: true,
                        )
                      ],
                    ))
              ],
            )),
      );
    }));
  }
}
// 2:50:52
