import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../utils/utils.dart';
import '../custom_drawer.dart';
import '../footer.dart';
import '../header.dart';

class ContactUsPc extends StatefulWidget {
  const ContactUsPc({Key? key,
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
  State<ContactUsPc> createState() => _ContactUsPcState();
}

class _ContactUsPcState extends State<ContactUsPc> {

  bool emailValid = false;
  bool phoneValid = false;

  bool _loading = false;

  void emailValidator(String text) {
    if (text.contains('@') && (text.contains('.com') || text.contains('.in'))) {
      setState(() {
        emailValid = true;
      });
    } else {
      setState(() {
        emailValid = false;
      });
    }
  }
  void phoneValidator(String text) {
    if (text.length == 10 && double.tryParse(text) != null) {
      setState(() {
        phoneValid = true;
      });
    } else {
      setState(() {
        phoneValid = false;
      });
    }
  }

  @override
  void initState(){
    super.initState();
    phoneValidator(widget.phoneController.text);
    emailValidator(widget.emailController.text);
    widget.phoneController.addListener(() {
      phoneValidator(widget.phoneController.text);
    });
    widget.emailController.addListener(() {
      emailValidator(widget.emailController.text);
    });
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
          height: size.height,
          width: size.width,
          child: ListView(
            children: [
              const Header(),
              Column(
                children: [
                  Center(
                    child: SizedBox(
                      height: 100,
                      child: FittedBox(
                        child: Text('Contact Us', style: heading.copyWith(
                        ),),
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  // Padding(
                  //   padding: EdgeInsets.symmetric(horizontal: size.width*0.1),
                  //   child: Text('Write to us', style: heading,),
                  // ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width*0.1),
                    child: Text('Please use the form below for enquiries you may have. Once you are done, please click the bottom below to submit the information.', style: body,),
                  ),

                  const SizedBox(height: 50),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width*0.1),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(text: 'Registered Office & Works:\n', style: heading),
                              TextSpan(text: 'Textel Tower, #D1 Square,\n3rd & 4th Floor, Patia\nBhubaneswar - 751024,\nEmail: info@textelindia.com\nToll Free: 1800 8899824', style: body),
                            ]
                          )
                        ),
                        SizedBox(width: size.width*0.03),
                        Flexible(
                          child: SizedBox(
                            width: size.width*0.6,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.grey[200],
                                  ),
                                  child: TextField(
                                    cursorColor: color_red,
                                    decoration: const InputDecoration(
                                        labelText: 'Name',
                                        border: InputBorder.none
                                    ),
                                    autocorrect: false,
                                    style: body.copyWith(fontSize: 20),
                                    controller: widget.nameController,
                                  ),
                                ),
                                const SizedBox(height: 30),

                                /// company name
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),

                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.grey[200],
                                  ),
                                  child: TextField(
                                    cursorColor: color_red,
                                    decoration: const InputDecoration(
                                        labelText: 'Company Name',
                                        border: InputBorder.none
                                    ),
                                    autocorrect: false,
                                    style: body.copyWith(fontSize: 20),
                                    controller: widget.companyNameController,
                                  ),
                                ),
                                const SizedBox(height: 30),

                                /// address
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),

                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.grey[200],
                                  ),
                                  child: TextField(
                                    cursorColor: color_red,
                                    decoration: const InputDecoration(
                                        labelText: 'Address',
                                        border: InputBorder.none
                                    ),
                                    maxLines: null,
                                    minLines: 3,
                                    keyboardType: TextInputType.multiline,
                                    autocorrect: false,
                                    style: body.copyWith(fontSize: 20),
                                    controller: widget.addressController,
                                  ),
                                ),
                                const SizedBox(height: 30),

                                /// country
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),

                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.grey[200],
                                  ),
                                  child: TextField(
                                    cursorColor: color_red,
                                    decoration: const InputDecoration(
                                        labelText: 'Country',
                                        border: InputBorder.none
                                    ),
                                    autocorrect: false,
                                    style: body.copyWith(fontSize: 20),
                                    controller: widget.countryController,
                                  ),
                                ),
                                const SizedBox(height: 30),

                                /// phone
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.grey[200],
                                  ),
                                  child: TextField(
                                    cursorColor: color_red,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      prefixText: '+91 ',
                                        suffixIcon: phoneValid
                                            ? const Icon(
                                            Icons.check_circle_outline_rounded,
                                            color: Colors.green)
                                            : Icon(Icons.error_outline,
                                            color: color_red),
                                        labelText: 'Phone',
                                        border: InputBorder.none
                                    ),
                                    autocorrect: false,
                                    style: body.copyWith(fontSize: 20),
                                    controller: widget.phoneController,
                                  ),
                                ),
                                const SizedBox(height: 30),

                                /// email
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.grey[200],
                                  ),
                                  child: TextField(
                                    cursorColor: color_red,
                                    decoration: InputDecoration(
                                        suffixIcon: emailValid
                                            ? const Icon(
                                            Icons.check_circle_outline_rounded,
                                            color: Colors.green)
                                            : Icon(Icons.error_outline,
                                            color: color_red),
                                        labelText: 'Email',
                                        border: InputBorder.none
                                    ),
                                    autocorrect: false,
                                    style: body.copyWith(fontSize: 20),
                                    controller: widget.emailController,
                                  ),
                                ),
                                const SizedBox(height: 30),

                                /// comments
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),

                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.grey[200],
                                  ),
                                  child: TextField(
                                    cursorColor: color_red,
                                    decoration: const InputDecoration(
                                        labelText: 'Comments',
                                        border: InputBorder.none,
                                    ),
                                    maxLines: null,
                                    minLines: 3,
                                    keyboardType: TextInputType.multiline,
                                    autocorrect: false,
                                    style: body.copyWith(fontSize: 20),
                                    controller: widget.commentsController,
                                  ),
                                ),
                                const SizedBox(height: 50),
                                MaterialButton(
                                  color: color_red,
                                  elevation: 0,
                                  padding: const EdgeInsets.fromLTRB(75, 0, 75, 0),
                                  hoverElevation: 5,
                                  height: 85,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(250)),
                                  child: _loading
                                    ? const CircularProgressIndicator(color: Colors.white)
                                  : Text('Submit', style: heading.copyWith(
                                      color: Colors.white,
                                      fontSize: 24
                                  )),
                                  onPressed: () async{
                                    if(
                                    widget.nameController.text != '' &&
                                     emailValid &&
                                     phoneValid &&
                                    widget.companyNameController.text != '' &&
                                    widget.addressController.text != '' &&
                                    widget.countryController.text != ''&&
                                    widget.commentsController.text != ''
                                    ){

                                      setState((){
                                        _loading = !_loading;
                                      });

                                      ///adding data to firestore
                                      try{
                                        await FirebaseFirestore.instance.collection('contact-us/').add(
                                            {
                                              'timestamp': FieldValue.serverTimestamp(),
                                              'name' : widget.nameController.text,
                                              'email' : widget.emailController.text,
                                              'phone' : int.parse(widget.phoneController.text),
                                              'company-name' : widget.companyNameController.text,
                                              'address' : widget.addressController.text,
                                              'country' : widget.countryController.text,
                                              'comments' : widget.commentsController.text,
                                            });
                                      } catch(e){
                                        print('firestore error');
                                      }

                                      Fluttertoast.showToast(
                                        msg:
                                        'Data Recorded successfully, we\'ll get back to you shortly.',
                                        webBgColor: '#616161',
                                        timeInSecForIosWeb: 3,
                                        toastLength: Toast.LENGTH_LONG,
                                      );

                                      setState((){
                                        _loading = !_loading;
                                      });
                                    }

                                    else{
                                      Fluttertoast.showToast(
                                        msg: 'Please fill all the fields',
                                        webBgColor: '#616161',
                                        timeInSecForIosWeb: 3,
                                        toastLength: Toast.LENGTH_LONG,
                                      );
                                    }
                                  },
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 75),
              const Footer(),
            ],
          )),
    );
  }
}

class ContactUsMobile extends StatefulWidget {
  const ContactUsMobile({Key? key,
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
  State<ContactUsMobile> createState() => _ContactUsMobileState();
}

class _ContactUsMobileState extends State<ContactUsMobile> {

  bool emailValid = false;
  bool phoneValid = false;

  bool _loading =false;

  void emailValidator(String text) {
    if (text.contains('@') && (text.contains('.com') || text.contains('.in'))) {
      setState(() {
        emailValid = true;
      });
    } else {
      setState(() {
        emailValid = false;
      });
    }
  }
  void phoneValidator(String text) {
    if (text.length == 10 && double.tryParse(text) != null) {
      setState(() {
        phoneValid = true;
      });
    } else {
      setState(() {
        phoneValid = false;
      });
    }
  }

  @override
  void initState(){
    super.initState();
    phoneValidator(widget.phoneController.text);
    emailValidator(widget.emailController.text);
    widget.phoneController.addListener(() {
      phoneValidator(widget.phoneController.text);
    });
    widget.emailController.addListener(() {
      emailValidator(widget.emailController.text);
    });
  }


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
              Center(
                child: SizedBox(
                  height: 100,
                  child: FittedBox(
                    child: Text('Contact Us', style: heading.copyWith(
                    ),),
                  ),
                ),
              ),
              const SizedBox(height: 50),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width*0.1),
                child: Text('Please use the form below for enquiries you may have. Once you are done, please click the bottom below to submit the information.', style: body,),
              ),

              const SizedBox(height: 50),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width*0.1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    RichText(
                        text: TextSpan(
                            children: [
                              TextSpan(text: 'Registered Office & Works:\n', style: heading),
                              TextSpan(text: 'Textel Tower, #D1 Square,\n3rd & 4th Floor, Patia\nBhubaneswar - 751024,\nEmail: info@textelindia.com\nToll Free: 1800 8899824', style: body),
                            ]
                        )
                    ),
                     const SizedBox(height: 35),
                    SizedBox(
                      width: size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.grey[200],
                            ),
                            child: TextField(
                              cursorColor: color_red,
                              decoration: const InputDecoration(
                                  labelText: 'Name',
                                  border: InputBorder.none
                              ),
                              autocorrect: false,
                              style: body.copyWith(fontSize: 20),
                              controller: widget.nameController,
                            ),
                          ),
                          const SizedBox(height: 30),

                          /// company name
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.grey[200],
                            ),
                            child: TextField(
                              cursorColor: color_red,
                              decoration: const InputDecoration(
                                  labelText: 'Company Name',
                                  border: InputBorder.none
                              ),
                              autocorrect: false,
                              style: body.copyWith(fontSize: 20),
                              controller: widget.companyNameController,
                            ),
                          ),
                          const SizedBox(height: 30),

                          /// address
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.grey[200],
                            ),
                            child: TextField(
                              cursorColor: color_red,
                              decoration: const InputDecoration(
                                  labelText: 'Address',
                                  border: InputBorder.none
                              ),
                              maxLines: null,
                              minLines: 3,
                              keyboardType: TextInputType.multiline,
                              autocorrect: false,
                              style: body.copyWith(fontSize: 20),
                              controller: widget.addressController,
                            ),
                          ),
                          const SizedBox(height: 30),

                          /// country
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.grey[200],
                            ),
                            child: TextField(
                              cursorColor: color_red,
                              decoration: const InputDecoration(
                                  labelText: 'Country',
                                  border: InputBorder.none
                              ),
                              autocorrect: false,
                              style: body.copyWith(fontSize: 20),
                              controller: widget.countryController,
                            ),
                          ),
                          const SizedBox(height: 30),

                          /// phone
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.grey[200],
                            ),
                            child: TextField(
                              cursorColor: color_red,
                              decoration: InputDecoration(
                                  prefixText: '+91 ',
                                  suffixIcon: phoneValid
                                      ? const Icon(
                                      Icons.check_circle_outline_rounded,
                                      color: Colors.green)
                                      : Icon(Icons.error_outline,
                                      color: color_red),
                                  labelText: 'Phone',
                                  border: InputBorder.none
                              ),
                              autocorrect: false,
                              style: body.copyWith(fontSize: 20),
                              controller: widget.phoneController,
                            ),
                          ),
                          const SizedBox(height: 30),

                          /// email
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.grey[200],
                            ),
                            child: TextField(
                              cursorColor: color_red,
                              decoration: InputDecoration(
                                  suffixIcon: emailValid
                                      ? const Icon(
                                      Icons.check_circle_outline_rounded,
                                      color: Colors.green)
                                      : Icon(Icons.error_outline,
                                      color: color_red),
                                  labelText: 'Email',
                                  border: InputBorder.none
                              ),
                              autocorrect: false,
                              style: body.copyWith(fontSize: 20),
                              controller: widget.emailController,
                            ),
                          ),
                          const SizedBox(height: 30),

                          /// comments
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.grey[200],
                            ),
                            child: TextField(
                              cursorColor: color_red,
                              decoration: const InputDecoration(
                                labelText: 'Comments',
                                border: InputBorder.none,
                              ),
                              maxLines: null,
                              minLines: 3,
                              keyboardType: TextInputType.multiline,
                              autocorrect: false,
                              style: body.copyWith(fontSize: 20),
                              controller: widget.commentsController,
                            ),
                          ),
                          const SizedBox(height: 50),
                          MaterialButton(
                            color: color_red,
                            elevation: 0,
                            padding: const EdgeInsets.fromLTRB(75, 0, 75, 0),
                            hoverElevation: 5,
                            height: 85,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(250)),
                            child: _loading
                                ? const CircularProgressIndicator(color: Colors.white)
                                : Text('Submit', style: heading.copyWith(
                                color: Colors.white,
                                fontSize: 24
                            )),
                            onPressed: () async{
                              if(
                              widget.nameController.text != '' &&
                                  emailValid &&
                                  phoneValid &&
                                  widget.companyNameController.text != '' &&
                                  widget.addressController.text != '' &&
                                  widget.countryController.text != ''&&
                                  widget.commentsController.text != ''
                              ){

                                setState((){
                                  _loading = !_loading;
                                });

                                ///adding data to firestore
                                try{
                                  await FirebaseFirestore.instance.collection('contact-us/').add(
                                      {
                                        'timestamp': FieldValue.serverTimestamp(),
                                        'name' : widget.nameController.text,
                                        'email' : widget.emailController.text,
                                        'phone' : int.parse(widget.phoneController.text),
                                        'company-name' : widget.companyNameController.text,
                                        'address' : widget.addressController.text,
                                        'country' : widget.countryController.text,
                                        'comments' : widget.commentsController.text,
                                      });
                                } catch(e){
                                  print('firestore error');
                                }

                                Fluttertoast.showToast(
                                  msg:
                                  'Data Recorded successfully, we\'ll get back to you shortly.',
                                  webBgColor: '#616161',
                                  timeInSecForIosWeb: 3,
                                  toastLength: Toast.LENGTH_LONG,
                                );

                                setState((){
                                  _loading = !_loading;
                                });
                              }

                              else{
                                Fluttertoast.showToast(
                                  msg: 'Please fill all the fields',
                                  webBgColor: '#616161',
                                  timeInSecForIosWeb: 3,
                                  toastLength: Toast.LENGTH_LONG,
                                );
                              }
                            },
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 75),
              const Footer(),
            ],
          )),
    );
  }
}

