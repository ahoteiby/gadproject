import 'package:flutter/material.dart';
import 'package:gadproject/screens/addpage.dart';
import 'package:gadproject/screens/sendmsg.dart';
import 'package:gadproject/screens/viewpage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedPage = 0;

  final _pageOptions = [
    ViewPage(),
    SendMsg(),
    SendMsg(),
    AddPage(),


  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: _pageOptions[selectedPage],

        // bottomNavigationBar: BottomNavigationBar(
        //   items: const [
        //     BottomNavigationBarItem(icon: Icon(Icons.home, size: 20), label: 'ccc'),
        //     BottomNavigationBarItem(icon: Icon(Icons.mail, size: 20), label: 'bbb'),
        //     BottomNavigationBarItem(icon: Icon(Icons.account_circle, size: 20), label: 'aaa'),
        //     BottomNavigationBarItem(icon: Icon(Icons.add_card, size: 20), label: 'الاصناف'),
        //   ],
        //   selectedItemColor: Colors.green,
        //   elevation: 5.0,
        //   unselectedItemColor: Colors.green[900],
        //   currentIndex: selectedPage,
        //   backgroundColor: Colors.white,
        //   onTap: (index){
        //     setState(() {
        //       selectedPage = index;
        //     });
        //   },
        // )

        // ---------------------------------------------------------
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            selectedPage = index;
          });
        },
        indicatorColor: Colors.lightBlue,
        selectedIndex: selectedPage,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home, color: Colors.white),
            icon: Icon(Icons.home),
            label: 'عرض الاصناف',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.mail, color: Colors.white),
            icon: Icon(Icons.mail),
            label: 'ارسال رسائل',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.messenger_sharp),
            label: 'تعديل',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.add_card,  color: Colors.white),
            icon: Icon(Icons.add_card),
            label: 'اضافه',
          ),

        ],
      ));

  }
}