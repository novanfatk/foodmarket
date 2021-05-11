import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shoesque/models/models.dart';
import 'package:shoesque/services/services.dart';

part 'shoes_state.dart';

class ShoesCubit extends Cubit<ShoesState> {
  ShoesCubit() : super(ShoesInitial());

  Future<void> getShoes() async {
    ApiReturnValue<List<Shoes>> result = await ShoesServices.getShoes();

    if (result.value != null) {
      emit(ShoesLoaded(result.value));
    } else {
      emit(ShoesLoadingFailed(result.message));
    }
  }
}
