import 'package:flutter/cupertino.dart';
import 'package:flutter_request_bloc/cubits/request_cubit.dart';
import 'package:flutter_request_bloc/cubits/request_state.dart';
import 'package:myanime/models/characters.dart';
import 'package:myanime/repositories/details.dart';
import 'package:myanime/repositories/details/characterstuff.dart';
import 'package:myanime/utils/url.dart';

/// Cubit that holds information about Top Anime.
class CharacterCubit
    extends RequestCubit<CharactersStaffRepository, Character> {
  CharacterCubit(CharactersStaffRepository repository)
      : super(repository, autoLoad: false);

  @override
  Future<void> loadData({@required int id, Request request}) async {
    emit(RequestState.loading(state.value));

    try {
      await Future.delayed(const Duration(seconds: 3));
      final data = await repository.fetchData(id: id, request: request);

      emit(RequestState.loaded(data));
    } catch (e) {
      emit(RequestState.error(e.toString()));
    }
  }
}
