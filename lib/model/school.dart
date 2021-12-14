final String tableNotes = 'school';

class SchoolFields {
  static final List<String> values = [
    /// Add all fields
    id,name,age,rollnumber,mobile,image
  ];

  static final String id = '_id';
  static final String name = 'name';
  static final String age = 'age';
  static final String rollnumber = 'rollnumber';
  static final String mobile = 'mobile';
  static final String image = 'image';
}

class School {
  final int? id;
  final bool isImportant;
  final int number;
  final String title;
  final String description;
  final DateTime createdTime;

  const Note({
    this.id,
    required this.isImportant,
    required this.number,
    required this.title,
    required this.description,
    required this.createdTime,
  });

  School copy({
    int? id,
    bool? isImportant,
    int? number,
    String? title,
    String? description,
    DateTime? createdTime,
  }) =>
      Note(
        id: id ?? this.id,
        isImportant: isImportant ?? this.isImportant,
        number: number ?? this.number,
        title: title ?? this.title,
        description: description ?? this.description,
        createdTime: createdTime ?? this.createdTime,
      );

  static School fromJson(Map<String, Object?> json) => School(
    id: json[SchoolFields.id] as int?,
    isImportant: json[SchoolFields.isImportant] == 1,
    number: json[SchoolFields.number] as int,
    title: json[SchoolFields.title] as String,
    description: json[SchoolFields.description] as String,
    createdTime: DateTime.parse(json[NoteFields.time] as String),
  );

  Map<String, Object?> toJson() => {
    NoteFields.id: id,
    NoteFields.title: title,
    NoteFields.isImportant: isImportant ? 1 : 0,
    NoteFields.number: number,
    NoteFields.description: description,
    NoteFields.time: createdTime.toIso8601String(),
  };
}
