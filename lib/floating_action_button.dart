import 'package:flutter/material.dart';

Widget myFloatingActionButton(BuildContext context) {
  return FloatingActionButton(
    onPressed: () {
      debugPrint("floating action button");
      Navigator.pushNamed(context, '/calculateGPA');
    },
    child: Icon(
      Icons.calculate_outlined,
      color: Colors.white,
    ),
    tooltip: "Yeni Ortalama Hesaplama",
    backgroundColor: Colors.teal,
  );
}
