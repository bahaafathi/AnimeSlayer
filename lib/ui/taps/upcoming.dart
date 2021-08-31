import 'package:big_tip/big_tip.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_request_bloc/widgets/request_builder.dart';
import 'package:myanime/cubits/upcoming.dart';
import 'package:myanime/models/category.dart';
import 'package:myanime/ui/widgets/custom_page.dart';
import 'package:myanime/ui/widgets/header_swiper.dart';
import 'package:myanime/ui/widgets/vehicle_cell.dart';
import 'package:myanime/utils/menu.dart';
import 'package:myanime/utils/photos.dart';
import 'package:search_page/search_page.dart';
import '../../utils/translate.dart';
import '../widgets/loading_view.dart';

class UpcomingTap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: RequestSliverPage<UpcomingCubit, CategoryModel>(
          popupMenu: Menu.home,
          title: 'Upcoming Animes',
          headerBuilder: (context, state, value) =>
              SwiperHeader(list: List.from(SpaceXPhotos.company)..shuffle()),
          childrenBuilder: (context, state, value) => [AnimeGridView()],
        ),
        floatingActionButton: RequestBuilder<UpcomingCubit, CategoryModel>(
          onLoaded: (context, state, value) => FloatingActionButton(
            heroTag: null,
            tooltip: context.translate(
              'spacex.other.tooltip.search',
            ),
            onPressed: () => showSearch(
              context: context,
              delegate: SearchPage<Top>(
                items: value.top,
                searchLabel: context.translate(
                  'spacex.other.tooltip.search',
                ),
                suggestion: BigTip(
                  title: Text(
                    context.translate(
                      'spacex.vehicle.title',
                    ),
                    style: Theme.of(context).textTheme.headline6.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  subtitle: Text(
                    context.translate(
                      'spacex.search.suggestion.vehicle',
                    ),
                    style: Theme.of(context).textTheme.subtitle1.copyWith(
                          color: Theme.of(context).textTheme.caption.color,
                        ),
                  ),
                  child: Icon(Icons.search),
                ),
                failure: BigTip(
                  title: Text(
                    context.translate(
                      'spacex.vehicle.title',
                    ),
                    style: Theme.of(context).textTheme.headline6.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  subtitle: Text(
                    context.translate(
                      'spacex.search.failure',
                    ),
                    style: Theme.of(context).textTheme.subtitle1.copyWith(
                          color: Theme.of(context).textTheme.caption.color,
                        ),
                  ),
                  child: Icon(Icons.sentiment_dissatisfied),
                ),
                filter: (top) => [
                  top.title,
                  top.startDate,
                  top.type,
                ],
                builder: (top) => AnimeCell(top),
              ),
            ),
            child: Icon(Icons.search),
          ),
        ));
  }
}

class AnimeGridView extends StatelessWidget {
  const AnimeGridView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RequestBuilder<UpcomingCubit, CategoryModel>(
      onLoading: (context, state, value) => LoadingSliverView(),
      onLoaded: (context, state, value) => SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, childAspectRatio: 0.7),
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return InkWell(
              onTap: () => null,
              child: new Container(
                margin: EdgeInsets.all(5),
                child: Column(
                  children: [
                    Expanded(
                      flex: 5,
                      child: Image.network(
                        value.top[index].imageUrl,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
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
