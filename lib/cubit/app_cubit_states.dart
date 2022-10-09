import 'package:equatable/equatable.dart';
import 'package:travel_app/model/data_model.dart';

abstract class Cubitstates extends Equatable {}

class InitialState extends Cubitstates {
  @override
  List<Object> get props => [];
}

class WelcomeState extends Cubitstates {
  @override
  List<Object> get props => [];
}

class LoadingState extends Cubitstates {
  @override
  List<Object> get props => [];
}


class LoadedState extends Cubitstates {
  LoadedState(this.places);
  final List<DataModel> places;
  @override
  List<Object> get props => [places];
}



class DetailState extends Cubitstates {
  DetailState(this.place);
  final DataModel place;
  @override
  List<Object> get props => [place];
}

