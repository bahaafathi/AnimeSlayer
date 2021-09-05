import 'package:flutter/cupertino.dart';
import 'package:flutter_request_bloc/cubits/request_cubit.dart';
import 'package:flutter_request_bloc/cubits/request_state.dart';
import 'package:myanime/models/search.dart';
import 'package:myanime/repositories/search.dart';

/// Cubit that holds information about Top Anime.
class SearchCubit extends RequestCubit<SearchRepository, Search> {
  SearchCubit(SearchRepository repository) : super(repository, autoLoad: false);
  @override
  Future<void> loadData({@required String query}) async {
    emit(RequestState.loading(state.value));

    try {
      final data = await repository.fetchData(query: query);
      emit(RequestState.loaded(data));
    } catch (e) {
      emit(RequestState.error(e.toString()));
    }
  }
}
