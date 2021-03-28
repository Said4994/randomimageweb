import 'dart:html';

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

List<String> catagory = [
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
      children: [CustomBody(), CustomText(), customBar(width, height)],
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
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        highlightColor: Colors.transparent,
                        onTap: () {
                          setState(() {
                            setState(() {});

                            selectedindex = index;
                            newc = catagory[index];
                          });
                        },
                        child: Text(
                          catagory[index],
                          style: GoogleFonts.montserrat(
                              decoration: TextDecoration.none,
                              fontSize: selectedindex == index
                                  ? fontssize
                                  : fontssize - 22,
                              color: Colors.black.withOpacity(0.9)),
                        ),
                      ),
                    ),
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
}
