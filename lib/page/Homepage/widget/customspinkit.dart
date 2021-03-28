import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SpinkitWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: SpinKitRipple(
      size: 100,
      color: Colors.white.withOpacity(0.8),
    ));
  }
}
