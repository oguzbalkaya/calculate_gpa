import 'package:flutter/material.dart';

Widget myAppBar(String title, BuildContext context) {
  return AppBar(
    title: Text(title),
    actions: [
      Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
        child: InkWell(
          onTap: () {
            showDialog(
              context: context,
              barrierDismissible: true,
              builder: (context) {
                return AlertDialog(
                  title: Text("Hesaplama Nasıl Yapılıyor?"),
                  content: Text(
                      "Girilen not sistemindeki harf notu karşılıkları kredi"
                      " ile çarpılıp elde edilen sonuçlar toplanır."
                      "Toplanarak elde edilen sonuç toplam alınan krediye"
                      " bölünür.\n\n"
                      "AA : 4.0, BA : 3.5, BB : 3.0, CB : 2.5, CC : 2.0"
                      "DC : 1.5, DD : 1.0, FD : 0.5, FF : 0.0\n\n"
                      "A : 4.0, A- : 3.7, B+ : 3.3, B : 3.0, B- : 2.7,"
                      "C+ : 2.3, C : 2.0, C- : 1.7, D+ : 1.3, D : 1.0,"
                      "F : 0.0"),
                  actions: [
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(Icons.close),
                      label: Text("Kapat"),
                    ),
                  ],
                );
              },
            );
          },
          child: Icon(
            Icons.info,
            size: 30,
            color: Colors.white,
          ),
        ),
      )
    ],
  );
}
