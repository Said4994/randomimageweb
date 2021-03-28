import 'package:flutter/material.dart';

import 'package:web_404/page/homepageview.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'High Quality Random Image',
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      home: HomePageView(),
    );
  }
}
