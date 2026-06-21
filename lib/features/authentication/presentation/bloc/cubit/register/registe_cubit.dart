import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tech_bloc/core/networks/shared_prefrenes.dart';
import 'package:tech_bloc/features/authentication/domain/entities/register_entity.dart';
import 'package:tech_bloc/features/authentication/domain/use_cases/register_use_case.dart';

part 'registe_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterUseCase registerUseCase;

  RegisterCubit(this.registerUseCase) : super(RegisterInitial());

  Future<void> register(String email) async {
    emit(RegisterLoading());

    try {
      final result = await registerUseCase(email);

      if (result.data != null) {
        await SharedPrefManager.saveEmail(email);
        emit(RegisterSuccess(email: result.data!));
      } else {
        emit(RegisterError(error: result.error ?? "Register Failed"));
      }
    } catch (e) {
      emit(RegisterError(error: e.toString()));
    }
  }
}
