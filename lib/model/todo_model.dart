// To parse this JSON data, do
//
//     final todo = todoFromMap(jsonString);

import 'dart:convert';

Todo todoFromMap(String str) => Todo.fromMap(json.decode(str));

String todoToMap(Todo data) => json.encode(data.toMap());

class Todo {
  Todo({
    required this.message,
    required this.data,
  });

  String message;
  List<Datum> data;

  factory Todo.fromMap(Map<String, dynamic> json) => Todo(
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
      };
}

class Datum {
  Datum({
    required this.id,
    required this.title,
    required this.description,
    required this.dateTime,
  });

  String id;
  String title;
  String description;
  String dateTime;

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        title: json["title"],
        description: json["description"],
        dateTime: json["date_time"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "title": title,
        "description": description,
        "date_time": dateTime,
      };
}

























// // To parse this JSON data, do
// //
// //     final todo = todoFromJson(jsonString);

// import 'dart:convert';

// Todo todoFromJson(String str) => Todo.fromJson(json.decode(str));

// String todoToJson(Todo data) => json.encode(data.toJson());

// class Todo {
//   Todo({
//     required this.message,
//     required this.data,
//   });

//   String message;
//   List<Datum> data;

//   factory Todo.fromJson(Map<String, dynamic> json) => Todo(
//         message: json["message"],
//         data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "message": message,
//         "data": List<dynamic>.from(data.map((x) => x.toJson())),
//       };
// }

// class Datum {
//   Datum({
//     required this.id,
//     required this.title,
//     required this.description,
//     required this.dateTime,
//   });

//   String id;
//   String title;
//   String description;
//   String dateTime;

//   factory Datum.fromJson(Map<String, dynamic> json) => Datum(
//         id: json["_id"],
//         title: json["title"],
//         description: json["description"],
//         dateTime: json["date_time"],
//       );

//   Map<String, dynamic> toJson() => {
//         "_id": id,
//         "title": title,
//         "description": description,
//         "date_time": dateTime,
//       };
// }
