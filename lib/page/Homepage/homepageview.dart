import 'package:flutter/material.dart';
import 'package:web_404/page/Homepage/widget/custombar.dart';
import 'package:web_404/page/Homepage/widget/custombody.dart';
import 'package:web_404/page/Homepage/widget/customtext.dart';

class HomePageView extends StatefulWidget {
  @override
  _HomePageViewState createState() => _HomePageViewState();
}

List<String> catagory = [
  "Color",
  "Nature",
  "People",
  "Architecture",
  "Technology",
  "Travel"
];

class _HomePageViewState extends State<HomePageView> {
  @override
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        CustomBar(
          widht: width,
          height: height,
          catogory: catagory,
        ),
        CustomBody(),
        CustomText(),
      ],
    );
  }
}
