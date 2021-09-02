import 'package:cherry_components/cherry_components.dart';
import 'package:expand_widget/expand_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_request_bloc/widgets/request_builder.dart';
import 'package:myanime/cubits/details.dart';
import 'package:myanime/models/details.dart';
import 'package:myanime/ui/widgets/header_swiper.dart';
import 'package:myanime/ui/widgets/loading_view.dart';
import 'package:myanime/ui/widgets/sliver_bar.dart';
import 'package:myanime/utils/menu.dart';
import 'package:myanime/utils/photos.dart';
import 'package:row_collection/row_collection.dart';
import 'package:row_item/row_item.dart';
import 'package:share_plus/share_plus.dart';
import '../../utils/translate.dart';

/// This view all information about a Falcon rocket model. It displays RocketInfo's specs.
class DetailsPage extends StatefulWidget {
  int id;
  DetailsPage({@required this.id});

  static const route = 'detailsPage';

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  void initState() {
    context.read<DetailsCubit>().loadData(id: widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverBar(
            title: 'Test Tilte',
            header: SwiperHeader(
              list: SpaceXPhotos.company,
              builder: (_, index) => CacheImage(SpaceXPhotos.company[index]),
            ),
            actions: <Widget>[
              IconButton(
                icon: IconShadow(Icons.adaptive.share),
                onPressed: () => Share.share(
                  context.translate(
                    'spacex.other.share.rocket',
                    parameters: {
                      // 'name': _rocket.name,
                      // 'height': _rocket.getHeight,
                      // 'engines': _rocket.firstStage.engines.toString(),
                      // 'type': _rocket.engine.getName,
                      // 'thrust': _rocket.firstStage.getThrust,
                      // 'payload': _rocket.payloadWeights[0].getMass,
                      // 'orbit': _rocket.payloadWeights[0].name,
                      // 'details': Url.shareDetails
                    },
                  ),
                ),
                tooltip: context.translate('spacex.other.menu.share'),
              ),
            ],
            menuItemBuilder: (context) => [
              for (final item in Menu.wikipedia)
                PopupMenuItem(
                  value: item,
                  child: Text(context.translate(item)),
                )
            ],
            //onMenuItemSelected: (text) => context.openUrl(_rocket.url),
          ),
          RequestBuilder<DetailsCubit, Details>(
            onLoaded: (context, state, value) => SliverSafeArea(
              top: false,
              sliver: SliverToBoxAdapter(
                child: RowLayout.cards(children: <Widget>[
                  _rocketCard(value, context),
                  // _specsCard(context),
                  // _payloadsCard(context),
                  // _stages(context),
                  // _enginesCard(context),
                ]),
              ),
            ),
            onInit: (context, state) =>
                SliverToBoxAdapter(child: Text('Iniiit')),
            onLoading: (context, state, value) => LoadingSliverView(),
            onError: (context, state, errorMessage) => SliverToBoxAdapter(
              child: ErrorWidget(
                errorMessage,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _rocketCard(Details details, BuildContext context) {
    //final RocketVehicle _rocket = context.watch<VehiclesCubit>().getVehicle(id);
    return CardCell.body(
      context,
      title: context.translate('spacex.vehicle.rocket.description.title'),
      child: RowLayout(children: <Widget>[
        RowItem.text(
          context.translate('spacex.vehicle.rocket.description.launch_maiden'),
          details.title,
        ),
        RowItem.text(
          context.translate('spacex.vehicle.rocket.description.launch_cost'),
          details.title,
        ),
        RowItem.text(
          context.translate('spacex.vehicle.rocket.description.success_rate'),
          details.title,
        ),
        RowItem.boolean(
          context.translate('spacex.vehicle.rocket.description.active'),
          details.airing,
        ),
        Separator.divider(),
        ExpandText(details.background ?? 'Null From Api')
      ]),
    );
  }
}
