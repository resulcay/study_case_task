import 'package:flutter/material.dart';
import 'package:study_case_task/utilities/extension/padding_extension.dart';

import '../../../model/exercise_model.dart';
import 'bottom_sheet_text_section.dart';

class ReadMoreBottomSheet extends StatelessWidget {
  final ExerciseModel exercise;
  const ReadMoreBottomSheet({super.key, required this.exercise});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: context.paddingLarge,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BottomSheetTextSection(text: "Name : ${exercise.name}"),
              const SizedBox(height: 10),
              BottomSheetTextSection(text: "Type : ${exercise.type}"),
              const SizedBox(height: 10),
              BottomSheetTextSection(text: "Muscle : ${exercise.muscle}"),
              const SizedBox(height: 10),
              BottomSheetTextSection(text: "Equipment : ${exercise.equipment}"),
              const SizedBox(height: 10),
              BottomSheetTextSection(
                  text: "Difficulty : ${exercise.difficulty}"),
              const SizedBox(height: 10),
              BottomSheetTextSection(
                  text: "Instructions : ${exercise.instructions}"),
            ],
          ),
        ),
      ),
    );
  }
}
