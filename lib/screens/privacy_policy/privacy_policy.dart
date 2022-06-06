import 'package:flutter/material.dart';
import '../../utils/utils.dart';
import '../custom_drawer.dart';
import '../footer.dart';
import '../header.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      endDrawer: CustomDrawer(width: size.width*drawerMultiplier, height: size.height,),
      body: SizedBox(
          height: size.height,
          width: size.width,
          child: ListView(
            children: [
              const Header(),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: size.width*0.08),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(
                      child: Text('Privacy Policy', style: heading.copyWith(
                        fontSize: 45
                      ),),
                    ),
                    const SizedBox(height: 75,),
                    Text('This Privacy Policy applies to the textel.in', style: heading.copyWith(
                      fontSize: 30
                    ),),
                    const SizedBox(height: 15,),
                    RichText(text: TextSpan(
                      children: [
                        TextSpan(text: 'textel.in recognises the importance of maintaining your privacy. We value your privacy and appreciate your trust in us. This Policy describes how we treat user information we collect on', style: body),
                        TextSpan(text: ' http://www.textel.in', style: body.copyWith(
                          fontWeight: FontWeight.w700,
                        )),
                        TextSpan(text: ' and other offline sources. This Privacy Policy applies to current and former visitors to our website and to our online customers. By visiting and/or using our website, you agree to this Privacy Policy.', style: body),

                      ]
                    )),
                    const SizedBox(height: 15,),
                    RichText(text: TextSpan(
                      children: [
                        TextSpan(text: 'textel.in is a property of Textel Technologies Private Limited, an Indian Company registered under the Companies Act, 2013 having its registered office at', style: body),
                        TextSpan(text: ' Textel Towers, #D1 Square, 3rd & 4th Floor, Patia, Bhubaneswar, Odisha 751024.', style: body.copyWith(
                            fontWeight: FontWeight.w700
                        )),
                      ]
                    )),
                    const SizedBox(height: 50,),
                    Text('Information we collect',style: heading.copyWith(
                        fontSize: 30
                    )),
                    const SizedBox(height: 15),
                    RichText(text: TextSpan(
                      children: [
                        TextSpan(text: 'Contact information:' ,style: body.copyWith(
                          fontWeight: FontWeight.w700
                        )),
                        TextSpan(text: ' We might collect your Name, Email, Mobile Number, Phone Number, city, state, pin code,  country and IP address.', style: body)
                      ]
                    )),
                    const SizedBox(height: 15),
                    RichText(text: TextSpan(
                        children: [
                          TextSpan(text: 'Demographic information:' ,style: body.copyWith(
                              fontWeight: FontWeight.w700
                          )),
                          TextSpan(text: ' We may collect demographic information about you, provided by your during the use of our website. We might collect this as a part of a survey also.', style: body)
                        ]
                    )),
                    const SizedBox(height: 15),
                    RichText(text: TextSpan(
                        children: [
                          TextSpan(text: 'Other information:' ,style: body.copyWith(
                              fontWeight: FontWeight.w700
                          )),
                          TextSpan(text: ' If you use our website, we may collect information about your IP address and the browser you\'re using. We might look at what site you came from, duration of time spent on our website, pages accessed or what site you visit when you leave us. We might also collect the type of mobile device you are using, or the version of the operating system your computer or device is running.', style: body)
                        ]
                    )),



                    /// We collect information in different ways
                    const SizedBox(height: 50,),
                    Text('We collect information in different ways.',style: heading.copyWith(
                        fontSize: 30
                    )),
                    const SizedBox(height: 15),
                    RichText(text: TextSpan(
                        children: [
                          TextSpan(text: 'We collect information directly from you:' ,style: body.copyWith(
                              fontWeight: FontWeight.w700
                          )),
                          TextSpan(text: ' We collect information directly from you when you download our product brochure. No other data is recorded and/or collected.', style: body)
                        ]
                    )),
                    const SizedBox(height: 15),
                    RichText(text: TextSpan(
                        children: [
                          TextSpan(text: 'We collect information from you passively:' ,style: body.copyWith(
                              fontWeight: FontWeight.w700
                          )),
                          TextSpan(text: ' We use tracking tools like Google Analytics, Google Webmaster, browser cookies and web beacons for collecting information about your usage of our website.', style: body)
                        ]
                    )),



                    /// Use of your personal information
                    const SizedBox(height: 50,),
                    Text('Use of your personal information.',style: heading.copyWith(
                        fontSize: 30
                    )),
                    const SizedBox(height: 15),
                    RichText(text: TextSpan(
                        children: [
                          TextSpan(text: 'We use information to contact you:' ,style: body.copyWith(
                              fontWeight: FontWeight.w700
                          )),
                          TextSpan(text: ' We might use the information you provide to contact you for confirmation of a purchase on our website or for other promotional purposes.', style: body)
                        ]
                    )),
                    const SizedBox(height: 15),
                    RichText(text: TextSpan(
                        children: [
                          TextSpan(text: 'We use information to respond to your requests or questions:' ,style: body.copyWith(
                              fontWeight: FontWeight.w700
                          )),
                          TextSpan(text: ' We might use your information to confirm your registration for an event or contest.', style: body)
                        ]
                    )),
                    const SizedBox(height: 15),
                    RichText(text: TextSpan(
                        children: [
                          TextSpan(text: 'We use information to improve our products and services:' ,style: body.copyWith(
                              fontWeight: FontWeight.w700
                          )),
                          TextSpan(text: ' We might use your information to customize your experience with us. This could include displaying content based upon your preferences.', style: body)
                        ]
                    )),
                    const SizedBox(height: 15),
                    RichText(text: TextSpan(
                        children: [
                          TextSpan(text: 'We use information to look at site trends and customer interests:' ,style: body.copyWith(
                              fontWeight: FontWeight.w700
                          )),
                          TextSpan(text: ' We may use your information to make our website and products better. We may combine information we get from you with information about you we get from third parties.', style: body)
                        ]
                    )),
                    const SizedBox(height: 15),
                    RichText(text: TextSpan(
                        children: [
                          TextSpan(text: 'We use information for security purposes:',style: body.copyWith(
                              fontWeight: FontWeight.w700
                          )),
                          TextSpan(text: ' We may use information to protect our company, our customers, or our websites.', style: body)
                        ]
                    )),
                    const SizedBox(height: 15),
                    RichText(text: TextSpan(
                        children: [
                          TextSpan(text: 'We use information for marketing purposes:',style: body.copyWith(
                              fontWeight: FontWeight.w700
                          )),
                          TextSpan(text: ' We might send you information about special promotions or offers. We might also tell you about new features or products. These might be our own offers or products, or third-party offers or products we think you might find interesting.', style: body)
                        ]
                    )),
                    const SizedBox(height: 15),
                    Text('We use information as otherwise permitted by law.', style: body,),



                    /// Email Opt-Out
                    const SizedBox(height: 50,),
                    Text('Email Opt-Out.',style: heading.copyWith(
                        fontSize: 30
                    )),
                    const SizedBox(height: 15),
                    RichText(text: TextSpan(
                        children: [
                          TextSpan(text: 'You can opt out of receiving our marketing emails:',style: body.copyWith(
                              fontWeight: FontWeight.w700
                          )),
                          TextSpan(text: ' To stop receiving our promotional emails, please email at info@textelindia.com. It may take about ten days to process your request. Even if you opt out of getting marketing messages, we will still be sending you transactional messages through email and SMS about your purchases. ', style: body)
                        ]
                    )),



                    /// Third party sites
                    const SizedBox(height: 50,),
                    Text('Third party sites.',style: heading.copyWith(
                        fontSize: 30
                    )),
                    const SizedBox(height: 15),
                    RichText(text: TextSpan(
                        children: [
                          TextSpan(text: 'If you click on one of the links to third party websites, you may be taken to websites we do not control. This policy does not apply to the privacy practices of those websites. Read the privacy policy of other websites carefully. We are not responsible for these third-party sites you visit through us.', style: body)
                        ]
                    )),




                    /// Updates to this policy
                    const SizedBox(height: 50,),
                    Text('Updates to this policy.',style: heading.copyWith(
                        fontSize: 30
                    )),
                    const SizedBox(height: 15),
                    RichText(text: TextSpan(
                        children: [
                          TextSpan(text: 'This Privacy Policy was last updated on 28.06.2022. From time to time we may change our privacy practices. We will notify you of any material changes to this policy as required by law. We will also post an updated copy on our website. Please check our site periodically for updates.', style: body)
                        ]
                    )),




                    /// Jurisdiction
                    const SizedBox(height: 50,),
                    Text('Jurisdiction.',style: heading.copyWith(
                        fontSize: 30
                    )),
                    const SizedBox(height: 15),
                    RichText(text: TextSpan(
                        children: [
                          TextSpan(text: 'If you choose to visit the website, your visit and any dispute over privacy is subject to this Policy and the website\'s terms of use. In addition to the foregoing, any disputes arising under this Policy shall be governed by the laws of India.', style: body)
                        ]
                    )),





                    const SizedBox(height: 15,),const SizedBox(height: 15,),const SizedBox(height: 15,),const SizedBox(height: 15,),


                  ],
                ),
              ),
              const Footer(),
            ],
          )),
    );
  }
}
