class McqQuestion {
  String questionType;
  String questionText;
  String imageString;
  String optionA;
  String optionB;
  String optionC;
  String optionD;
  String answer;
  McqQuestion({
    required this.questionType,
    required this.questionText,
    required this.imageString,
    required this.optionA,
    required this.optionB,
    required this.optionC,
    required this.optionD,
    required this.answer,
  });
}

// 3MNI = 3 mcq no image
// 4MNI = 4 mcq no image
// 4MI = 4 mcq with image
