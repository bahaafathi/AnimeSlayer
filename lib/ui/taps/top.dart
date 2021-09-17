import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_request_bloc/widgets/request_builder.dart';
import 'package:myanime/cubits/top.dart';
import 'package:myanime/models/category.dart';
import 'package:myanime/ui/searchscrren.dart';

import 'package:myanime/ui/widgets/animecard.dart';
import 'package:myanime/ui/widgets/custom_page.dart';
import 'package:myanime/ui/widgets/header_swiper.dart';
import 'package:myanime/utils/menu.dart';
import 'package:myanime/utils/photos.dart';
import '../../utils/translate.dart';
import '../widgets/loading_view.dart';

class TopTap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RequestSliverPage<TopCubit, CategoryModel>(
        isTaped: false,
        popupMenu: Menu.home,
        title: 'Top Animes',
        headerBuilder: (context, state, value) =>
            SwiperHeader(list: List.from(SpaceXPhotos.company)..shuffle()),
        childrenBuilder: (context, state, value) => [
          AnimeGridView(
            value: value,
          ),
        ],
      ),
      floatingActionButton: RequestBuilder<TopCubit, CategoryModel>(
        onLoaded: (context, state, value) => FloatingActionButton(
          heroTag: null,
          tooltip: context.translate(
            'spacex.other.tooltip.search',
          ),
          onPressed: () => Navigator.pushNamed(context, SearchScreen.route),
          child: Icon(Icons.search),
        ),
      ),
    );
  }
}

class AnimeGridView extends StatelessWidget {
  final value;
  const AnimeGridView({
    Key key,
    @required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, childAspectRatio: 0.7),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return AnimeCard(
            cliced: true,
            id: value.top[index].malId,
            imageUrl: value.top[index].imageUrl,
            title: value.top[index].title,
          );
        },
        childCount: value.top.length,
      ),
    );
  }
}
