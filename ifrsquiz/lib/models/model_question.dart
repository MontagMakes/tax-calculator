class ModelQuestion {
  String question;
  String option1;
  String option2;
  String option3;
  String option4;
  String correctOption;
  String explanation;

  ModelQuestion({
    required this.question,
    required this.option1,
    required this.option2,
    required this.option3,
    required this.option4,
    required this.correctOption,
    required this.explanation,
  });

    factory ModelQuestion.fromJson(Map<String, dynamic> json) {
    return ModelQuestion(
      question: json['question'],
      option1: json['option1'],
      option2: json['option2'],
      option3: json['option3'],
      option4: json['option4'],
      correctOption: json['correctOption'],
      explanation: json['explanation'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'question': question,
      'option1': option1,
      'option2': option2,
      'option3': option3,
      'option4': option4,
      'correctOption': correctOption,
      'explanation': explanation,
    };
  }
}