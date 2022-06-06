
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:ttpl_website/screens/brochure/brochure.dart';

class ResponsiveBrochure extends StatefulWidget {
  const ResponsiveBrochure({Key? key}) : super(key: key);

  @override
  State<ResponsiveBrochure> createState() => _ResponsiveBrochureState();
}

class _ResponsiveBrochureState extends State<ResponsiveBrochure> {
  late TextEditingController _emailController;
  late TextEditingController _phoneController;

  @override
  void initState(){
    _emailController = TextEditingController();
    _phoneController = TextEditingController();
    super.initState();
  }

  @override
  void dispose(){
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;

    if (width > 950){
      return BrochurePC(emailController: _emailController, phoneController: _phoneController,);
    } else {
      return BrochureMobile(emailController: _emailController, phoneController: _phoneController,);
    }
  }
}
