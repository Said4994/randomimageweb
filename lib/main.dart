import 'package:flutter/material.dart';
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

String genericapikey = "ojy9rVHXrIkZGxOSVOlIAF-D4iu4jwPlNJ9TccEFnpM";
String apikey1 = "ojy9rVHXrIkZGxOSVOlIAF-D4iu4jwPlNJ9TccEFnpM";
String apikey2 = 'oRC95d5jq5hqf9bsJ3vrl7SKmiagEBcbEwzDDhF9qBQ';
String apikey3 = 'JnUAcB_5dwbuYD4HHsrHOqy_xbxhm8Z7NNaXfze3KeM';

class _AnasayfaState extends State<Anasayfa> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.miniEndFloat,
          floatingActionButton: FloatingActionButton(
            elevation: 6,
            tooltip: 'Refresh',
            onPressed: () {
              setState(() {
                buildFutureBuilderImagebody();
              });
            },
            backgroundColor: Colors.white,
            child: Icon(
              Icons.refresh_rounded,
              color: Colors.black,
            ),
          ),
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
            ))
      ],
    );
  }

  FutureBuilder<List<Resim>> buildFutureBuilderImagebody() {
    return FutureBuilder(
      future: getapi(),
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
