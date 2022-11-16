import 'package:flutter/material.dart';
import 'package:study_case_task/utilities/extension/padding_extension.dart';

import '../../../model/exercise_model.dart';

class ResultItemBuilder extends StatelessWidget {
  const ResultItemBuilder({
    Key? key,
    required this.exercises,
  }) : super(key: key);

  final List<ExerciseModel> exercises;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: exercises.length,
        itemBuilder: (context, index) {
          return SizedBox(
            height: 150,
            child: Card(
              color: Colors.white,
              child: Padding(
                padding: context.paddingLow,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      exercises[index].name,
                    ),
                    Text(
                      exercises[index].type,
                    ),
                    Text(
                      exercises[index].muscle,
                    ),
                    Text(
                      exercises[index].equipment,
                    ),
                    Text(
                      exercises[index].difficulty,
                    ),
                    Text(
                      maxLines: 1,
                      exercises[index].instructions,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
