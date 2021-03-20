class Lesson{
  String _name;
  double _credit;
  double _grade;
  String _letterGrade;

  Lesson(this._name, this._credit, this._grade, this._letterGrade);

  String get letterGrade => _letterGrade;

  set letterGrade(String value) {
    _letterGrade = value;
  }

  double get grade => _grade;

  set grade(double value) {
    _grade = value;
  }

  double get credit => _credit;

  set credit(double value) {
    _credit = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }
}