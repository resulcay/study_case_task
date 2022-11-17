import 'package:flutter/material.dart';
import 'package:study_case_task/utilities/extension/media_query_extension.dart';
import 'package:study_case_task/utilities/extension/padding_extension.dart';
import 'package:study_case_task/view/home/components/read_more_bottom_sheet.dart';

import '../../../constant/color.dart';
import '../../../model/exercise_model.dart';
import 'decorated_card_text.dart';

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
            height: 180,
            child: GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  barrierColor: Colors.black12.withOpacity(.5),
                  backgroundColor: ConstantAppColor.pureWhite,
                  constraints: BoxConstraints(
                    minHeight: 100,
                    maxHeight: context.height * .95,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60),
                  ),
                  context: context,
                  builder: (context) =>
                      ReadMoreBottomSheet(exercise: exercises[index]),
                );
              },
              child: Card(
                color: Colors.white,
                child: Padding(
                  padding: context.paddingLow,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            DecoratedCardText(
                                text: exercises[index].name,
                                color: Colors.amber.shade50),
                            DecoratedCardText(
                              text: exercises[index].type,
                              color: Colors.amber.shade200,
                            ),
                            DecoratedCardText(
                              text: exercises[index].muscle,
                              color: Colors.amber.shade300,
                            ),
                            DecoratedCardText(
                              text: exercises[index].equipment,
                              color: Colors.amber.shade400,
                            ),
                            DecoratedCardText(
                              text: exercises[index].difficulty,
                              color: Colors.amber.shade500,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 3),
                      Expanded(
                        flex: 6,
                        child: Container(
                          padding: context.paddingLow,
                          decoration:
                              BoxDecoration(color: Colors.blue.shade300),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                softWrap: true,
                                exercises[index].instructions,
                                maxLines: 7,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(
                                      fontSize: 13,
                                      color: Colors.black.withOpacity(.8),
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
