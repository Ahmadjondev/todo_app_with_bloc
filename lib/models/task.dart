import 'package:equatable/equatable.dart';

class Task extends Equatable {
  final String title;
  final String description;
  final String id;
  final String date;
  bool? isDone;
  bool? isDeleted;
  bool? isFavorite;
  Task(
      {required this.title,
      required this.description,
      required this.id,
      required this.date,
      this.isDone,
      this.isDeleted,
      this.isFavorite}) {
    isDone = isDone ?? false;
    isDeleted = isDeleted ?? false;
    isFavorite = isFavorite ?? false;
  }

  Task copyWith({
    String? title,
    String? description,
    String? id,
    String? date,
    bool? isDone,
    bool? isDeleted,
    bool? isFavorite,
  }) {
    return Task(
        title: title ?? this.title,
        description: description ?? this.description,
        id: id ?? this.id,
        isDone: isDone ?? this.isDone,
        isDeleted: isDeleted ?? this.isDeleted,
        date: date ?? this.date,
        isFavorite: isFavorite ?? this.isFavorite);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'date': date,
      'isFavorite': isFavorite,
      'id': id,
      'isDone': isDone,
      'isDeleted': isDeleted,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      id: map['id'] ?? '',
      isDone: map['isDone'],
      isDeleted: map['isDeleted'],
      isFavorite: map['isFavorite'],
      date: map['date'],
    );
  }

  @override
  List<Object?> get props =>
      [title, id, description, date, isFavorite, isDone, isDeleted];
}
