import 'dart:html';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web_404/api.dart';
import 'package:web_404/model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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
      home: Anasayfa(),
    );
  }
}

class Anasayfa extends StatefulWidget {
  @override
  _AnasayfaState createState() => _AnasayfaState();
}

List<String> catagory = [
  "Color",
  "Nature",
  "People",
  "Architecture",
  "Technology",
  "Travel"
];

String newc = "Random";
String genericapikey = "ojy9rVHXrIkZGxOSVOlIAF-D4iu4jwPlNJ9TccEFnpM";
String apikey1 = "ojy9rVHXrIkZGxOSVOlIAF-D4iu4jwPlNJ9TccEFnpM";
String apikey2 = 'oRC95d5jq5hqf9bsJ3vrl7SKmiagEBcbEwzDDhF9qBQ';
String apikey3 = 'JnUAcB_5dwbuYD4HHsrHOqy_xbxhm8Z7NNaXfze3KeM';

class _AnasayfaState extends State<Anasayfa> {
  @override
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.black,
          body: buildFutureBuilderImagebody(),
        ),
        Positioned(
          bottom: 15,
          left: 100,
          child: Text(
            "Created\n by Said KURT",
            style: GoogleFonts.adventPro(
                decoration: TextDecoration.none,
                fontSize: 17,
                color: Colors.white),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.topCenter,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        spreadRadius: 10,
                        color: Colors.white,
                        blurRadius: 10.0,
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
                        child: InkWell(
                          highlightColor: Colors.white,
                          focusColor: Colors.white,
                          hoverColor: Colors.white,
                          splashColor: Colors.white,
                          onTap: () {
                            setState(() {
                              newc = catagory[index];
                            });
                          },
                          child: Text(
                            catagory[index],
                            style: GoogleFonts.montserrat(
                                decoration: TextDecoration.none,
                                fontSize:
                                    width >= 700 || height <= 100 ? 20 : 10,
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
      ],
    );
  }

  FutureBuilder<List<Resim>> buildFutureBuilderImagebody() {
    return FutureBuilder(
      future: getapi(newc),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Resim> resim = snapshot.data;
          return ListView.builder(
            shrinkWrap: false,
            itemCount: resim.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(
                      resim[index].urls.regular,
                      fit: BoxFit.cover,
                    )),
              );
            },
          );
        } else {
          return Center(
              child: SpinKitRipple(
            size: 100,
            color: Colors.white.withOpacity(0.8),
          ));
        }
      },
    );
  }
}
