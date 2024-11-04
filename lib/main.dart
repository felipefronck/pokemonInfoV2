// import 'dart:io';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_info_2/app.widget.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
    if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
      sqfliteFfiInit();
      databaseFactory = databaseFactoryFfi;
    }
  runApp(const Appwidget());
}