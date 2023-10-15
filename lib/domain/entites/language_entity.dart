class LanguageEntity {
  final String title;

  LanguageEntity({required this.title});

  factory LanguageEntity.fromJson({required Map<String, dynamic> json}) {
    return LanguageEntity(title: json["title"]);
  }
}
