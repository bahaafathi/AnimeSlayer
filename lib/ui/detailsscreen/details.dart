import 'package:cherry_components/cherry_components.dart';
import 'package:expand_widget/expand_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_request_bloc/widgets/request_builder.dart';
import 'package:myanime/cubits/details.dart';
import 'package:myanime/cubits/pictures.dart';
import 'package:myanime/models/details.dart';
import 'package:myanime/models/pictures.dart';
import 'package:myanime/ui/widgets/custom_page.dart';
import 'package:myanime/ui/widgets/header_swiper.dart';
import 'package:myanime/ui/widgets/loading_view.dart';
import 'package:myanime/utils/browser.dart';
import 'package:myanime/utils/menu.dart';
import 'package:row_collection/row_collection.dart';
import 'package:row_item/row_item.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';

/// This view all information about a Falcon rocket model. It displays RocketInfo's specs.
class DetailsPage extends StatelessWidget {
  final int id;
  final String title;
  DetailsPage({@required this.id, @required this.title});

  static const route = 'detailsPage';

  Widget build(BuildContext context) {
    return Scaffold(
      body: RequestSliverPage<PicturesCubit, AnimePictures>(
        popupMenu: Menu.home,
        title: title,
        headerBuilder: (context, state, value) {
          final photos = [for (final anime in value.pictures) anime.large];

          return SwiperHeader(list: photos);
        },
        childrenBuilder: (context, state, value) => [
          AnimeDetailsCard(),
        ],
      ),
    );
  }
}

class AnimeDetailsCard extends StatelessWidget {
  const AnimeDetailsCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RequestBuilder<DetailsCubit, Details>(
      onLoaded: (context, state, value) => SliverSafeArea(
        top: false,
        sliver: SliverToBoxAdapter(
          child: RowLayout.cards(children: <Widget>[
            rocketCard(value, context),
            videoCard(value, context),
            epCard(value, context),
          ]),
        ),
      ),
      onInit: (context, state) => SliverToBoxAdapter(child: Text('Iniiit')),
      onLoading: (context, state, value) => LoadingSliverView(),
      onError: (context, state, errorMessage) => LoadingSliverView(),
    );
  }

  Widget videoCard(Details details, BuildContext context) {
    //final RocketVehicle _rocket = context.watch<VehiclesCubit>().getVehicle(id);
    return CardCell(
      child: YoutubePlayer(
        controller: YoutubePlayerController(
          initialVideoId: YoutubePlayer.convertUrlToId(details.trailerUrl),
          flags: YoutubePlayerFlags(
            autoPlay: false,
            mute: false,
            hideControls: true,
          ),
        ),
        liveUIColor: Colors.amber,
        showVideoProgressIndicator: true,
        progressColors: ProgressBarColors(playedColor: Colors.red),
      ),
    );
  }

  Widget epCard(Details details, BuildContext context) {
    //final RocketVehicle _rocket = context.watch<VehiclesCubit>().getVehicle(id);
    return CardCell.body(
      context,
      title: 'Test',

      //title: details.titleEnglish,
      child: RowLayout(children: <Widget>[
        RowItem.text(
          'Source',
          details.source,
        ),
        RowItem.text(
          'Episodes',
          details.episodes != null ? details.episodes.toString() : 'N/A',
        ),
        RowItem.text(
          'Duration per ep',
          details.duration,
        ),
        RowItem.text(
          'String',
          details.aired.string,
        ),
        // RowItem.text(
        //   'From',
        //   details.aired.from,
        // ),
        RowItem.text(
          'To',
          details.aired.to ?? 'N/A',
        ),

        Separator.divider(),
        Container(
          height: 70,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => CardCell(
              padding: EdgeInsets.all(7),
              child: InkWell(
                onTap: () => context.openUrl(details.genres[index].url),
                child: Center(
                  child: Text(details.genres[index].name),
                ),
              ),
            ),
            itemCount: details.genres.length,
          ),
        ),
        //ExpandText(details.synopsis ?? 'Null From Api')
      ]),
    );
  }

  Widget rocketCard(Details details, BuildContext context) {
    //final RocketVehicle _rocket = context.watch<VehiclesCubit>().getVehicle(id);
    return CardCell.body(
      context,
      title: details.title,
      child: RowLayout(children: <Widget>[
        RowItem.text(
          'Type',
          details.type,
        ),
        RowItem.text(
          'Rank',
          details.rank.toString(),
        ),
        RowItem.text(
          'Score',
          details.score.toString(),
        ),
        RowItem.text(
          'Rating',
          details.rating,
        ),
        RowItem.boolean(
          'Airing',
          details.airing,
        ),
        Separator.divider(),
        ExpandText(details.synopsis ?? 'Null From Api')
      ]),
    );
  }
}
