import 'package:flutter/material.dart';
import 'package:ttpl_website/screens/products/products_page.dart';
import 'package:ttpl_website/utils/utils.dart';

class ResponsiveProducts extends StatelessWidget {
  const ResponsiveProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if(size.width>responsiveSize){
      return const ProductsPc();
    } else{
      return const ProductsMobile();
    }
  }
}
