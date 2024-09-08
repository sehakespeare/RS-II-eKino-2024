import 'dart:convert';

import 'package:flutter/material.dart';

import '../models/user_roles.dart';

class Authorization {
  static String? username;
  static String? password;
}

class UsersData {
  static int? id;
  static String? name;
  static String? lastname;
  static String? email;
  static String? phone;
  static String? userName;

  static List<UserRole>? roleList;
  static bool? status;
}

class GenreData {
  static int? id;
  static String? name;
}

class AuditoriumData {
  static int? id;
  static String? name;
}

class DirectorData {
  static int? id;
  static String? name;
  static String? biography;
  static String? photo;
}

class MovieData {
  static int? id;
  static String? title;
  static String? description;
  static String? photo;
  static String? runningTime;
  static int? directorId;
  static String? directorFullName;
  static int? year;
  static List<int> movieGenreIdList = [];
}

class ProjectionData {
  static int? id;
  static int? movieId;
  static int? auditoriumId;
  static DateTime? dateOfProjection;
  static double? price;
}

Image imageFromBase64String(String base64image) {
  return Image.memory(base64Decode(base64image));
}
