import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void customNavigate(BuildContext context, {required String path}) {
  GoRouter.of(context).push(path);
}

void customReplacementNavigate(BuildContext context, {required String path}) {
  GoRouter.of(context).pushReplacement(path);
}
