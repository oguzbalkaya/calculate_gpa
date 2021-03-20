import 'lesson.dart';
class GPA{
  int _type;
  int _system;
  List <Lesson> _lessonList;
  double _gpa;
  double _term;
  double _currentCredit;
  double _currentGPA;

  GPA(int type,int system,List<Lesson> lessonList,double currentCredit,double currentGPA){
    this._type=type;
    this._system=system;
    this._lessonList=lessonList;
    this._currentCredit=currentCredit;
    this._currentGPA=currentGPA;
    this._gpa=CalculateGpa()[1];
    this._term=CalculateGpa()[0];
  }

  double get currentGPA => _currentGPA;

  set currentGPA(double value) {
    _currentGPA = value;
  }

  int get type => _type;

  double get term => _term;

  set term(double value) {
    _term = value;
  }

  set type(int value) {
    _type = value;
  }

  int get system => _system;

  set system(int value) {
    _system = value;
  }

  List<Lesson> get lessonList => _lessonList;

  set lessonList(List<Lesson> value) {
    _lessonList = value;
  }

  double get gpa => _gpa;

   CalculateGpa(){
      double totalCredit=0,totalGrade=0;
      double current;

      for(int i=0;i<this._lessonList.length;i++){
        totalCredit+=this._lessonList[i].credit;
        totalGrade+=this._lessonList[i].credit*this._lessonList[i].grade;
        }

        if(_type==0){
          return [totalGrade/totalCredit,1]; // [0] -> term ,[1] -> general
        }else{
          current = this._currentGPA*this._currentCredit;
          return [totalGrade/totalCredit,(current+totalGrade)/(_currentCredit+totalCredit)];
        }

       

  }


}
