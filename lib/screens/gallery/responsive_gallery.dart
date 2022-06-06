import 'package:flutter/material.dart';
import 'package:ttpl_website/screens/gallery/gallery.dart';
import '../../utils/utils.dart';

class ResponsiveGallery extends StatelessWidget {
  const ResponsiveGallery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if(size.width > responsiveSize){
      return const GalleryPc();
    } else{
      return const GalleryMobile();
    }
  }
}
