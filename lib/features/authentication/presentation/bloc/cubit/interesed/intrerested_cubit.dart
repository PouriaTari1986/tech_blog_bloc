import 'package:bloc/bloc.dart';
import 'package:tech_bloc/features/authentication/domain/use_cases/get_categories_use_case.dart';
import 'package:tech_bloc/features/authentication/domain/use_cases/get_tags_use_case.dart';
import 'package:tech_bloc/features/home/domain/home_entities/categories_entity.dart';
import 'package:tech_bloc/features/home/domain/home_entities/tags_entity.dart';

part 'intrerested_state.dart';


class InterestsCubit extends Cubit<InterestsState> {
  final GetCategoriesUseCase getCategoriesUseCase;
  final GetTagsUseCase getTagsUseCase;

  InterestsCubit(
    this.getCategoriesUseCase,
    this.getTagsUseCase,
  ) : super(InterestsInitial());

  Future<void> loadData() async {
    emit(InterestsLoading());

    try {
      final categories =
          await getCategoriesUseCase();

      final tags =
          await getTagsUseCase();

      emit(
        InterestsLoaded(
          categories: categories.data!,
          tags: tags.data!,
        ),
      );
    } catch (e) {
      emit(
        InterestsError(
          e.toString(),
        ),
      );
    }
  }
}