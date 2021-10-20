import 'dart:ffi';
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

class TopTap extends StatefulWidget {
  @override
  _TopTapState createState() => _TopTapState();
}

class _TopTapState extends State<TopTap> {
  int page = 1;
  ScrollController controller = ScrollController();
  @override
  void initState() {
    controller.addListener(() async {
      if (controller.position.pixels == controller.position.maxScrollExtent &&
          page < 7) {
        page++;
        List<dynamic> addlist =
            await BlocProvider.of<TopCubit>(context).loadData(page: page);
        items.addAll(addlist);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RequestSliverPage<TopCubit, CategoryModel>(
        controller: controller,
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

List items = [];

class AnimeGridView extends StatefulWidget {
  final value;

  const AnimeGridView({
    Key key,
    @required this.value,
  }) : super(key: key);

  @override
  _AnimeGridViewState createState() => _AnimeGridViewState();
}

class _AnimeGridViewState extends State<AnimeGridView> {
  @override
  void initState() {
    items.addAll(widget.value.top);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, childAspectRatio: 0.7),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return AnimeCard(
            cliced: true,
            id: items[index].malId,
            imageUrl: items[index].imageUrl,
            title: items[index].title,
          );
        },
        childCount: items.length,
      ),
    );
  }
}
