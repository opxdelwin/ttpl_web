import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ttpl_website/provider/navigation_provider.dart';
import 'package:ttpl_website/screens/careers/responsive_career.dart';
import 'package:ttpl_website/screens/contact_us/ResponsiveContactUs.dart';
import 'package:ttpl_website/screens/gallery/responsive_gallery.dart';
import 'package:ttpl_website/screens/products/responsive_products.dart';
import 'package:ttpl_website/screens/services/ResponsiveServices.dart';
import 'package:ttpl_website/screens/landing/LandingResponsive.dart';
import 'package:ttpl_website/utils/utils.dart';

class Header extends StatefulWidget {
  const Header({Key? key}) : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {

  late int _currNav;
  double checkWidth() {
    return MediaQuery.of(context).size.width;
  }

  @override
  void initState() {
    checkWidth;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _currNav = Provider.of<NavigationProvider>(context).currNav;
    double width = checkWidth();
    if (width < 950) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              if(_currNav!=0){
                Provider.of<NavigationProvider>(context, listen: false).decrement();
                Navigator.pop(context);
              }
            },
            child: SizedBox(
                height: 100,
                width: 100,
                child: Image.asset('assets/images/logo.png')),
          ),
          Text(
            'Fire Saftey Consultancy',
            style: heading,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: IconButton(
                onPressed: (){
                  Scaffold.of(context).openEndDrawer();
                },
                icon: const Icon(Icons.more_horiz_rounded)),
          ),
        ],
      );
    } else {
      return SizedBox(
        height: 100,
        width: MediaQuery.of(context).size.width,
        child: Container(
          color: color_white.withOpacity(0.65),
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                  onTap: () {
                    if(_currNav!=0){
                      Provider.of<NavigationProvider>(context, listen: false).decrement();
                      Navigator.pop(context);
                    }
                  },
                  child: Image.asset('assets/images/logo.png')),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const HeaderButton(
                        headerTitle: 'Home',
                        route: ResponsiveLanding()),
                    const HeaderButton(
                        headerTitle: 'Products',
                        route: ResponsiveProducts()),
                    const HeaderButton(
                        headerTitle: 'Services',
                        route:  ResponsiveService()),
                    const HeaderButton(
                        headerTitle: 'Gallery',
                        route:  ResponsiveGallery()),
                    HeaderButton(
                        headerTitle: 'Careers',
                        route:  ResponsiveCareers(emailController: TextEditingController(), nameController: TextEditingController(), phoneController: TextEditingController())),
                    HeaderButton(
                        headerTitle: 'Contact Us',
                        route:  ResponsiveContactUs(
                          phoneController: TextEditingController(),
                          nameController: TextEditingController(),
                          emailController: TextEditingController(),
                          addressController: TextEditingController(),
                          commentsController: TextEditingController(),
                          companyNameController: TextEditingController(),
                          countryController: TextEditingController(),
                        )),

                  ],
                ),
              )
            ],
          ),
        ),
      );
    }
  }
}

///used for header navigation
class HeaderButton extends StatefulWidget {
  final String headerTitle;
  final dynamic route;

  const HeaderButton({Key? key, required this.headerTitle, required this.route})
      : super(key: key);

  @override
  State<HeaderButton> createState() => _HeaderButtonState();
}

class _HeaderButtonState extends State<HeaderButton> {
  bool _underline = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all(Colors.transparent),
          elevation: MaterialStateProperty.all(0),
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
        ),
        onHover: (b) {
          if (b == true) {
            setState(() {
              _underline = true;
            });
          } else {
            setState(() {
              _underline = false;
            });
          }
        },
        onPressed: () {
            Provider.of<NavigationProvider>(context, listen: false).increment();
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => widget.route));
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: _underline ? 25 * 1.2 : 25,
          width: _underline ? 65* 1.2 : 65,
          child: FittedBox(
            child: Text(
              widget.headerTitle,
              style: heading.copyWith(
                letterSpacing: 1.1,
                color: Colors.black,
              ),
            ),
          ),
        ));
  }
}
