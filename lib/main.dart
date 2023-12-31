import 'package:flutter/material.dart';
import 'package:flutter_widgets/screens/gridview_screen.dart';
import 'package:flutter_widgets/screens/home_screen.dart';
import 'package:flutter_widgets/widgets/bottom_sheet.dart';

import 'screens/fab_scroll_position.dart';
import 'screens/sliding_panel_screen.dart';
import 'screens/sliver_app_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        useMaterial3: true,
      ),
      home: SafeArea(
        child: SevasScreenOld(),
      ),
    );
  }
}
