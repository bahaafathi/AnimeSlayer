import 'package:flutter/cupertino.dart';
import 'package:flutter_request_bloc/cubits/request_cubit.dart';
import 'package:flutter_request_bloc/cubits/request_state.dart';
import 'package:myanime/models/pictures.dart';
import 'package:myanime/repositories/pictures.dart';

/// Cubit that holds information about Top Anime.
class PicturesCubit extends RequestCubit<PicturesRepository, AnimePictures> {
  PicturesCubit(PicturesRepository repository)
      : super(repository, autoLoad: false);

  @override
  Future<void> loadData({@required int id}) async {
    emit(RequestState.loading(state.value));

    try {
      final data = await repository.fetchData(id: id);

      emit(RequestState.loaded(data));
    } catch (e) {
      emit(RequestState.error(e.toString()));
    }
  }
}
