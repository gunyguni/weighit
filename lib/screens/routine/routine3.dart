import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:weighit/models/exercise_type.dart';
import 'package:weighit/models/user_info.dart';
import 'package:weighit/screens/exercise/exercise_confirm.dart';
import 'package:weighit/screens/routine/make_routine.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:weighit/services/Exercise_database.dart';

class Routine3 extends StatefulWidget {
  @override
  _Routine3State createState() => _Routine3State();
}

class _Routine3State extends State<Routine3>
    with AutomaticKeepAliveClientMixin<Routine3> {
  @override
  bool get wantKeepAlive => true;
  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    final exerciseList = Provider.of<List<Exercise>>(context)
            .where((element) => element.part == '팔')
            .toList() ??
        [];
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.39,
      child: ListView(
        shrinkWrap: true,
        children:
            exerciseList.map((val) => _exerciseTile(context, val)).toList(),
      ),
    );
  }

  Widget _exerciseTile(BuildContext context, Exercise exercise) {
    return Padding(
        padding: const EdgeInsets.only(top: 2),
        child: Card(
          color: Theme.of(context).primaryColor,
          child: ListTile(
            onTap: () async {
              await ExerciseDB(part: '팔').updateNewExerciseData(exercise.name);
            },
            title: Text(
              exercise.name,
              style: Theme.of(context).textTheme.subtitle2,
            ),
          ),
        ));
  }
}
