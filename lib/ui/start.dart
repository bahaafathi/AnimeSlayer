import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:myanime/ui/searchscrren.dart';

import 'package:myanime/ui/taps/movies.dart';
import 'package:myanime/ui/taps/ova.dart';
import 'package:myanime/ui/taps/special.dart';
import 'package:myanime/ui/taps/top.dart';
import 'package:myanime/ui/taps/upcoming.dart';

class StartScreen extends StatefulWidget {
  static const route = '/';
  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [
          TopTap(),
          MangaTap(),
          UpcomingTap(),
          SearchScreen(),
          OvaTap(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).brightness == Brightness.light
            ? Theme.of(context).primaryColor
            : Theme.of(context).accentColor,
        type: BottomNavigationBarType.fixed,
        onTap: (index) => _currentIndex != index
            ? setState(() => _currentIndex = index)
            : null,
        currentIndex: _currentIndex,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: 'Anime',
            icon: Icon(Ionicons.play_outline),
          ),
          BottomNavigationBarItem(
            label: 'Manga',
            icon: Icon(Ionicons.book_outline),
          ),
          BottomNavigationBarItem(
            label: 'Upcoming',
            icon: Icon(Icons.access_time),
          ),
          BottomNavigationBarItem(
            label: 'Search',
            icon: Icon(Ionicons.search_outline),
          ),
          BottomNavigationBarItem(
            label: 'My List',
            icon: Icon(Ionicons.bookmark_outline),
          ),
        ],
      ),
    );
  }
}
