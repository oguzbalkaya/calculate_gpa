import 'package:flutter/material.dart';

class MyBottomNavigationBar extends StatefulWidget {
  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int currentItem = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        unselectedItemColor: Colors.teal,
        selectedItemColor: Colors.teal,
        showUnselectedLabels: true,
        elevation: 20,
        backgroundColor: Colors.white,
        unselectedFontSize: 12,
        selectedFontSize: 15,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        currentIndex: currentItem,
        onTap: (i) {
          setState(() {
            currentItem = i;
          });
        },
        items: [

          BottomNavigationBarItem(
            tooltip: "Daha önce hesaplanan ortalamalar",
            icon: Icon(
              Icons.history,
              color: Colors.teal,
            ),
            label: "Geçmiş",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.info,
              color: Colors.teal,
            ),
            label: "Bilgilendirme",
          ),
        ]);
  }
}
