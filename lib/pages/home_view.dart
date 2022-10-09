import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubit/app_cubits.dart';
import 'package:travel_app/tools/colors/colors.dart';
import '../cubit/app_cubit_states.dart';

import '../widgets/app_large_text.dart';
import '../widgets/app_text.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  var images = {
    'balloning.png': 'Balloning',
    'hiking.png': 'Hiking',
    'kayaking.png': 'Kayaking',
    'snorkilng.png': 'Snorkilng',
  };

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);
    return Scaffold(body: BlocBuilder<AppCubits, Cubitstates>(
      
      builder: (context, state) {
        if (state is LoadedState) {
          var info = state.places;
            
          return Column(
            
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //menu text
              Container(
                padding: const EdgeInsets.only(top: 70, left: 20),
                child: Row(
                  children: [
                    const Icon(Icons.menu, size: 30, color: Colors.black54),
                    Expanded(child: Container()),
                    Container(
                      margin: const EdgeInsets.only(right: 20),
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.withOpacity(0.5),
                        image: const DecorationImage(
                            image: AssetImage('assets/images/balloning.png'),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              // Discover text
              Container(
                margin: const EdgeInsets.only(left: 20),
                child: const AppLargeTextWidget(
                  text: 'Discover',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              //tabbar
              Align(
                alignment: Alignment.centerLeft,
                child: TabBar(
                    labelPadding: const EdgeInsets.only(left: 20, right: 20),
                    controller: tabController,
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    isScrollable: true,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicator: const CircleTabindicator(
                        color: Appcolors.mainColor, radius: 4),
                    tabs: const [
                      Tab(text: 'Places'),
                      Tab(text: 'Inspiaration'),
                      Tab(text: 'Emotions'),
                    ]),
              ),
              Container(
                padding: const EdgeInsets.only(left: 20),
                height: 300,
                width: double.maxFinite,
                child: TabBarView(
                  controller: tabController,
                  children: [
                    ListView.builder(
                      itemCount: info.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            BlocProvider.of<AppCubits>(context).detailPage(info[index]);
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 15, top: 10),
                            width: 200,
                            height: 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              image:  DecorationImage(
                                  image:
                                   NetworkImage('http://mark.bslmeiyu.com/uploads/${info[index].images}'),
                                  fit: BoxFit.cover),
                            ),
                          ),
                        );
                      },
                    ),
                    ListView.builder(
                      itemCount: info.length,
                    
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin: const EdgeInsets.only(right: 15, top: 10),
                          width: 200,
                          height: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            image:  const DecorationImage(
                                image:
                                    NetworkImage(''),
                                fit: BoxFit.cover),
                          ),
                        );
                      },
                    ),
                    ListView.builder(
                      itemCount: 5,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin: const EdgeInsets.only(right: 15, top: 10),
                          width: 200,
                          height: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            image: const DecorationImage(
                                image: AssetImage(
                                    'assets/images/welcome-three.png'),
                                fit: BoxFit.cover),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    AppLargeTextWidget(
                      text: 'Explore more',
                      size: 22,
                    ),
                    AppTextWidget(text: 'See all', color: Appcolors.textColor1),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: double.maxFinite,
                height: 120,
                margin: const EdgeInsets.only(left: 20),
                child: ListView.builder(
                    itemCount: images.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) {
                      return Container(
                        margin: const EdgeInsets.only(right: 30),
                        child: Column(
                          children: [
                            Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/${images.keys.elementAt(index)}'),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            const SizedBox(height: 10),
                            AppTextWidget(
                              text: images.values.elementAt(index),
                              color: Appcolors.textColor2,
                            )
                          ],
                        ),
                      );
                    }),
              )
            ],
          );
        } else {
          return Center(child: Lottie.asset('assets/lottie/unfound.json'));
        }
      },
    ));
  }
}

class CircleTabindicator extends Decoration {
  final Color color;
  final double radius;

  const CircleTabindicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  final double radius;

  _CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint paint = Paint();
    paint.color = color;
    paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - radius / 2,
        configuration.size!.height - radius);
    canvas.drawCircle(offset + circleOffset, radius, paint);
  }
}
