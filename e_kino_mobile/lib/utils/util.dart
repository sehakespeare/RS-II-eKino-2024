import 'dart:convert';

import 'package:flutter/material.dart';

import '../models/projection.dart';
import '../models/user.dart';

class Authorization {
  static String? username;
  static String? password;
}

Image imageFromBase64String(String base64image) {
  return Image.memory(base64Decode(base64image));
}

class CartRouteData {
  static Map<String, dynamic>? reservationSaveValue;
  static Map<String, dynamic>? transactionSaveValue;
  static Projection? projection;
  static int? reservationId;
  static Users? user;
}
