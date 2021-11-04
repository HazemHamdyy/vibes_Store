import 'package:flutter/material.dart';

SnackBar snack(String msg, Color color) {
  return SnackBar(
    backgroundColor: color,
    content: Text(msg),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  );
}
