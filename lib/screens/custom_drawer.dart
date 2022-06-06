import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ttpl_website/screens/careers/responsive_career.dart';
import 'package:ttpl_website/screens/gallery/responsive_gallery.dart';
import 'package:ttpl_website/screens/landing/LandingResponsive.dart';
import 'package:ttpl_website/screens/products/responsive_products.dart';
import 'package:ttpl_website/screens/services/ResponsiveServices.dart';
import 'package:ttpl_website/utils/utils.dart';
import '../provider/navigation_provider.dart';
import 'brochure/ResponsiveBrochure.dart';
import 'contact_us/ResponsiveContactUs.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key, required this.width, required this.height}) : super(key: key);
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: width,
      backgroundColor: color_white,
      child: SizedBox(
        height: height,
        child: Column(
          children: [
            const SizedBox(height: 32),
            Center(child: Text('Navigate', style: heading,)),
            const SizedBox(height: 24,),
            ListView(
              shrinkWrap: true,
              controller: ScrollController(),
              children: [
                _buildDrawerItem(context, style: body, name: 'Home', route: const ResponsiveLanding()),
                const SizedBox(height: 24),
                _buildDrawerItem(context, style: body, name: 'Products', route: const ResponsiveProducts()),
                const SizedBox(height: 24),
                _buildDrawerItem(context, style: body, name: 'Services', route: const ResponsiveService()),
                const SizedBox(height: 24),
                _buildDrawerItem(context, style: body, name: 'Clientele', route: const ResponsiveBrochure()),
                const SizedBox(height: 24),
                _buildDrawerItem(context, style: body, name: 'Gallery', route: const ResponsiveGallery()),
                const SizedBox(height: 24),
                _buildDrawerItem(context, style: body, name: 'Careers', route: ResponsiveCareers(nameController: TextEditingController(), emailController: TextEditingController(), phoneController: TextEditingController())),
                const SizedBox(height: 24),
                _buildDrawerItem(context, style: body, name: 'Contact Us', route: ResponsiveContactUs(emailController: TextEditingController(),
                  nameController: TextEditingController(),
                  addressController: TextEditingController(),
                  commentsController: TextEditingController(),
                  companyNameController: TextEditingController(),
                  countryController: TextEditingController(),
                  phoneController: TextEditingController(),)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

GestureDetector _buildDrawerItem(BuildContext context,{required String name, required TextStyle style,required dynamic route}){
  return GestureDetector(
    onTap: (){
      Provider.of<NavigationProvider>(context, listen: false).increment();
      Scaffold.of(context).closeEndDrawer();
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => route));
    },
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(name, style: style,),
    ),
  );
}
