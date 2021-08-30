import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_request_bloc/widgets/request_builder.dart';
import 'package:myanime/cubits/top.dart';
import 'package:myanime/models/top.dart';
import 'package:myanime/ui/widgets/custom_page.dart';
import 'package:myanime/ui/widgets/header_swiper.dart';
import 'package:myanime/utils/photos.dart';

class TopTap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RequestSliverPage<TopCubit, TopAnime>(
      title: 'Top Animes',
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
    return RequestBuilder<TopCubit, TopAnime>(
      onLoaded: (context, state, value) => SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, childAspectRatio: 0.5),
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return InkWell(
              onTap: () => null,
              child: new Container(
                width: 1000,
                height: 1000,
                //  color: Colors.red,
                //height: 150.0,
                margin: EdgeInsets.all(5),
                child: Image.network(
                  value.top[index].imageUrl,
                  fit: BoxFit.fill,
                ),
              ),
            );
          },
          childCount: value.top.length,
        ),
      ),
    );
  }
}
