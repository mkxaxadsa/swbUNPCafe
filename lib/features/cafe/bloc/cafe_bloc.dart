import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/models/cafe.dart';
import '../../../core/utils.dart';

part 'cafe_event.dart';
part 'cafe_state.dart';

class CafeBloc extends Bloc<CafeEvent, CafeState> {
  CafeBloc() : super(CafeInitial()) {
    on<GetCafesEvent>((event, emit) async {
      if (cafeList.isEmpty) {
        await getCafes();
        emit(CafeLoadedState(cafes: cafeList));
      } else {
        emit(CafeLoadedState(cafes: cafeList));
      }
    });

    on<AddCafeEvent>((event, emit) async {
      cafeList.add(event.cafe);
      await updateCafes();
      emit(CafeLoadedState(cafes: cafeList));
    });

    on<EditCafeEvent>((event, emit) async {
      for (Cafe cafe in cafeList) {
        if (cafe.id == event.cafe.id) {
          cafe.name = event.cafe.name;
          cafe.country = event.cafe.country;
          cafe.address = event.cafe.address;
          cafe.note = event.cafe.note;
          cafe.favorite = event.cafe.favorite;
          cafe.image1 = event.cafe.image1;
          cafe.image2 = event.cafe.image2;
          cafe.image3 = event.cafe.image3;
          cafe.image4 = event.cafe.image4;
        }
      }
      await updateCafes();
      emit(CafeLoadedState(cafes: cafeList));
    });

    on<DeleteCafeEvent>((event, emit) async {
      cafeList.removeWhere((element) => element.id == event.id);
      await updateCafes();
      emit(CafeLoadedState(cafes: cafeList));
    });
  }
}
