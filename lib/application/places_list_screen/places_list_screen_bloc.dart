import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'places_list_screen_event.dart';
part 'places_list_screen_state.dart';

class PlacesListScreenBloc
    extends Bloc<PlacesListScreenEvent, PlacesListScreenState> {
  Future sleep1() {
    return Future.delayed(Duration(seconds: 2), () => "1");
  }

  PlacesListScreenBloc() : super(PlacesListScreenInitial()) {
    on<PlacesListScreenEvent>((event, emit) async {
      emit(PlacesListScreenLoading());
      await sleep1();
      emit(PlacesListScreenLoaded());
    });
  }
}
