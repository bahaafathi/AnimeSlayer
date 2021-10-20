import 'package:flutter_request_bloc/cubits/request_cubit.dart';
import 'package:flutter_request_bloc/cubits/request_state.dart';
import 'package:myanime/models/category.dart';
import 'package:myanime/repositories/top.dart';

/// Cubit that holds information about Top Anime.
class TopCubit extends RequestCubit<TopRepository, CategoryModel> {
  TopCubit(TopRepository repository) : super(repository);

  @override
  Future<List> loadData({int numTopCubit = 1}) async {
    if (numTopCubit == 1) {
      emit(RequestState.loading(state.value));
    }

    try {
      final data = await repository.fetchData(num: numTopCubit);
      emit(RequestState.loading(state.value));

      emit(RequestState.loaded(data));
      return data.top;
    } catch (e) {
      emit(RequestState.error(e.toString()));
      return null;
    }
  }

  Future<List> loadData2({int numTopCubit = 1}) async {
    try {
      final data = await repository.fetchData(num: numTopCubit);
      emit(RequestState.loaded(data));

      return data.top;
    } catch (e) {
      return null;
    }
  }
}
