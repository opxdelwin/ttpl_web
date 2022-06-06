import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ttpl_website/utils/utils.dart';

import '../custom_drawer.dart';
import '../footer.dart';
import '../header.dart';

class CareersPC extends StatefulWidget {
  const CareersPC({
    Key? key,
    required this.nameController,
    required this.emailController,
    required this.phoneController,
  }) : super(key: key);

  final TextEditingController nameController;
  final TextEditingController phoneController;
  final TextEditingController emailController;

  @override
  State<CareersPC> createState() => _CareersPCState();
}

class _CareersPCState extends State<CareersPC> {
  String? resumeName;
  Uint8List? resumeFileBytes;
  FilePickerResult? capturedFile;
  int currentExperienceValue = 0;
  String currentPostValue = '';
  String? resumeDownloadLink;
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
  void initState() {
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
                        child: Text(
                          'Careers',
                          style: heading.copyWith(),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
                    child: Text(
                      'Textel offers its people freedom its work, unmatched leadership & the opportunity to grow at a rapid pace. It provides them with challenging, interesting & motivating assignments which bring a sense of professional fulfillment. The company encourages entrepreneurial skills thus enabling and empowering employees to take appropriate risks. Employee participation is encouraged by inviting suggestions & opinions which is coupled with competitive compensation & rewards.',
                      style: body,
                    ),
                  ),
                  const SizedBox(height: 50),
                  Container(
                    width: size.width * 0.6,
                    padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
                    child: Column(
                      children: [
                        const SizedBox(height: 30),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey[200],
                          ),
                          child: TextField(
                            cursorColor: color_red,
                            decoration: const InputDecoration(
                                labelText: 'Name', border: InputBorder.none),
                            autocorrect: false,
                            style: body.copyWith(fontSize: 20),
                            controller: widget.nameController,
                          ),
                        ),
                        const SizedBox(height: 30),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 4),
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
                                border: InputBorder.none),
                            autocorrect: false,
                            style: body.copyWith(fontSize: 20),
                            controller: widget.emailController,
                          ),
                        ),
                        const SizedBox(height: 30),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 4),
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
                                border: InputBorder.none),
                            autocorrect: false,
                            style: body.copyWith(fontSize: 20),
                            controller: widget.phoneController,
                          ),
                        ),

                        const SizedBox(height: 30),
                        Container(
                            // height: 75,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.grey[200],
                            ),
                            child:
                            DropdownButtonFormField<String>(
                              onChanged: (String? newItem) {
                                setState(() {
                                  currentPostValue = newItem!;
                                });
                              },
                              decoration: const InputDecoration(
                                hintText: 'Post Applied For',
                                contentPadding: EdgeInsets.all(16),
                                border: InputBorder.none,
                              ),
                              items: const [
                                DropdownMenuItem(
                                    value: 'Sales Dept.',
                                    child: Text('Sales Dept.')),
                                DropdownMenuItem(
                                    value: 'Marketing Dept.',
                                    child: Text('Marketing Dept.')),
                                DropdownMenuItem(
                                    value: 'Business Development Dept.',
                                    child: Text('Business Development Dept.')),
                                DropdownMenuItem(
                                    value: 'Admin Dept.',
                                    child: Text('Admin Dept.')),
                                DropdownMenuItem(
                                    value: 'Accounts Dept.',
                                    child: Text('Accounts Dept.')),
                                DropdownMenuItem(
                                    value: 'Customer Care Dept.',
                                    child: Text('Customer Care Dept.')),
                                DropdownMenuItem(
                                    value: 'Back Office Dept.',
                                    child: Text('Back Office Dept.')),
                                DropdownMenuItem(
                                    value: 'Support Dept.',
                                    child: Text('Support Dept.')),
                                DropdownMenuItem(
                                    value: 'Technical Dept.',
                                    child: Text('Technical Dept.')),
                                DropdownMenuItem(
                                    value: 'Human Resource Dept.',
                                    child: Text('Human Resource Dept.')),
                                DropdownMenuItem(
                                    value: 'Other Dept.',
                                    child: Text('Other Dept.')),
                              ],
                            )),

                        ///Experience Dropdown
                        const SizedBox(height: 30),
                        Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.grey[200],
                            ),
                            child: DropdownButtonFormField<int>(
                              onChanged: (int? newItem) {
                                setState(() {
                                  currentExperienceValue = newItem!;
                                });
                              },
                              decoration: const InputDecoration(
                                hintText: 'Experience',
                                contentPadding: EdgeInsets.all(16),
                                border: InputBorder.none,
                              ),
                              items: const [
                                DropdownMenuItem(
                                    value: 1, child: Text('1 year')),
                                DropdownMenuItem(
                                    value: 2, child: Text('2 years')),
                                DropdownMenuItem(
                                    value: 3, child: Text('3 years')),
                                DropdownMenuItem(
                                    value: 4, child: Text('4 years')),
                                DropdownMenuItem(
                                    value: 5, child: Text('5 years')),
                                DropdownMenuItem(
                                    value: 6, child: Text('More than 5 years')),
                              ],
                            )),

                        ///file handle for resume
                        const SizedBox(height: 30),
                        Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.grey[200],
                            ),
                            child: Row(
                              mainAxisAlignment: capturedFile == null ? MainAxisAlignment.center : MainAxisAlignment.spaceBetween,
                              children: [
                                capturedFile != null
                                ?Text(resumeName!)
                                :ElevatedButton(
                                  child: Text(
                                      'Click here to attach resume (PDF only)', style:body.copyWith(
                                      color: Colors.black87,
                                    fontSize: 19
                                  ),),
                                  style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all(Colors.transparent),
                                      shadowColor: MaterialStateProperty.all(Colors.transparent),
                                  ),
                                  onPressed: () async {
                                    capturedFile = await FilePicker.platform
                                        .pickFiles(
                                            type: FileType.custom,
                                            allowedExtensions: ['pdf']);

                                    if (capturedFile != null) {
                                      setState(() {
                                        resumeName =
                                            capturedFile?.files.first.name;
                                      });
                                      resumeFileBytes =
                                          capturedFile?.files.first.bytes;
                                    }
                                  },
                                ),
                                capturedFile == null
                                    ? Container()
                                    : IconButton(
                                        onPressed: () {
                                          setState(() {
                                            capturedFile = null;
                                          });
                                        },
                                        icon: const Icon(Icons.close))
                              ],
                            )),
                      ],
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
                      ? const CircularProgressIndicator(
                      color: Colors.white,
                    )
                    : Text('Submit',
                        style: heading.copyWith(
                            color: Colors.white, fontSize: 24)),
                    onPressed: () async{
                      if(
                      widget.nameController.text != '' &&
                      emailValid &&
                      phoneValid &&
                      currentPostValue != ''&&
                      currentExperienceValue != 0 &&
                      capturedFile != null
                      ){

                        setState((){
                          _loading = !_loading;
                        });
                        
                        ///uploading resume
                        try{
                          await FirebaseStorage.instance
                              .ref('resume/$resumeName')
                              .putData(resumeFileBytes!);
                        } catch(e){
                          print('firebase storage error');
                        }

                          /// download link
                          try{
                            resumeDownloadLink = await FirebaseStorage.instance
                                .ref('resume/$resumeName').getDownloadURL();
                          } catch(e){
                            print('error in getting download link');
                          }

                          ///adding data to firestore
                          try{
                            await FirebaseFirestore.instance.collection('careers/').add(
                                {
                                  'timestamp': FieldValue.serverTimestamp(),
                                  'name' : widget.nameController.text,
                                  'email' : widget.emailController.text,
                                  'phone' : int.parse(widget.phoneController.text),
                                  'post-applied' : currentPostValue,
                                  'experience' : '$currentExperienceValue years',
                                  'resume' : resumeDownloadLink,
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
              const SizedBox(height: 75),
              const Footer(),
            ],
          )),
    );
  }
}

class CareersMobile extends StatefulWidget {
  const CareersMobile(
      {Key? key,
      required this.nameController,
      required this.emailController,
      required this.phoneController})
      : super(key: key);
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;

  @override
  State<CareersMobile> createState() => _CareersMobileState();
}

class _CareersMobileState extends State<CareersMobile> {
  String? resumeName;
  Uint8List? resumeFileBytes;
  FilePickerResult? capturedFile;
  bool _phoneValid = false;
  bool _emailValid = false;
  String currentPostValue = '';
  int currentExperienceValue = 0;
  bool _loading = false;
  String? resumeDownloadLink;

  void emailValidator(String text) {
    if (text.contains('@') && (text.contains('.com') || text.contains('.in'))) {
      setState(() {
        _emailValid = true;
      });
    } else {
      setState(() {
        _emailValid = false;
      });
    }
  }

  void phoneValidator(String text) {
    if (text.length == 10 && double.tryParse(text) != null) {
      setState(() {
        _phoneValid = true;
      });
    } else {
      setState(() {
        _phoneValid = false;
      });
    }
  }

  @override
  void initState() {
    phoneValidator(widget.phoneController.text);
    emailValidator(widget.emailController.text);

    widget.phoneController.addListener(() {
      phoneValidator(widget.phoneController.text);
    });
    widget.emailController.addListener(() {
      emailValidator(widget.emailController.text);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      endDrawer: CustomDrawer(
        width: size.width * drawerMultiplier,
        height: size.height,
      ),
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
                      height: 75,
                      child: FittedBox(
                        child: Text(
                          'Careers',
                          style: heading.copyWith(),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
                    child: Text(
                      'Textel offers its people freedom its work, unmatched leadership & the opportunity to grow at a rapid pace. It provides them with challenging, interesting & motivating assignments which bring a sense of professional fulfillment. The company encourages entrepreneurial skills thus enabling and empowering employees to take appropriate risks. Employee participation is encouraged by inviting suggestions & opinions which is coupled with competitive compensation & rewards.',
                      style: body,
                    ),
                  ),
                  const SizedBox(height: 25),
                  Container(
                    width: size.width,
                    padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
                    child: Column(
                      children: [
                        const SizedBox(height: 30),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey[200],
                          ),
                          child: TextField(
                            cursorColor: color_red,
                            decoration: const InputDecoration(
                                labelText: 'Name', border: InputBorder.none),
                            autocorrect: false,
                            style: body.copyWith(fontSize: 20),
                            controller: widget.nameController,
                          ),
                        ),
                        const SizedBox(height: 30),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey[200],
                          ),
                          child: TextField(
                            cursorColor: color_red,
                            decoration: InputDecoration(
                                suffixIcon: _emailValid
                                    ? const Icon(
                                        Icons.check_circle_outline_rounded,
                                        color: Colors.green)
                                    : Icon(Icons.error_outline,
                                        color: color_red),
                                labelText: 'Email',
                                border: InputBorder.none),
                            autocorrect: false,
                            style: body.copyWith(fontSize: 20),
                            controller: widget.emailController,
                          ),
                        ),
                        const SizedBox(height: 30),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey[200],
                          ),
                          child: TextField(
                            cursorColor: color_red,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              prefixText: '+91 ',
                                suffixIcon: _phoneValid
                                    ? const Icon(
                                        Icons.check_circle_outline_rounded,
                                        color: Colors.green)
                                    : Icon(Icons.error_outline,
                                        color: color_red),
                                labelText: 'Phone',
                                border: InputBorder.none),
                            autocorrect: false,
                            style: body.copyWith(fontSize: 20),
                            controller: widget.phoneController,
                          ),
                        ),

                        const SizedBox(height: 30),
                        Container(
                            // width:
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.grey[200],
                            ),
                            child: DropdownButtonFormField<String>(
                              onChanged: (String? newItem) {
                                setState(() {
                                  currentPostValue = newItem!;
                                });
                              },
                              decoration: const InputDecoration(
                                hintText: 'Post Applied For',
                                contentPadding: EdgeInsets.all(16),
                                border: InputBorder.none,
                              ),
                              items: const [
                                DropdownMenuItem(
                                    value: 'Sales Dept.',
                                    child: Text('Sales Dept.')),
                                DropdownMenuItem(
                                    value: 'Marketing Dept.',
                                    child: Text('Marketing Dept.')),
                                DropdownMenuItem(
                                    value: 'Business Development Dept.',
                                    child: Text('Business Development Dept.')),
                                DropdownMenuItem(
                                    value: 'Admin Dept.',
                                    child: Text('Admin Dept.')),
                                DropdownMenuItem(
                                    value: 'Accounts Dept.',
                                    child: Text('Accounts Dept.')),
                                DropdownMenuItem(
                                    value: 'Customer Care Dept.',
                                    child: Text('Customer Care Dept.')),
                                DropdownMenuItem(
                                    value: 'Back Office Dept.',
                                    child: Text('Back Office Dept.')),
                                DropdownMenuItem(
                                    value: 'Support Dept.',
                                    child: Text('Support Dept.')),
                                DropdownMenuItem(
                                    value: 'Technical Dept.',
                                    child: Text('Technical Dept.')),
                                DropdownMenuItem(
                                    value: 'Human Resource Dept.',
                                    child: Text('Human Resource Dept.')),
                                DropdownMenuItem(
                                    value: 'Other Dept.',
                                    child: Text('Other Dept.')),
                              ],
                            )),

                        ///Experience Dropdown
                        const SizedBox(height: 30),
                        Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.grey[200],
                            ),
                            child: DropdownButtonFormField<int>(
                              onChanged: (int? newItem) {
                                setState(() {
                                  currentExperienceValue = newItem!;
                                });
                              },
                              decoration: const InputDecoration(
                                hintText: 'Experience',
                                contentPadding: EdgeInsets.all(16),
                                border: InputBorder.none,
                              ),
                              items: const [
                                DropdownMenuItem(
                                    value: 1, child: Text('1 year')),
                                DropdownMenuItem(
                                    value: 2, child: Text('2 years')),
                                DropdownMenuItem(
                                    value: 3, child: Text('3 years')),
                                DropdownMenuItem(
                                    value: 4, child: Text('4 years')),
                                DropdownMenuItem(
                                    value: 5, child: Text('5 years')),
                                DropdownMenuItem(
                                    value: 6, child: Text('More than 5 years')),
                              ],
                            )),


                        ///file handle for resume
                        const SizedBox(height: 30,),
                        Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.grey[200],
                            ),
                            child: Row(
                              mainAxisAlignment: capturedFile == null ? MainAxisAlignment.center : MainAxisAlignment.spaceBetween,
                              children: [
                                capturedFile != null
                                    ?Text(resumeName!)
                                    :ElevatedButton(
                                  child: Text(
                                    'Click here to attach resume (PDF only)', style:body.copyWith(
                                      color: Colors.black87,
                                      fontSize: 19
                                  ),),
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(Colors.transparent),
                                    shadowColor: MaterialStateProperty.all(Colors.transparent),
                                  ),
                                  onPressed: () async {
                                    capturedFile = await FilePicker.platform
                                        .pickFiles(
                                        type: FileType.custom,
                                        allowedExtensions: ['pdf']);

                                    if (capturedFile != null) {
                                      setState(() {
                                        resumeName =
                                            capturedFile?.files.first.name;
                                      });
                                      resumeFileBytes =
                                          capturedFile?.files.first.bytes;
                                    }
                                  },
                                ),
                                capturedFile == null
                                    ? Container()
                                    : IconButton(
                                    onPressed: () {
                                      setState(() {
                                        capturedFile = null;
                                      });
                                    },
                                    icon: const Icon(Icons.close))
                              ],
                            )),
                      ],
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
                    :  Text('Submit',
                        style: heading.copyWith(
                            color: Colors.white, fontSize: 24)),
                    onPressed: () async{
                      if(
                      widget.nameController.text != '' &&
                          _emailValid &&
                          _phoneValid &&
                          currentPostValue != ''&&
                          currentExperienceValue != 0 &&
                          capturedFile != null
                      ){

                        setState((){
                          _loading = !_loading;
                        });

                        ///uploading resume
                          await FirebaseStorage.instance
                              .ref('resume/$resumeName')
                              .putData(resumeFileBytes!);

                        /// download link

                          resumeDownloadLink = await FirebaseStorage.instance
                              .ref('resume/$resumeName').getDownloadURL();


                        ///adding data to firestore
                        try{
                          await FirebaseFirestore.instance.collection('careers/').add(
                              {
                                'timestamp': FieldValue.serverTimestamp(),
                                'name' : widget.nameController.text,
                                'email' : widget.emailController.text,
                                'phone' : int.parse(widget.phoneController.text),
                                'post-applied' : currentPostValue,
                                'experience' : '$currentExperienceValue years',
                                'resume' : resumeDownloadLink,
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
              const SizedBox(height: 50),
              const Footer(),
            ],
          )),
    );
  }
}
