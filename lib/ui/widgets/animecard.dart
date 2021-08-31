import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:myanime/ui/detailsscreen/details.dart';

class AnimeCard extends StatelessWidget {
  final String imageUrl;
  const AnimeCard({@required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => null,
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
