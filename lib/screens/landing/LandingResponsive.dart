import 'package:flutter/material.dart';
import 'package:ttpl_website/screens/landing/landing.dart';

class ResponsiveLanding extends StatelessWidget {
  const ResponsiveLanding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    if(width > 950){
      return const LandingScreen();
    } else {
      return const LandingMobile();
    }
  }
}
