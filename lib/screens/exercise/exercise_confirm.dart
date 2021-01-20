import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weighit/models/user_info.dart';
import 'package:weighit/screens/exercise/exercise_ing.dart';
import 'package:weighit/screens/exercise/exercise_list.dart';
import 'package:weighit/services/Exercise_database.dart';

class ExerciseConfirm extends StatelessWidget {
  final String routineName;
  ExerciseConfirm({Key key, this.routineName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<TheUser>(context);
    final size = MediaQuery.of(context).size;

    return StreamProvider<List<UserExercise>>(
      create: (_) =>
          ExerciseDB(uid: user.uid, routineName: routineName).userExercise,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: size.height * 0.1,
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            routineName,
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Color(0xffF8F6F6),
          actions: [
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                ExerciseDB(uid: user.uid, routineName: routineName)
                    .deleteUserRoutineData();
                Navigator.pop(context);
              },
            ),
          ],
        ),
        body: ExerciseList(
          routineName: routineName,
        ),
        // Column(
        //   children: [
        //     Expanded(
        //       child: ExerciseList(
        //         routineName: routineName,
        //       ),
        //     ),
        //     SizedBox(
        //       width: double.infinity,
        //       height: size.height * 0.1,
        //       child: FlatButton(
        //         color: Theme.of(context).primaryColor,
        //         child: Text(
        //           '운동 시작하기',
        //           style: Theme.of(context).textTheme.headline3,
        //         ),
        //         onPressed: () {
        //           Navigator.push(
        //             context,
        //             MaterialPageRoute(
        //               builder: (context) => ExercisingScreen(
        //                 routineName: routineName,
        //               ),
        //             ),
        //           );
        //         },
        //       ),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
