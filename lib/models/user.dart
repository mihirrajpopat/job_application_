// To parse this JSON data, do
//
//     final users = usersFromJson(jsonString);

import 'dart:convert';

Users usersFromJson(String str) => Users.fromJson(json.decode(str));

String usersToJson(Users data) => json.encode(data.toJson());

class Users {
  List<Result>? results;

  Users({
    this.results,
  });

  factory Users.fromJson(Map<String, dynamic> json) => Users(
        results: json["results"] == null ? [] : List<Result>.from(json["results"]!.map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "results": results == null ? [] : List<dynamic>.from(results!.map((x) => x.toJson())),
      };
}

class Result {
  String? gender;
  Name? name;
  String? email;
  Dob? dob;
  Picture? picture;
  String? nat;

  Result({
    this.gender,
    this.name,
    this.email,
    this.dob,
    this.picture,
    this.nat,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        gender: json["gender"],
        name: json["name"] == null ? null : Name.fromJson(json["name"]),
        email: json["email"],
        dob: json["dob"] == null ? null : Dob.fromJson(json["dob"]),
        picture: json["picture"] == null ? null : Picture.fromJson(json["picture"]),
        nat: json["nat"],
      );

  Map<String, dynamic> toJson() => {
        "gender": gender,
        "name": name?.toJson(),
        "email": email,
        "dob": dob?.toJson(),
        "picture": picture?.toJson(),
        "nat": nat,
      };
}

class Dob {
  DateTime? date;
  int? age;

  Dob({
    this.date,
    this.age,
  });

  factory Dob.fromJson(Map<String, dynamic> json) => Dob(
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        age: json["age"],
      );

  Map<String, dynamic> toJson() => {
        "date": date?.toIso8601String(),
        "age": age,
      };
}

class Name {
  String? title;
  String? first;
  String? last;

  Name({
    this.title,
    this.first,
    this.last,
  });

  factory Name.fromJson(Map<String, dynamic> json) => Name(
        title: json["title"],
        first: json["first"],
        last: json["last"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "first": first,
        "last": last,
      };
}

class Picture {
  String? large;
  String? medium;
  String? thumbnail;

  Picture({
    this.large,
    this.medium,
    this.thumbnail,
  });

  factory Picture.fromJson(Map<String, dynamic> json) => Picture(
        large: json["large"],
        medium: json["medium"],
        thumbnail: json["thumbnail"],
      );

  Map<String, dynamic> toJson() => {
        "large": large,
        "medium": medium,
        "thumbnail": thumbnail,
      };
}
