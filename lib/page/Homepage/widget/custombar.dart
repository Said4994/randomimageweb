import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomBar extends StatefulWidget {
  final List catogory;
  final double widht;
  final double height;

  CustomBar(
      {Key key,
      @required this.widht,
      @required this.height,
      @required this.catogory})
      : super(key: key);

  @override
  _CustomBarState createState() => _CustomBarState();
}

String newc = "Random";

class _CustomBarState extends State<CustomBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
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
              itemCount: widget.catogory.length,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    SizedBox(
                      width: widget.widht >= 700 ? 120 : 40,
                    ),
                    Material(
                      child: InkWell(
                        highlightColor: Colors.white,
                        focusColor: Colors.white,
                        hoverColor: Colors.white,
                        splashColor: Colors.white,
                        onTap: () {
                          setState(() {
                            newc = widget.catogory[index];
                          });
                        },
                        child: Text(
                          widget.catogory[index],
                          style: GoogleFonts.montserrat(
                              decoration: TextDecoration.none,
                              fontSize:
                                  widget.widht >= 700 || widget.height <= 100
                                      ? 20
                                      : 10,
                              color: Colors.black.withOpacity(0.9)),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            height: widget.height / 20,
            width: widget.widht / 1.5,
          ),
        ),
      ),
    );
  }
}
