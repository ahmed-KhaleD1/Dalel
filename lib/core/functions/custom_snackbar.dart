import 'package:dalel/core/utils/app_color.dart';
import 'package:flutter/material.dart';

void customSnackBar(BuildContext context,
    {required String message, required Color backgroundColor}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: backgroundColor,
    ),
  );
}
