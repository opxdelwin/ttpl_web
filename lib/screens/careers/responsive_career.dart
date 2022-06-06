import 'package:flutter/material.dart';
import 'package:ttpl_website/screens/careers/careers.dart';

class ResponsiveCareers extends StatelessWidget {
  const ResponsiveCareers({Key? key, required this.nameController, required this.emailController, required this.phoneController}) : super(key: key);

  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    if(width>950){
      return CareersPC(emailController: emailController, nameController: nameController, phoneController: phoneController,);
    } else {
      return CareersMobile(emailController: emailController, nameController: nameController, phoneController: phoneController,);
    }
  }
}
