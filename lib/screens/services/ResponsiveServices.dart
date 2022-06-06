import 'package:flutter/material.dart';
import 'package:ttpl_website/screens/services/services.dart';

class ResponsiveService extends StatelessWidget {
  const ResponsiveService({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;

    if (width > 950){
      return const ServicesPc();
    } else {
      return const ServicesMobile();
    }
  }
}
