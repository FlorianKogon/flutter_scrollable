import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_scrollable/widgets/my_app.dart';

void main() {
  runApp(MyApp());

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp
  ]);
}