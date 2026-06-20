import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tech_bloc/features/authentication/domain/use_cases/register_use_case.dart';

part 'registe_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterUseCase registerUseCase;

  RegisterCubit(this.registerUseCase)
      : super(RegisterInitial());

  Future<void> register(String email) async {

    emit(RegisterLoading());

    try {
      final result =
          await registerUseCase(email);

      emit(RegisterSuccess(email: result.toString()));
    } catch (e) {
      emit(RegisterError(error: e.toString()));
    }
  }
}