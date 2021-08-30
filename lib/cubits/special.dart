import 'package:flutter_request_bloc/cubits/request_cubit.dart';
import 'package:flutter_request_bloc/cubits/request_state.dart';
import 'package:myanime/models/special.dart';
import 'package:myanime/repositories/special.dart';

/// Cubit that holds information about Top Anime.
class SpecialCubit extends RequestCubit<SpecialRepository, Special> {
  SpecialCubit(SpecialRepository repository) : super(repository);

  @override
  Future<void> loadData() async {
    emit(RequestState.loading(state.value));

    try {
      final data = await repository.fetchData();

      emit(RequestState.loaded(data));
    } catch (e) {
      emit(RequestState.error(e.toString()));
    }
  }
}
