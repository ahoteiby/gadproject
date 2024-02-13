import 'package:flutter/material.dart';
import 'package:gadproject/screens/addpage.dart';
import 'package:gadproject/screens/sendmsg.dart';
import 'package:gadproject/screens/viewpage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedPage = 1;

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
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home, size: 30), label: 'الاصناف'),
            BottomNavigationBarItem(icon: Icon(Icons.mail, size: 30), label: 'الاصناف'),
            BottomNavigationBarItem(icon: Icon(Icons.account_circle, size: 30), label: 'الاصناف'),
            BottomNavigationBarItem(icon: Icon(Icons.add_card, size: 30), label: 'الاصناف'),
          ],
          selectedItemColor: Colors.green,
          elevation: 5.0,
          unselectedItemColor: Colors.green[900],
          currentIndex: selectedPage,
          backgroundColor: Colors.white,
          onTap: (index){
            setState(() {
              selectedPage = index;
            });
          },
        )
    );
  }
}