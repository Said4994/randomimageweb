import 'dart:html';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_404/page/Homepage/widget/custombody.dart';
import 'package:web_404/page/Homepage/widget/customtext.dart';

class HomePageView extends StatefulWidget {
  @override
  HomePageViewState createState() => HomePageViewState();
}

String newc = "Random";
double fontssize = 36;
int selectedindex;

final List<Color> colorize = [Colors.black, Colors.white, Colors.black];
final List<String> catagory = [
  "Color",
  "Nature",
  "People",
  "Architecture",
  "Technology",
  "Travel",
  "Health",
  "Fitness",
  "Game",
];

class HomePageViewState extends State<HomePageView> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        CustomBody(),
        CustomText(),
        customBar(width, height),
      ],
    );
  }

  Container customBar(double width, double height) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Align(
          alignment: Alignment.topCenter,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      spreadRadius: 10,
                      color: Colors.white.withOpacity(0.3),
                      blurRadius: 3.0,
                      offset: Offset(0.0, 0.3))
                ]),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: catagory.length,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    SizedBox(
                      width: width >= 700 ? 120 : 40,
                    ),
                    width >= 800
                        ? animatedTextKitChangeColor(index)
                        : materialNoChangeColor(index)
                  ],
                );
              },
            ),
            height: height / 20,
            width: width / 1.5,
          ),
        ),
      ),
    );
  }

  AnimatedTextKit animatedTextKitChangeColor(int index) {
    return AnimatedTextKit(
        isRepeatingAnimation: true,
        repeatForever: true,
        onTap: () {
          setState(() {
            selectedindex = index;
            newc = catagory[index];
          });
        },
        animatedTexts: [
          ColorizeAnimatedText(catagory[index],
              textStyle: GoogleFonts.montserrat(
                  decoration: TextDecoration.none, fontSize: fontssize - 22),
              colors: colorize)
        ]);
  }

  Material materialNoChangeColor(int index) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          setState(() {
            selectedindex = index;
            newc = catagory[index];
          });
        },
        child: Text(
          catagory[index],
          style: GoogleFonts.montserrat(
              decoration: TextDecoration.none, fontSize: fontssize - 22),
        ),
      ),
    );
  }
}
