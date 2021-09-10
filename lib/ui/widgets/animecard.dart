import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myanime/cubits/details.dart';
import 'package:myanime/cubits/pictures.dart';
import 'package:myanime/ui/detailsscreen/details.dart';
import '../../ui/detailsscreen/details.dart';

class AnimeCard extends StatelessWidget {
  final String imageUrl;
  final int id;
  final String title;
  const AnimeCard(
      {@required this.imageUrl, @required this.id, @required this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        BlocProvider.of<DetailsCubit>(context).loadData(id: id);
        BlocProvider.of<PicturesCubit>(context).loadData(id: id);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsPage(
              title: title,
              id: id,
            ),
          ),
        );
      },
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
