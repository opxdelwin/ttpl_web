import 'package:flutter/material.dart';
import 'package:ttpl_website/screens/products/product_page.dart';

class ResponsiveProduct extends StatelessWidget {
  const ResponsiveProduct({Key? key, required this.data}) : super(key: key);
  final Map data;

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;

    if (width > 950){
      return ProductPc(data: data,);
    } else {
      return ProductMobile(data: data);
    }
  }
}
