import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yngen_exam/screens/home.dart';
import 'package:yngen_exam/screens/new_diary.dart';

class RouterGenerator {
  static Route<dynamic> routeTo(RouteSettings settings){
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return CupertinoPageRoute(builder: (_) => const HomeScreen());
      case '/new-diary':
        return CupertinoPageRoute(builder: (_) => const NewDiaryScreen());
      default:
        return CupertinoPageRoute(builder: (_) => const HomeScreen());
    }
  }
}

Future pushRoute(BuildContext context, {required String url, Object? arguments}){
  FocusScope.of(context).unfocus();
  return Navigator.of(context).pushNamed(url, arguments: arguments);
}

void cleanPushRoute(BuildContext context, {required String url, Object? arguments}){
  Navigator.of(context).pushNamedAndRemoveUntil(url, (route) => false);
}

void popRoute(BuildContext context){
  Navigator.of(context).pop();
}