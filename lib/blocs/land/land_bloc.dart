import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'land_event.dart';
part 'land_state.dart';
part 'land_bloc.freezed.dart';

class LandBloc extends Bloc<LandEvent, LandState> {
  LandBloc() : super(_Initial()) {
    on<LandEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
