//
// 들어있는 정보: <TheUser>, <UserExercise>, <UserRecord>, <UserRoutine>
//

// user의 신상 정보 및 랭크 관리
class TheUser {
  final String uid;
  List<dynamic> pickTime = [];
  List<dynamic> url = [];
  String pickedUrl;
  // level이랑 routine 부분 routine page고치고 바로 빼기

  final String level;
  final String routine;
  ///////////////////////
  String username;
  int weight;
  int workedDays;

  TheUser(
      {this.uid,
      this.level,
      this.routine,
      this.username,
      this.weight,
      this.url,
      this.pickedUrl,
      this.workedDays,
      this.pickTime});
}

// user의 각 운동의 기록
class UserExercise {
  final String name;
  final String part;
  final List<dynamic> weight;
  int sets;
  List<dynamic> reps;
  final int index;

  UserExercise(
      {this.name, this.part, this.weight, this.sets, this.reps, this.index});
}

// user의 각 부위 별 가해진 볼륨의 daily 기록
// 만약 list int가 firebase와 호환되지 않는다면 List<dynamic>으로 교체해줄 것 -> 수정완료
// 어차피 dynamic으로 해도 int 형태로 받아올 수 있다.
class UserRecord {
  final int level;
  final List<dynamic> shoulder;
  final List<dynamic> arm;
  final List<dynamic> chest;
  final List<dynamic> abs;
  final List<dynamic> back;
  final List<dynamic> leg;

  UserRecord(
      {this.level,
      this.shoulder,
      this.arm,
      this.chest,
      this.abs,
      this.back,
      this.leg});
}

//
class UserRoutine {
  final String routineName;
  final String level;
  final List<String> workoutList;

  UserRoutine({this.routineName, this.level, this.workoutList});
}
