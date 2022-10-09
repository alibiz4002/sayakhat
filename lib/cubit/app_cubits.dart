import 'package:travel_app/model/data_model.dart';

import '../services/data_survices.dart';
import 'app_cubit_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubits extends Cubit<Cubitstates> {
  AppCubits({required this.data}) : super(InitialState()) {
    emit(WelcomeState());
  }
  late dynamic places;
  final Datasurices data;

  void getData() async {
    try {
      emit(LoadingState());
      places = await data.getInfo();
      emit(LoadedState(places));
    } on Exception catch (_) {}
  }

  detailPage(DataModel data) {
    emit(DetailState(data));
  }

  goHome() {
    emit(LoadedState(places));
  }
}
