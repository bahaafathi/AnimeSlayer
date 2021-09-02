import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:myanime/ui/detailsscreen/details.dart';
import '../../ui/detailsscreen/details.dart';

class AnimeCard extends StatelessWidget {
  final String imageUrl;
  final int id;
  const AnimeCard({@required this.imageUrl, @required this.id});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          Navigator.pushNamed(context, DetailsPage.route, arguments: id),
      child: new Container(
        margin: EdgeInsets.all(5),
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: Image.network(
                imageUrl,
                fit: BoxFit.fill,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
