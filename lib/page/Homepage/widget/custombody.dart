import 'package:flutter/material.dart';
import 'package:web_404/page/Homepage/Api/api.dart';
import 'package:web_404/page/Homepage/model/model.dart';

import 'customspinkit.dart';

class CustomBody extends StatefulWidget {
  final String newc;
  CustomBody({Key key, this.newc}) : super(key: key);

  @override
  _CustomBodyState createState() => _CustomBodyState();
}

String newc = "Random";

class _CustomBodyState extends State<CustomBody> {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder(
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
            return SpinkitWidget();
          }
        },
      ),
    );
  }
}
