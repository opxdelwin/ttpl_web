import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ttpl_website/screens/footer.dart';
import 'package:ttpl_website/screens/header.dart';
import 'package:ttpl_website/utils/firebase.dart';
import 'package:ttpl_website/utils/utils.dart';
import '../custom_drawer.dart';
import 'dart:html' as html;

double height = 0;
double width = 0;

bool emailValid = false;
bool phoneValid = false;

class BrochurePC extends StatefulWidget {
  const BrochurePC(
      {Key? key, required this.emailController, required this.phoneController})
      : super(key: key);

  final TextEditingController emailController;
  final TextEditingController phoneController;

  @override
  State<BrochurePC> createState() => _BrochurePCState();
}

class _BrochurePCState extends State<BrochurePC> {
  bool isLoading = false;

  @override
  void initState() {
    widget.emailController.addListener(() {
      emailValidator(widget.emailController.text);
    });
    widget.phoneController.addListener(() {
      phoneValidator(widget.phoneController.text);
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

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
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
        endDrawer: CustomDrawer(
          width: width * drawerMultiplier,
          height: height,
        ),
        body: SizedBox(
            height: height,
            width: width,
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                const Header(),
                Container(
                    height: height * 0.80,
                    padding: EdgeInsets.symmetric(horizontal: width * 0.12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Brochure',
                          style: heading.copyWith(
                              fontSize: 45, letterSpacing: 0.08),
                        ),
                        Flexible(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.grey[200],
                            ),
                            width: 500,
                            padding: const EdgeInsets.all(10),
                            child: TextField(
                              cursorColor: color_red,
                              decoration: InputDecoration(
                                  labelText: 'Email',
                                  prefixIcon: const Icon(
                                      Icons.mail_outline_rounded,
                                      color: Colors.black),
                                  border: InputBorder.none,
                                  suffixIcon: emailValid
                                      ? const Icon(
                                          Icons.check_circle_outline_rounded,
                                          color: Colors.green)
                                      : Icon(Icons.error_outline,
                                          color: color_red)),
                              enabled: true,
                              autocorrect: false,
                              style: body.copyWith(fontSize: 20),
                              controller: widget.emailController,
                            ),
                          ),
                        ),
                        Flexible(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.grey[200],
                            ),
                            width: 500,
                            padding: const EdgeInsets.all(10),
                            child: TextField(
                              cursorColor: color_red,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  labelText: 'Phone',
                                  prefixText: '+91 ',
                                  prefixIcon: const Icon(
                                      Icons.phone_in_talk_rounded,
                                      color: Colors.black),
                                  border: InputBorder.none,
                                  suffixIcon: phoneValid
                                      ? const Icon(
                                          Icons.check_circle_outline_rounded,
                                          color: Colors.green)
                                      : Icon(Icons.error_outline,
                                          color: color_red)),
                              enabled: true,
                              autocorrect: false,
                              style: body.copyWith(fontSize: 20),
                              controller: widget.phoneController,
                            ),
                          ),
                        ),
                        MaterialButton(
                            color: color_red,
                            elevation: 0,
                            padding: const EdgeInsets.fromLTRB(75, 0, 75, 0),
                            hoverElevation: 5,
                            height: 85,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(250)),
                            child: isLoading
                                ? const CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                : Text(
                                    'Get Brochure',
                                    style: body.copyWith(
                                        fontSize: 25,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w300),
                                  ),
                            onPressed: () async {
                              try {
                                if (emailValid && phoneValid) {

                                  html.WindowBase tab = html.window.open('', "_blank");

                                  setState(() {
                                    isLoading = true;
                                  });

                                  ///adding data to db
                                  await FirebaseFirestore.instance
                                      .collection('brochure/')
                                      .add({
                                    "timestamp": FieldValue.serverTimestamp(),
                                    'email': widget.emailController.text,
                                    'phone':
                                        int.parse(widget.phoneController.text),
                                  });

                                  ///getting download link
                                  String url = await FirebaseMethods()
                                      .getDownloadLink(
                                          '/brochure/Delwin Mathew Resume.pdf');

                                  setState(() {
                                    isLoading = false;
                                    tab.location.href = url;
                                  });


                                } else {
                                  Fluttertoast.showToast(
                                    msg: 'Please check email / phone number.',
                                    webBgColor: '#616161',
                                    timeInSecForIosWeb: 2,
                                    toastLength: Toast.LENGTH_LONG,
                                  );
                                }
                              } catch (e) {
                                Fluttertoast.showToast(
                                  msg: 'Some error occurred',
                                  webBgColor: '#616161',
                                  timeInSecForIosWeb: 2,
                                  toastLength: Toast.LENGTH_LONG,
                                );
                                if (kDebugMode) {
                                  print(e.toString());
                                }
                              }
                            }),
                        const SizedBox(height: 25)
                      ],
                    )),
                const Footer(),
              ],
            )));
  }
}

class BrochureMobile extends StatefulWidget {
  const BrochureMobile(
      {Key? key, required this.emailController, required this.phoneController})
      : super(key: key);

  final TextEditingController emailController;
  final TextEditingController phoneController;

  @override
  State<BrochureMobile> createState() => _BrochureMobileState();
}

class _BrochureMobileState extends State<BrochureMobile> {
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    widget.emailController.addListener(() {
      emailValidator(widget.emailController.text);
    });
    widget.phoneController.addListener(() {
      phoneValidator(widget.phoneController.text);
    });
  }

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
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;


    return Scaffold(
        endDrawer:
            CustomDrawer(width: width * drawerMultiplier, height: height),
        body: SizedBox(
          height: height,
          width: width,
          child: ListView(
            children: [
              const Header(),
              Container(
                  height: height * 0.80,
                  padding: EdgeInsets.symmetric(horizontal: width * 0.12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Brochure',
                        style:
                            heading.copyWith(fontSize: 40, letterSpacing: 0.08),
                      ),
                      Flexible(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey[200],
                          ),
                          width: 500,
                          padding: const EdgeInsets.all(10),
                          child: TextField(
                            cursorColor: color_red,
                            decoration: InputDecoration(
                                labelText: 'Email',
                                prefixIcon: const Icon(
                                    Icons.mail_outline_rounded,
                                    color: Colors.black),
                                border: InputBorder.none,
                                suffixIcon: emailValid
                                    ? const Icon(
                                        Icons.check_circle_outline_rounded,
                                        color: Colors.green)
                                    : Icon(Icons.error_outline,
                                        color: color_red)),
                            enabled: true,
                            autocorrect: false,
                            style: body.copyWith(fontSize: 20),
                            controller: widget.emailController,
                          ),
                        ),
                      ),
                      Flexible(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey[200],
                          ),
                          width: 500,
                          padding: const EdgeInsets.all(10),
                          child: TextField(
                            cursorColor: color_red,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                labelText: 'Phone',
                                prefixText: '+91 ',
                                prefixIcon: const Icon(
                                    Icons.phone_in_talk_rounded,
                                    color: Colors.black),
                                border: InputBorder.none,
                                suffixIcon: phoneValid
                                    ? const Icon(
                                        Icons.check_circle_outline_rounded,
                                        color: Colors.green)
                                    : Icon(Icons.error_outline,
                                        color: color_red)),
                            enabled: true,
                            autocorrect: false,
                            style: body.copyWith(fontSize: 20),
                            controller: widget.phoneController,
                          ),
                        ),
                      ),
                      MaterialButton(
                          color: color_red,
                          elevation: 0,
                          padding: const EdgeInsets.fromLTRB(75, 0, 75, 0),
                          hoverElevation: 5,
                          height: 85,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(250)),
                          child: isLoading
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : Text(
                                  'Get Brochure',
                                  style: body.copyWith(
                                      fontSize: 25,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300),
                                ),
                          onPressed: () async {
                            try {
                              if (emailValid && phoneValid) {

                                html.WindowBase tab = html.window.open('', "blank");

                                setState(() {
                                  isLoading = true;
                                });

                                ///adding data to db
                                await FirebaseFirestore.instance
                                    .collection('brochure/')
                                    .add({
                                  "timestamp": FieldValue.serverTimestamp(),
                                  'email': widget.emailController.text,
                                  'phone':
                                      int.parse(widget.phoneController.text),
                                });


                                ///getting download link
                                String url = await FirebaseMethods()
                                    .getDownloadLink(
                                        '/brochure/Delwin Mathew Resume.pdf');

                                setState((){
                                  isLoading = false;
                                  tab.location.href = url;
                                });

                              }
                            } catch (e) {
                              Fluttertoast.showToast(
                                msg: 'Some error occurred',
                                webBgColor: '#616161',
                                timeInSecForIosWeb: 2,
                                toastLength: Toast.LENGTH_LONG,
                              );
                              if (kDebugMode) {
                                print(e.toString());
                              }
                            }
                          }),
                      const SizedBox(
                        height: 25,
                      )
                    ],
                  )),
              const Footer(),
            ],
          ),
        ));
  }
}
