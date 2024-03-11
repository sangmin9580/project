import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainNavigationScreen extends ConsumerStatefulWidget {
  const MainNavigationScreen({super.key});

  static const routeURL = "/main";
  static const routeName = "mainNavigation";

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MainNavigationScreenState();
}

class _MainNavigationScreenState extends ConsumerState<MainNavigationScreen> {
  int _index = 0;

  void _onTapItem(int value) {
    _index = value;
    setState(() {});
  }

  final List<Map<String, dynamic>> _bottomNavigationItems = [
    {
      "icons": FontAwesomeIcons.house,
      "label": "Home",
    },
    {
      "icons": FontAwesomeIcons.magnifyingGlass,
      "label": "Discover",
    },
    {
      "icons": FontAwesomeIcons.camera,
      "label": "Camera",
    },
    {
      "icons": FontAwesomeIcons.inbox,
      "label": "Inbox",
    },
    {
      "icons": FontAwesomeIcons.user,
      "label": "Profile",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: _index,
      length: 5,
      child: Scaffold(
        body: Stack(children: [
          Offstage(
            offstage: _index != 0,
            child: const Center(
              child: Text("1"),
            ),
          ),
          Offstage(
            offstage: _index != 1,
            child: const Center(
              child: Text("2"),
            ),
          ),
          Offstage(
            offstage: _index != 2,
            child: const Center(
              child: Text("3"),
            ),
          ),
          Offstage(
            offstage: _index != 3,
            child: const Center(
              child: Text("4"),
            ),
          ),
          Offstage(
            offstage: _index != 4,
            child: const Center(
              child: Text("5"),
            ),
          ),
        ]),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
          onTap: (value) => _onTapItem(value),
          currentIndex: _index,
          items: [
            for (var items in _bottomNavigationItems)
              BottomNavigationBarItem(
                icon: FaIcon(items["icons"]),
                label: items['label'],
              ),
          ],
        ),
      ),
    );
  }
}


/**
 * 
 * icon을 누르면 해당 index를 불러오기 
 * tap -> _index -> 
 */