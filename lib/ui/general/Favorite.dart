import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:myanime/models/favorite.dart';
import 'package:myanime/models/notes.dart';
import 'package:myanime/ui/widgets/animecard.dart';
import 'package:myanime/utils/dataBase/database.dart';
import 'package:sqflite/sqflite.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key key}) : super(key: key);

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  DataBasefavorite databaseHelper = DataBasefavorite();
  // List<FavoriteModel> noteList;
  FavoriteModel noteList;
  int count = 0;
  int axisCount = 2;
  List ppp = [];
  @override
  void initState() {
    // TODO: implement initState
    print("insss");
    insss();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (ppp == null) {
      // noteList = [];
      // updateListView();
      return Container(
        color: Colors.blueAccent,
      );
    } else {
      return Container(
          child: CachedNetworkImage(
        imageUrl: noteList.imageUrl,
        fit: BoxFit.fill,
      ));
      // SliverGrid(
      //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //       crossAxisCount: 3, childAspectRatio: 0.7),
      //   delegate: SliverChildBuilderDelegate(
      //     (BuildContext context, int index) {
      //       return CachedNetworkImage(
      //         imageUrl: noteList.imageUrl,
      //         fit: BoxFit.fill,
      //       );

      //       // AnimeCard(
      //       //   cliced: true,
      //       //   id: noteList.id,
      //       //   imageUrl: noteList.imageUrl,
      //       //   title: noteList.name,
      //       // );
      //     },
      //     childCount: 1,
      //   ),
      // );
    }
  }

  void insss() async {
    Map<String, dynamic> map = {
      "id": 1706,
      "name": "narto",
      "imageUrl":
          "https://cdn.myanimelist.net/images/manga/3/179882.jpg?s=dac8109140406ca296cf4946296b5037"
    };

    FavoriteModel nddd = FavoriteModel.fromJson(map);

    await databaseHelper.savefavorite(nddd);
    updateListView();
  }

  void updateListView() async {
    // print("sssssssss");
    // var mm = await databaseHelper.getAllUsers();
    // print(mm);
    var mm = await databaseHelper.getAllUsers();
    var ll = mm[0];
    this.noteList = mm[0];
    print(ll.id);
    print("done");
    print(ll.imageUrl);

    // var noteListFuture = await databaseHelper.getAllUsers().then((value) {
    //   var ll = value[0];

    //   print("finaaaaalllllllllll");
    //   print(ll);
    //   // this.noteList = ll;
    //   // this.count = ll.length;
    // });

    // setState(() {
    // print("finaaaaalllllllllll");
    // print(ll);
    //   // this.noteList = ll;
    //   // this.count = ll.length;
    // });

    // noteListFuture.then((noteList) {
    //   setState(() {
    //     this.noteList = noteList;
    //     this.count = noteList.length;
    //   });
    // });

    // final dbFuture = databaseHelper.initDb();
    // dbFuture.then((database) {
    //   Future<List<FavoriteModel>> noteListFuture = databaseHelper.getAllUsers();
    //   noteListFuture.then((noteList) {
    //     this.noteList = noteList[0];
    //     print("finaaaaalllllllllll");
    //     print(noteList);
    // setState(() {
    //   this.noteList = noteList[0];
    //   this.count = noteList.length;
    // });
    //   });
    // });
  }
}
// // // import 'package:big_tip/big_tip.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_request_bloc/widgets/request_builder.dart';
// import 'package:myanime/cubits/ova.dart';
// import 'package:myanime/models/category.dart';
// import 'package:myanime/models/favorite.dart';
// import 'package:myanime/ui/widgets/animecard.dart';
// import 'package:myanime/ui/widgets/custom_page.dart';
// import 'package:myanime/ui/widgets/header_swiper.dart';
// import 'package:myanime/ui/widgets/vehicle_cell.dart';
// import 'package:myanime/utils/dataBase/database.dart';
// import 'package:myanime/utils/menu.dart';
// import 'package:myanime/utils/photos.dart';
// import 'package:search_page/search_page.dart';
// import '../../utils/translate.dart';
// import '../widgets/loading_view.dart';

// class OvaTaxxxp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: RequestSliverPage<OvaCubit, CategoryModel>(
//         isTaped: false,
//         popupMenu: Menu.home,
//         title: 'Ova',
//         headerBuilder: (context, state, value) =>
//             SwiperHeader(list: List.from(SpaceXPhotos.company)..shuffle()),
//         childrenBuilder: (context, state, value) => [AnimeGridView()],
//       ),
//     );
//   }
// }

// class AnimeGridView extends StatefulWidget {
//   const AnimeGridView({
//     Key key,
//   }) : super(key: key);

//   @override
//   _AnimeGridViewState createState() => _AnimeGridViewState();
// }

// class _AnimeGridViewState extends State<AnimeGridView> {
//    DataBasefavorite databaseHelper = DataBasefavorite();
//      FavoriteModel noteList;
//   @override
//   void initState() async{

// var mm = await databaseHelper.getAllUsers();
//     var ll = mm[0];
//     this.noteList = mm[0];
//     print(ll.id);
//     print("done");
//     print(ll.imageUrl);
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return RequestBuilder<OvaCubit, CategoryModel>(
//       onLoading: (context, state, value) => LoadingSliverView(),
//       onLoaded: (context, state, value) => SliverGrid(
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 3, childAspectRatio: 0.7),
//         delegate: SliverChildBuilderDelegate(
//           (BuildContext context, int index) {
//             return new AnimeCard(
//               cliced: true,
//               title: value.top[index].title,
//               id: value.top[index].malId,
//               imageUrl: value.top[index].imageUrl,
//             );
//           },
//           childCount: value.top.length,
//         ),
//       ),
//     );
//   }
// }

// import 'package:big_tip/big_tip.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_request_bloc/widgets/request_builder.dart';
// import 'package:myanime/cubits/ova.dart';
// import 'package:myanime/models/category.dart';
// import 'package:myanime/ui/widgets/animecard.dart';
// import 'package:myanime/ui/widgets/custom_page.dart';
// import 'package:myanime/ui/widgets/header_swiper.dart';
// import 'package:myanime/ui/widgets/vehicle_cell.dart';
// import 'package:myanime/utils/menu.dart';
// import 'package:myanime/utils/photos.dart';
// import 'package:search_page/search_page.dart';
// import '../../utils/translate.dart';
// import '../widgets/loading_view.dart';

// class OvaTap extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: RequestSliverPage<OvaCubit, CategoryModel>(
//         isTaped: false,
//         popupMenu: Menu.home,
//         title: 'Ova',
//         headerBuilder: (context, state, value) =>
//             SwiperHeader(list: List.from(SpaceXPhotos.company)..shuffle()),
//         childrenBuilder: (context, state, value) => [AnimeGridView()],
//       ),
//     );
//   }
// }

// class AnimeGridView extends StatelessWidget {
//   const AnimeGridView({
//     Key key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return RequestBuilder<OvaCubit, CategoryModel>(
//       onLoading: (context, state, value) => LoadingSliverView(),
//       onLoaded: (context, state, value) => SliverGrid(
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 3, childAspectRatio: 0.7),
//         delegate: SliverChildBuilderDelegate(
//           (BuildContext context, int index) {
//             return new AnimeCard(
//               cliced: true,
//               title: value.top[index].title,
//               id: value.top[index].malId,
//               imageUrl: value.top[index].imageUrl,
//             );
//           },
//           childCount: value.top.length,
//         ),
//       ),
//     );
//   }
// }
