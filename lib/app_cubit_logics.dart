import 'package:flutter/material.dart';
import 'package:travel_app/pages/welcome_page.dart';

import 'cubit/app_cubit_states.dart';
import 'cubit/app_cubits.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'pages/detail_view.dart';
import 'pages/navpages/main_view.dart';

class AppCubitLogics extends StatefulWidget {
  const AppCubitLogics({super.key});

  @override
  State<AppCubitLogics> createState() => _AppCubitLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits, Cubitstates>(
        builder: (context, state) {
          if (state is WelcomeState) {
            return const WelcomePage();
          }
          if (state is LoadedState) {
            return const MainPageView();
          }
            if (state is DetailState) {
            return const DetailPage();
          }
          if (state is LoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
