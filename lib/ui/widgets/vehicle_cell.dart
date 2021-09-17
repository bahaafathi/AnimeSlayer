import 'package:cherry_components/cherry_components.dart';
import 'package:flutter/material.dart';
import 'package:myanime/models/search.dart';
import 'package:myanime/ui/detailsscreen/details.dart';
import 'package:myanime/ui/widgets/profile_image.dart';
import 'package:row_collection/row_collection.dart';

class AnimeCell extends StatelessWidget {
  final Results results;

  const AnimeCell(this.results, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      ListCell(
        leading: ClipRRect(
          // borderRadius: const BorderRadius.all(Radius.circular(0)),
          child: ProfileImage.big(results.imageUrl),
        ),
        title: results.title,
        subtitle: results.startDate,
        onTap: () {
          print(results.malId);
          print(results.title);
          Navigator.pushNamed(
            context,
            DetailsPage.route,
            arguments: {
              'id': results.malId,
              'title': results.title,
            },
          );
        },
      ),
      Separator.divider(indent: 72)
    ]);
  }
}
