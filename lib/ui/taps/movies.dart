import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_request_bloc/widgets/request_builder.dart';
import 'package:myanime/cubits/movies.dart';
import 'package:myanime/models/movies.dart';
import 'package:myanime/ui/widgets/custom_page.dart';
import 'package:myanime/ui/widgets/header_swiper.dart';
import 'package:myanime/utils/photos.dart';

class MoviesTap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RequestSliverPage<MoviesCubit, Movies>(
      title: 'Movies',
      headerBuilder: (context, state, value) =>
          SwiperHeader(list: List.from(SpaceXPhotos.company)..shuffle()),
      childrenBuilder: (context, state, value) => [AnimeGridView()],
    );
  }
}

class AnimeGridView extends StatelessWidget {
  const AnimeGridView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RequestBuilder<MoviesCubit, Movies>(
      onLoaded: (context, state, value) => SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
        ),
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return new Container(
              //color: Colors.amberAccent,
              //height: 150.0,
              margin: EdgeInsets.all(10),
              child: Image.network(
                value.top[index].imageUrl,
                fit: BoxFit.fill,
              ),
            );
          },
          childCount: value.top.length,
        ),
      ),
    );
  }
}
