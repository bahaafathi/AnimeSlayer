import 'package:cherry_components/cherry_components.dart';
import 'package:flutter/material.dart';
import 'package:myanime/models/category.dart';
import 'package:myanime/ui/widgets/profile_image.dart';
import 'package:row_collection/row_collection.dart';

class AnimeCell extends StatelessWidget {
  final Top top;

  const AnimeCell(this.top, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      ListCell(
        leading: ClipRRect(
          // borderRadius: const BorderRadius.all(Radius.circular(0)),
          child: ProfileImage.big(top.imageUrl),
        ),
        title: top.title,
        subtitle: top.startDate,
        onTap: () => null,
      ),
      Separator.divider(indent: 72)
    ]);
  }
}
