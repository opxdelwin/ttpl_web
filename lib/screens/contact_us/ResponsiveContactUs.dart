import 'package:flutter/material.dart';

import 'contact_us.dart';

class ResponsiveContactUs extends StatelessWidget {
  const ResponsiveContactUs({Key? key,
    required this.nameController,
    required this.emailController,
    required this.phoneController,
    required this.companyNameController,
    required this.addressController,
    required this.countryController,
    required this.commentsController,
  }) : super(key: key);

  final TextEditingController nameController;
  final TextEditingController phoneController;
  final TextEditingController emailController;
  final TextEditingController companyNameController;
  final TextEditingController addressController;
  final TextEditingController countryController;
  final TextEditingController commentsController;

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;

    if (width > 950){
      return ContactUsPc(
        phoneController: phoneController,
        countryController: countryController,
        companyNameController: companyNameController,
        commentsController: commentsController,
        addressController: addressController,
        nameController: nameController,
        emailController: emailController,
      );
    } else {
      return ContactUsMobile(
        phoneController: phoneController,
        countryController: countryController,
        companyNameController: companyNameController,
        commentsController: commentsController,
        addressController: addressController,
        nameController: nameController,
        emailController: emailController,
      );
    }
  }
}
