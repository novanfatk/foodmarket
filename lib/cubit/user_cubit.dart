import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:shoesque/models/models.dart';
import 'package:shoesque/services/services.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  Future<void> sigIn(String email, String password) async {
    ApiReturnValue<User> result = await UserServices.sigIn(email, password);

    if (result.value != null) {
      emit(UserLoaded(result.value));
    } else {
      (UserLoadedFailed(result.message));
    }
  }
}
