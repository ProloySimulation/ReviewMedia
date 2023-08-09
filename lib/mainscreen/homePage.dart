import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:review/mainscreen/categories.dart';
import 'package:review/mainscreen/feed.dart';
import 'package:review/mainscreen/post.dart';
import 'package:review/mainscreen/profile/profile.dart';
import 'package:review/mainscreen/setting.dart';
import 'package:review/style/home_appbar.dart';
import 'package:review/util/Colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _currentIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    Feed(),
    Categories(),
    Post(),
    Profile(),
    Setting(),
  ];

  void _onItemTapped(int index)
  {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppbar(),
      body: Center(
        child: _widgetOptions.elementAt(_currentIndex),
      ),
      bottomNavigationBar: Material(
        color: backgroundColor,
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40)
          ),
          child: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Colors.white,
            ),
            child: BottomNavigationBar(
              items: [
                BottomNavigationBarItem(
                  icon: SvgPicture.asset('assets/images/ic_feed.svg'),
                  label: 'Feed',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset('assets/images/ic_category.svg'),
                  label: 'Categories',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset('assets/images/ic_post.svg'),
                  label: 'Post',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset('assets/images/ic_profile.svg'),
                  label: 'Profile',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset('assets/images/ic_setting.svg'),
                  label: 'Settings',
                ),
              ],
              currentIndex: _currentIndex,
              selectedItemColor: themeColor,
              showUnselectedLabels: true,
              onTap: _onItemTapped,
            ),
          ),
        ),
      ),
    );
  }
}
