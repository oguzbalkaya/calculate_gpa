import 'package:calculate_gpa/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'bottom_navigation_bar.dart';
import 'floating_action_button.dart';
import 'Modals/lesson.dart';
import 'Modals/gpa.dart';

class CalculateGPA extends StatefulWidget {
  @override
  _CalculateGPAState createState() => _CalculateGPAState();
}

class _CalculateGPAState extends State<CalculateGPA> {
  int currentType = 0;
  int currentSystem = 0;
  int lessonCount = 1;
  double currentCredit = 0;
  double currentGPA = 0;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //bottomNavigationBar: MyBottomNavigationBar(),
      appBar: myAppBar("Hesaplama Yap",context),
      body: ListView(
        padding: EdgeInsets.all(8.0),
        children: [
          Text(
            "İşlem seçin : ",
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          RadioListTile(
            value: 0,
            groupValue: currentType,
            onChanged: (selected) {
              setState(() {
                currentType = selected;
              });
            },
            title: Text("Sadece dönem not ortalamasını hesaplamak istiyorum."),
          ),
          RadioListTile(
            value: 1,
            groupValue: currentType,
            onChanged: (selected) {
              setState(() {
                currentType = selected;
              });
            },
            title: Text(
                "Hem dönem hemde genel not ortalamasını öğrenmek istiyorum."),
          ),
          Divider(),
          Text(
            "Not sistemini seçin : ",
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          RadioListTile(
            value: 0,
            groupValue: currentSystem,
            onChanged: (selected) {
              setState(() {
                currentSystem = selected;
              });
            },
            title: Text("AA, BA, BB, CB, CC, DC, DD, FD, FF"),
          ),
          RadioListTile(
            value: 1,
            groupValue: currentSystem,
            onChanged: (selected) {
              setState(() {
                currentSystem = selected;
              });
            },
            title: Text("A, A-, B+, B, B-, C+, C, C-, D+, D, F"),
          ),
          Divider(),
          lessonCreditInfos(),
        ],
      ),
    );
  }

  lessonCreditInfos() {
    if (currentType == 0) {
      return Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Ders sayısını seçin : ",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                DropdownButton(
                  value: lessonCount,
                  onChanged: (selected) {
                    setState(() {
                      lessonCount = selected;
                    });
                  },
                  items: List.generate(
                      15,
                      (index) => DropdownMenuItem(
                            child: Text("${index + 1} ders"),
                            value: index + 1,
                          )),
                )
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  ButtonFunc();
                },
                child: Text("Ders seçimine git")),
          ],
        ),
      );
    } else {
      return Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Ders sayısını seçin : ",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                DropdownButton(
                  value: lessonCount,
                  onChanged: (selected) {
                    setState(() {
                      lessonCount = selected;
                    });
                  },
                  items: List.generate(
                      15,
                      (index) => DropdownMenuItem(
                            child: Text("${index + 1} ders"),
                            value: index + 1,
                          )),
                )
              ],
            ),
            Form(
              autovalidateMode: AutovalidateMode.always,
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Column(
                  children: [
                    TextFormField(
                      initialValue: "0",
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "Mevcut toplam kredi",
                        labelText: "Mevcut toplam kredi",
                      ),
                      validator: (String i) {
                        if (i.length > 5) {
                          return "Geçerli bir kredi değeri girin.";
                        } else {
                          return null;
                        }
                      },
                      onSaved: (i) => currentCredit = double.parse(i),
                    ),
                    TextFormField(
                      initialValue: "0",
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "Mevcut ortalama",
                        labelText: "Mevcut ortalama",
                      ),
                      validator: (String i) {
                        if (i.length > 5) {
                          return "Geçerli bir ortalama girin.Ortalama değeri 0-4 arasında olabilir.";
                        } else {
                          return null;
                        }
                      },
                      onSaved: (i) => currentGPA = double.parse(i),
                    ),
                  ],
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  ButtonFunc();
                },
                child: Text("Ders seçimine git")),
          ],
        ),
      );
    }
  }

  ButtonFunc() {
    if(currentType==0){
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CalculateGPALessonInfo(
              lessonCount: lessonCount,
              gradeSystem: currentSystem,
              type: currentType,
              currentGpa: currentGPA,
              currentCredit: currentCredit,
            ),
          ));
    }else{
      if (formKey.currentState.validate()) {
        formKey.currentState.save();
        debugPrint("ders seçimine git.");

        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CalculateGPALessonInfo(
                lessonCount: lessonCount,
                gradeSystem: currentSystem,
                type: currentType,
                currentGpa: currentGPA,
                currentCredit: currentCredit,
              ),
            ));
      }
    }

  }
}

class CalculateGPALessonInfo extends StatefulWidget {
  int lessonCount = 0;
  int gradeSystem;
  int type;
  double currentGpa;
  double currentCredit;

  var letterList = [
    [
      ["AA", 4.0],
      ["BA", 3.5],
      ["BB", 3.0],
      ["CB", 2.5],
      ["CC", 2.0],
      ["DC", 1.5],
      ["DD", 1.0],
      ["FD", 0.5],
      ["FF", 0.0]
    ],
    [
      ["A", 4.0],
      ["A-", 3.7],
      ["B+", 3.3],
      ["B", 3.0],
      ["B-", 2.7],
      ["C+", 2.3],
      ["C", 2.0],
      ["C-", 1.7],
      ["D+", 1.3],
      ["D", 1.0],
      ["F", 0.0]
    ],
  ];

  CalculateGPALessonInfo(
      {this.lessonCount,
      this.gradeSystem,
      this.type,
      this.currentCredit,
      this.currentGpa});

  @override
  _CalculateGPALessonInfoState createState() => _CalculateGPALessonInfoState();
}

class _CalculateGPALessonInfoState extends State<CalculateGPALessonInfo> {
  List<Lesson> lessons;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    lessons = List.generate(widget.lessonCount,
        (index) => Lesson("Ders ${index + 1}", 0.5, 4, "AA"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar("Ders bilgilerini girin",context),
      //bottomNavigationBar: MyBottomNavigationBar(),
      body: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.always,
        child: ListView.builder(
          itemBuilder: (context, index) {
            if (index != widget.lessonCount - 1) {
              return createLessonList(index);
            }

            return Column(
              children: [
                createLessonList(index),
                ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.teal,
                    ),
                    onPressed: () {
                      calculateGPA();
                    },
                    icon: Icon(Icons.calculate_outlined),
                    label: Text(
                      "HESAPLA",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    )),
              ],
            );
          },
          itemCount: widget.lessonCount,
        ),
      ),
    );
  }

  Widget createLessonList(int index) {
    return Card(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(8, 3, 8, 3),
            child: TextFormField(
              validator: (i) {
                if (i.length < 3 || i.length > 30) {
                  return "Ders adı 3-30 karakter arası olabilir";
                } else {
                  return null;
                }
              },
              decoration: InputDecoration(
                hintText: "Ders adı",
                labelText: "Ders adı",
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              DropdownButton(
                  onChanged: (selected) {
                    setState(() {
                      lessons[index].credit = selected;
                    });
                  },
                  value: lessons[index].credit,
                  items: List.generate(
                      60,
                      (index) => DropdownMenuItem(
                            value: (index + 1) / 2,
                            child: Text("${(index + 1) / 2} kredi"),
                          ))),
              DropdownButton(
                  onChanged: (selected) {
                    setState(() {
                      lessons[index].grade = selected;
                    });
                  },
                  value: lessons[index].grade,
                  items: List.generate(
                      widget.letterList[widget.gradeSystem].length,
                      (index) => DropdownMenuItem(
                            value: widget.letterList[widget.gradeSystem][index]
                                [1],
                            child: Text(
                                "${widget.letterList[widget.gradeSystem][index][0]}"),
                          ))),
            ],
          ),
        ],
      ),
    );
  }

  calculateGPA() {
    if (formKey.currentState.validate()) {
      GPA calculatedGpa = GPA(widget.type, widget.gradeSystem, lessons,
          widget.currentCredit, widget.currentGpa);
      showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            title: Text("Hesaplama Sonucu"),
            content: widget.type == 0
                ? Text("Dönem Not Ortalaması : ${calculatedGpa.gpa.toStringAsFixed(3)}\n\n")
                : Text("Mevcut Genel Ortalama : ${calculatedGpa.currentGPA.toStringAsFixed(3)}\n\n"
                "Dönem Not Ortalaması : ${calculatedGpa.term.toStringAsFixed(2)}\n\n"
                    "Yeni Genel Not Ortalaması : ${calculatedGpa.gpa.toStringAsFixed(2)}"),
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
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: Colors.teal,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, "/");
                },
                icon: Icon(Icons.calculate),
                label: Text("Yeni Hesaplama"),
              )
            ],
          );
        },
      );
    }
  }
}
