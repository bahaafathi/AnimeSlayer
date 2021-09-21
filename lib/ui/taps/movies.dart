import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_request_bloc/widgets/request_builder.dart';
import 'package:myanime/cubits/manga.dart';
import 'package:myanime/cubits/movies.dart';
import 'package:myanime/models/category.dart';
import 'package:myanime/models/manga.dart';
import 'package:myanime/ui/widgets/animecard.dart';
import 'package:myanime/ui/widgets/custom_page.dart';
import 'package:myanime/ui/widgets/header_swiper.dart';
import 'package:myanime/ui/widgets/loading_view.dart';
import 'package:myanime/utils/menu.dart';
import 'package:myanime/utils/photos.dart';

class MangaTap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RequestSliverPage<Mangacubit, Manga>(
        isTaped: false,
        popupMenu: Menu.home,
        title: 'Manga',
        headerBuilder: (context, state, value) =>
            SwiperHeader(list: List.from(SpaceXPhotos.company)..shuffle()),
        childrenBuilder: (context, state, value) => [AnimeGridView()],
      ),
    );
  }
}

class AnimeGridView extends StatelessWidget {
  const AnimeGridView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RequestBuilder<Mangacubit, Manga>(
      onLoading: (context, state, value) => LoadingSliverView(),
      onLoaded: (context, state, value) => SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 0.7,
        ),
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return AnimeCard(
              cliced: true,
              title: value.top[index].title,
              id: value.top[index].malId,
              imageUrl: value.top[index].imageUrl,
            );
          },
          childCount: value.top.length,
        ),
      ),
    );
  }
}
