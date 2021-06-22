// To parse this JSON data, do
//
//     final userDetailsModel = userDetailsModelFromJson(jsonString);

import 'dart:convert';
// @dart=2.9
// UserDetailsModel userDetailsModelFromJson(String ?str) => UserDetailsModel.fromJson(json.decode(str!));
//
// String userDetailsModelToJson(UserDetailsModel data) => json.encode(data.toJson());
//
// class UserDetailsModel {
//   UserDetailsModel({
//     this.results,
//   });
//
//   List<Result>? results;
//
//   factory UserDetailsModel.fromJson(Map<String, dynamic> json) => UserDetailsModel(
//     results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "results": List<dynamic>.from(results!.map((x) => x.toJson())),
//   };
// }
//
// class Result {
//   Result({
//     this.user,
//     this.seed,
//     this.version,
//   });
//
//   User ?user;
//   String ?seed;
//   String ?version;
//
//   factory Result.fromJson(Map<String, dynamic> json) => Result(
//     user: User.fromJson(json["user"]),
//     seed: json["seed"],
//     version: json["version"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "user": user!.toJson(),
//     "seed": seed!,
//     "version": version!,
//   };
// }
//
// class User {
//   User({
//     this.gender,
//     this.name,
//     this.location,
//     this.email,
//     this.username,
//     this.password,
//     this.salt,
//     this.md5,
//     this.sha1,
//     this.sha256,
//     this.registered,
//     this.dob,
//     this.phone,
//     this.cell,
//     this.ssn,
//     this.picture,
//   });
//
//   String ?gender;
//   Name ?name;
//   Location ?location;
//   String ?email;
//   String ?username;
//   String? password;
//   String ?salt;
//   String? md5;
//   String? sha1;
//   String? sha256;
//   String? registered;
//   String ?dob;
//   String? phone;
//   String ?cell;
//   String ?ssn;
//   String ?picture;
//
//   factory User.fromJson(Map<String, dynamic> json) => User(
//     gender: json["gender"],
//     name: Name.fromJson(json["name"]),
//     location: Location.fromJson(json["location"]),
//     email: json["email"],
//     username: json["username"],
//     password: json["password"],
//     salt: json["salt"],
//     md5: json["md5"],
//     sha1: json["sha1"],
//     sha256: json["sha256"],
//     registered: json["registered"],
//     dob: json["dob"],
//     phone: json["phone"],
//     cell: json["cell"],
//     ssn: json["SSN"],
//     picture: json["picture"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "gender": gender!,
//     "name": name!.toJson(),
//     "location": location!.toJson(),
//     "email": email!,
//     "username": username!,
//     "password": password!,
//     "salt": salt!,
//     "md5": md5!,
//     "sha1": sha1!,
//     "sha256": sha256!,
//     "registered": registered!,
//     "dob": dob!,
//     "phone": phone!,
//     "cell": cell!,
//     "SSN": ssn!,
//     "picture": picture!,
//   };
// }
//
// class Location {
//   Location({
//     this.street,
//     this.city,
//     this.state,
//     this.zip,
//   });
//
//   String ?street;
//   String ?city;
//   String ?state;
//   String ?zip;
//
//   factory Location.fromJson(Map<String, dynamic> json) => Location(
//     street: json["street"],
//     city: json["city"],
//     state: json["state"],
//     zip: json["zip"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "street": street!,
//     "city": city!,
//     "state": state!,
//     "zip": zip!,
//   };
// }
//
// class Name {
//   Name({
//     this.title,
//     this.first,
//     this.last,
//   });
//
//   String? title;
//   String ?first;
//   String ?last;
//
//   factory Name.fromJson(Map<String, dynamic> json) => Name(
//     title: json["title"],
//     first: json["first"],
//     last: json["last"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "title": title,
//     "first": first,
//     "last": last,
//   };
// }
//
//
//

// To parse this JSON data, do
//
//     final userDetailsModel = userDetailsModelFromJson(jsonString);

import 'dart:convert';

UserDetailsModel userDetailsModelFromJson(String str) => UserDetailsModel.fromJson(json.decode(str));

String userDetailsModelToJson(UserDetailsModel data) => json.encode(data.toJson());

class UserDetailsModel {
  UserDetailsModel({
    this.results,
  });

  List<Result> results;

  factory UserDetailsModel.fromJson(Map<String, dynamic> json) => UserDetailsModel(
    results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
  };
}

class Result {
  Result({
    this.user,
    this.seed,
    this.version,
  });

  User user;
  String seed;
  String version;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    user: User.fromJson(json["user"]),
    seed: json["seed"],
    version: json["version"],
  );

  Map<String, dynamic> toJson() => {
    "user": user.toJson(),
    "seed": seed,
    "version": version,
  };
}

class User {
  User({
    this.gender,
    this.name,
    this.location,
    this.email,
    this.username,
    this.password,
    this.salt,
    this.md5,
    this.sha1,
    this.sha256,
    this.registered,
    this.dob,
    this.phone,
    this.cell,
    this.ssn,
    this.picture,
  });

  String gender;
  Name name;
  Location location;
  String email;
  String username;
  String password;
  String salt;
  String md5;
  String sha1;
  String sha256;
  String registered;
  String dob;
  String phone;
  String cell;
  String ssn;
  String picture;

  factory User.fromJson(Map<String, dynamic> json) => User(
    gender: json["gender"],
    name: Name.fromJson(json["name"]),
    location: Location.fromJson(json["location"]),
    email: json["email"],
    username: json["username"],
    password: json["password"],
    salt: json["salt"],
    md5: json["md5"],
    sha1: json["sha1"],
    sha256: json["sha256"],
    registered: json["registered"],
    dob: json["dob"],
    phone: json["phone"],
    cell: json["cell"],
    ssn: json["SSN"],
    picture: json["picture"],
  );

  Map<String, dynamic> toJson() => {
    "gender": gender,
    "name": name.toJson(),
    "location": location.toJson(),
    "email": email,
    "username": username,
    "password": password,
    "salt": salt,
    "md5": md5,
    "sha1": sha1,
    "sha256": sha256,
    "registered": registered,
    "dob": dob,
    "phone": phone,
    "cell": cell,
    "SSN": ssn,
    "picture": picture,
  };
}

class Location {
  Location({
    this.street,
    this.city,
    this.state,
    this.zip,
  });

  String street;
  String city;
  String state;
  String zip;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    street: json["street"],
    city: json["city"],
    state: json["state"],
    zip: json["zip"],
  );

  Map<String, dynamic> toJson() => {
    "street": street,
    "city": city,
    "state": state,
    "zip": zip,
  };
}

class Name {
  Name({
    this.title,
    this.first,
    this.last,
  });

  String title;
  String first;
  String last;

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
