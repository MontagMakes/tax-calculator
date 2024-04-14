class ModelChapter {
  String title = "";
  String description = "";

  ModelChapter({required this.title, required this.description});

  factory ModelChapter.fromJson(Map<String, dynamic> json) {
    return ModelChapter(
      title: json['title'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
    };
  }

  ModelChapter copyWith({
    String? title,
    String? description,
  }) {
    return ModelChapter(
      title: title ?? this.title,
      description: description ?? this.description,
    );
  }
}
