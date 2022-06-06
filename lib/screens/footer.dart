import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ttpl_website/screens/brochure/ResponsiveBrochure.dart';
import 'package:ttpl_website/screens/careers/responsive_career.dart';
import 'package:ttpl_website/screens/landing/LandingResponsive.dart';
import 'package:ttpl_website/screens/privacy_policy/privacy_policy.dart';
import 'package:ttpl_website/screens/products/responsiveProduct.dart';
import 'package:ttpl_website/screens/products/responsive_products.dart';
import 'package:ttpl_website/utils/text_class.dart';
import 'package:ttpl_website/utils/utils.dart';
import 'package:url_launcher/url_launcher.dart';

import '../provider/navigation_provider.dart';
import 'contact_us/ResponsiveContactUs.dart';

class Footer extends StatefulWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {

  @override
  Widget build(BuildContext context) {
    if(MediaQuery.of(context).size.width > 950){
      return Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          padding: mainPadding,
          // height: 250,
          color: color_red,
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Quick Links',
                          style: heading.copyWith(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              letterSpacing: 1.1
                          ),
                        ),
                        const SizedBox(height: 20),
                        const  FooterButton(footerTitle: '• Company',route: ResponsiveLanding(),),
                        const SizedBox(height: 10),
                        const  FooterButton(footerTitle: '• Clientele',route: ResponsiveBrochure(),),
                        const SizedBox(height: 10),
                        FooterButton(footerTitle: '• Careers',route: ResponsiveCareers(emailController: TextEditingController(), nameController: TextEditingController(), phoneController: TextEditingController()),),
                        const SizedBox(height: 10),
                        const  FooterButton(footerTitle: '• Privacy Policy',route: PrivacyPolicy(),),
                      ],
                    ),
                  ),
                  Expanded(child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Made in India Solutions',
                        style: heading.copyWith(
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            letterSpacing: 1.1
                        ),
                      ),
                      const SizedBox(height: 20),
                      FooterButton(footerTitle: 'Wireless Addressable Fire Detection & Alarm System',route: ResponsiveProduct(data: product_data[0])),
                      const SizedBox(height: 10),
                      FooterButton(footerTitle: 'Wireless Nurse Calling System',route: ResponsiveProduct(data: product_data[1]),),
                      const SizedBox(height: 10),
                      FooterButton(footerTitle: 'Wireless Attendant Calling System',route: ResponsiveProduct(data: product_data[2]),),
                    ],
                  ), flex: 5),
                  Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Headquarters',
                                  style: heading.copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                      letterSpacing: 1.1
                                  ),
                                ),
                                const SizedBox(height: 19),
                                secondaryText(text:
                                'Textel Tower,'
                                ),
                                const SizedBox(height: 0),
                                secondaryText(text: '3rd & 4th Floor,'),

                                const SizedBox(height: 2),
                                secondaryText(text: 'D1 Square, Patia,'),

                                const SizedBox(height: 2),
                                secondaryText(text: 'Bhubaneswar - 751024,'),
                              ],
                            ),
                            const SizedBox(height:30),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Regional Offices',
                                  style: heading.copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    letterSpacing: 1.1
                                  ),
                                ),
                                const SizedBox(height: 20),
                                secondaryText(text: 'Delhi'),
                                const SizedBox(height: 5),
                                secondaryText(text: 'Mumbai'),
                                const SizedBox(height: 5),
                                secondaryText(text: 'Cochin'),
                                const SizedBox(height: 5),
                                secondaryText(text: 'Bhubaneswar'),
                              ],
                            )
                          ],
                        ),
                      )),
                ],
              ),
              const SizedBox(height: 50),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                      children: [
                        Text('©',
                          style: TextStyle(
                              color: color_white,
                              fontSize: 30
                          ),),
                        const SizedBox(width: 5,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('2022 Reserved',
                              style: heading.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,

                              ),),
                            Text('Textel',
                                style:heading.copyWith(
                                    fontWeight: FontWeight.w500,
                                  color: Colors.white
                                ),),
                          ],
                        )
                      ]
                  ),
                  Text('www.textelindia.com',
                      style: heading.copyWith(
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                      ),),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: (){
                          launchUrl(Uri(
                              scheme: 'tel',
                              path: '18008899824'
                          ));
                        },
                        child: RichText(text: TextSpan(
                            children: [
                              TextSpan(text: 'Toll free no:', style: body.copyWith(
                                color: Colors.black,
                              )),
                              TextSpan(text: '1800 8899824', style: heading.copyWith(
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              )),
                            ]
                        )),
                      ),
                      InkWell(
                        onTap: (){
                          launchUrl(Uri(
                            scheme: 'mailto',
                            path: 'info@textelindia.com'
                          ));
                        },
                        child: Text('info@textelindia.com',
                            style: heading.copyWith(
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                            ),),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ));
    } else {
      return Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          padding: mainPadding,
          // height: 250,
          color: color_red,
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Quick Links',
                          style: heading.copyWith(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              letterSpacing: 1.1
                          ),
                        ),
                        const SizedBox(height: 20),
                        const  FooterButton(footerTitle: '• Company',route: ResponsiveLanding(),),
                        const SizedBox(height: 10),
                        const  FooterButton(footerTitle: '• Products',route: ResponsiveProducts()),
                        const SizedBox(height: 10),
                        FooterButton(footerTitle: '• Careers',route: ResponsiveCareers(emailController: TextEditingController(), nameController: TextEditingController(), phoneController: TextEditingController()),),
                        const SizedBox(height: 10),
                        FooterButton(footerTitle: '• Contact Us', route: ResponsiveContactUs(
                          phoneController: TextEditingController(),
                          nameController: TextEditingController(),
                          emailController: TextEditingController(),
                          addressController: TextEditingController(),
                          commentsController: TextEditingController(),
                          companyNameController: TextEditingController(),
                          countryController: TextEditingController(),
                        )),
                        const SizedBox(height: 10),
                        const  FooterButton(footerTitle: '• Privacy Policy',route: PrivacyPolicy(),),
                      ],
                    ),
                  ),
                  Expanded(child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Made in India Solutions',
                        style: heading.copyWith(
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            letterSpacing: 1.1
                        ),
                      ),
                      const SizedBox(height: 20),
                      InkWell(
                          onTap: (){
                            Provider.of<NavigationProvider>(context, listen: false).increment();
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>ResponsiveProduct(data: product_data[0])));
                          },
                          child: Text('Wireless Addressable Fire Detection & Alarm System', style: body,)),
                      const SizedBox(height: 10),
                      InkWell(
                          onTap: (){
                            Provider.of<NavigationProvider>(context, listen: false).increment();
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>ResponsiveProduct(data: product_data[1])));
                          },
                          child: Text('Wireless Nurse Calling System', style: body,)),
                      const SizedBox(height: 10),
                      InkWell(
                          onTap: (){
                            Provider.of<NavigationProvider>(context, listen: false).increment();
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>ResponsiveProduct(data: product_data[2])));
                          },
                          child: Text('Wireless Attendant Calling System', style: body,)),
                    ],
                  ), flex: 5),
                ],
              ),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      flex : 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Headquarters',
                            style: heading.copyWith(
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                                letterSpacing: 1.1
                            )
                          ),
                          const SizedBox(height: 19),
                          secondaryText(text:
                          'Textel Tower,'
                          ),
                          const SizedBox(height: 0),
                          secondaryText(text: '3rd & 4th Floor,'),

                          const SizedBox(height: 2),
                          secondaryText(text: 'D1 Square, Patia,'),

                          const SizedBox(height: 2),
                          secondaryText(text: 'Bhubaneswar - 751024,'),
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Regional Offices',
                            style: heading.copyWith(
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                                letterSpacing: 1.1
                            ),
                          ),
                          const SizedBox(height: 20),
                          secondaryText(text: 'Delhi'),
                          const SizedBox(height: 5),
                          secondaryText(text: 'Mumbai'),
                          const SizedBox(height: 5),
                          secondaryText(text: 'Cochin'),
                          const SizedBox(height: 5),
                          secondaryText(text: 'Bhubaneswar'),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Flexible(
                    child: Text('www.textelindia.com',
                        style: heading.copyWith(
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                        ),),
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                          InkWell(
                            onTap: (){
                              launchUrl(Uri(
                                scheme: 'tel',
                                path: '18008899824'
                              ));
                            },
                            child: RichText(text: TextSpan(
                              children: [
                                TextSpan(text: 'Toll free no:\n', style: body.copyWith(
                                  color: Colors.black,
                                )),
                                TextSpan(text: '1800 8899824', style: heading.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                )),
                              ]
                            )),
                          ),
                          InkWell(
                            onTap: (){
                              print('trying to launch mail');
                              launchUrl(Uri(
                                scheme: 'mailto',
                                path: 'info@textelindia.com',
                              ));
                            },
                            child: Text('info@textelindia.com',
                                style: heading.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                ),),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height:20),
              Row(
                  children: [
                    Text('©',
                      style: TextStyle(
                          color: color_white,
                          fontSize: 30
                      ),),
                    const SizedBox(width: 5,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('2022 Reserved',
                          style: heading.copyWith(
                              fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),),
                        Text('Textel',
                            style: heading.copyWith(
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                            ),),
                      ],
                    )
                  ]
              )
            ],
          ));
    }
  }
}

class FooterButton extends StatefulWidget {
  final String footerTitle;
  final dynamic route;

  const FooterButton({Key? key, required this.footerTitle, required this.route})
      : super(key: key);

  @override
  State<FooterButton> createState() => _FooterButtonState();
}

class _FooterButtonState extends State<FooterButton> {
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
          height: _underline ? 25 * 1.1 : 25,
          child: FittedBox(
            child: Text(
              widget.footerTitle,
              style: body.copyWith(
                fontSize: 35,
                letterSpacing: 1.1,
                color: Colors.black,
              ),
            ),
          ),
        ));
  }
}
