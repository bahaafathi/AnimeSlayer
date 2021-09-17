import 'package:flutter/cupertino.dart';
import 'package:flutter_request_bloc/cubits/request_cubit.dart';
import 'package:flutter_request_bloc/cubits/request_state.dart';
import 'package:myanime/models/pictures.dart';
import 'package:myanime/models/recommendation.dart';
import 'package:myanime/models/review.dart';
import 'package:myanime/repositories/details/pictures.dart';
import 'package:myanime/repositories/details/recommendation.dart';
import 'package:myanime/repositories/details/review.dart';

/// Cubit that holds information about Top Anime.
class ReviewCubit extends RequestCubit<ReviewsRepository, Review> {
  ReviewCubit(ReviewsRepository repository)
      : super(repository, autoLoad: false);

  @override
  Future<void> loadData({@required int id}) async {
    emit(RequestState.loading(state.value));

    try {
      await Future.delayed(const Duration(seconds: 2));
      final data = await repository.fetchData(id: id);

      emit(RequestState.loaded(data));
    } catch (e) {
      emit(RequestState.error(e.toString()));
    }
  }
}
