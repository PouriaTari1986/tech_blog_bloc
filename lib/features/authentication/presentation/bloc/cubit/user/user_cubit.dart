import 'package:bloc/bloc.dart';
import 'package:tech_bloc/features/authentication/domain/entities/user_entity.dart';
import 'package:tech_bloc/features/authentication/domain/use_cases/get_user_use_case.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
   final GetUserUseCase getUserUseCase;
  UserCubit(this.getUserUseCase) : super(UserInitial());
Future<void> getUser(String userId) async {
    emit(UserLoading());

    try {
      final user = await getUserUseCase(userId);

      emit(UserSuccess(user as UserEntity));
    } catch (e) {
      emit(
        UserError(e.toString()),
      );
    }

}
}