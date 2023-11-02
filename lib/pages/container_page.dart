import 'package:flutter/material.dart';
import 'package:nomnoman/pages/home_page.dart';
import 'package:nomnoman/pages/profile_page.dart';
import 'package:nomnoman/pages/search_page.dart';

class ContainerPage extends StatefulWidget {
  static const routeName = '/container';
  const ContainerPage({super.key});

  @override
  State<ContainerPage> createState() => _ContainerPageState();
}

class _ContainerPageState extends State<ContainerPage> {
  var _selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    SearchPage(),
    Container(),
    Container(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: '',
              activeIcon: Icon(Icons.home_outlined)),
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: '',
              activeIcon: Icon(Icons.search)),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_box_outlined),
              label: '',
              activeIcon: Icon(Icons.add_box_outlined)),
          BottomNavigationBarItem(
              icon: Icon(Icons.play_arrow),
              label: '',
              activeIcon: Icon(Icons.play_arrow)),
          BottomNavigationBarItem(
              icon: CircleAvatar(child: Placeholder()),
              label: '',
              activeIcon: CircleAvatar(child: Placeholder())),
        ],
        currentIndex: _selectedIndex,
        iconSize: 30,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
