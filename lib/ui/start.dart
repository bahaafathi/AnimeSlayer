import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      body: IndexedStack(index: _currentIndex, children: [
        TopTap(),
        MoviesTap(),
        UpcomingTap(),
        SpecialTap(),
        OvaTap(),
      ]),
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
            label: 'Top',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Movies',
            icon: Icon(Icons.movie),
          ),
          BottomNavigationBarItem(
            label: 'Upcoming',
            icon: Icon(Icons.access_time),
          ),
          BottomNavigationBarItem(
            label: 'Special',
            icon: Icon(Icons.library_books),
          ),
          BottomNavigationBarItem(
            label: 'Ova',
            icon: Icon(Icons.location_city),
          ),
        ],
      ),
    );
  }
}
