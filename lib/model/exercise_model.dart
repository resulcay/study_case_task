import 'dart:convert';

class ExerciseModel {
  final String name;
  final String type;
  final String muscle;
  final String equipment;
  final String difficulty;
  final String instructions;
  ExerciseModel({
    required this.name,
    required this.type,
    required this.muscle,
    required this.equipment,
    required this.difficulty,
    required this.instructions,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'type': type,
      'muscle': muscle,
      'equipment': equipment,
      'difficulty': difficulty,
      'instructions': instructions,
    };
  }

  factory ExerciseModel.fromMap(Map<String, dynamic> map) {
    return ExerciseModel(
      name: map['name'] as String,
      type: map['type'] as String,
      muscle: map['muscle'] as String,
      equipment: map['equipment'] as String,
      difficulty: map['difficulty'] as String,
      instructions: map['instructions'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ExerciseModel.fromJson(String source) =>
      ExerciseModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
