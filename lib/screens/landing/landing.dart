import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ttpl_website/screens/brochure/ResponsiveBrochure.dart';
import 'package:ttpl_website/screens/footer.dart';
import 'package:ttpl_website/screens/header.dart';
import 'package:ttpl_website/screens/products/responsiveProduct.dart';
import 'package:ttpl_website/utils/utils.dart';

import '../../provider/navigation_provider.dart';
import '../custom_drawer.dart';
import '../products/responsive_products.dart';

late double currentHeight = 0;
late double currentWidth = 0;
late double currPixel;
bool snackBarShowed = false;

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  final ScrollController _pageController = ScrollController();
  late ScrollController _clientScrollController;
  double _currClient = 0;
  bool physics = false;
  bool isBrowseActive = false;

  @override
  void initState() {
    _clientScrollController = ScrollController();
    currPixel = 0;
    _pageController.addListener(() {
      setState(() {
        currPixel = _pageController.position.pixels;
        // print(currPixel);
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _clientScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double padVal = MediaQuery.of(context).size.width * 1.2;
    currentHeight = MediaQuery.of(context).size.height;
    currentWidth = MediaQuery.of(context).size.width;
    if (currPixel >= 60) {
      padVal = 0;
    }

    if (snackBarShowed) {
    } else {
      Future.delayed(Duration.zero, () {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            action: SnackBarAction(
              label: 'Ok',
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              },
            ),
            backgroundColor: Colors.black87,
            content: Text(
              'Use top-left logo to move to previous screen',
              style: body.copyWith(
                color: Colors.white,
              ),
            )));
      });
      snackBarShowed = true;
    }

    return Scaffold(
      body: SafeArea(
        child: Container(
            color: Colors.white,
            height: currentHeight,
            width: currentWidth,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              controller: _pageController,
              children: [
                const Header(),
                Container(
                  color: Colors.white,
                  width: 20,
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.1),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      Text(
                        'Who are we?',
                        style: heading.copyWith(fontSize: 40),
                      ),
                      const SizedBox(height: 30),
                      Row(
                        children: [
                          Flexible(
                            flex: 3,
                            child: Text("""
Textel is an ISO 9001: 2015 certified manufacturing company, enlisted with MSME/NSIC under GSPP Scheme having expertise in consigning high-quality solutions for a decade in the field of Wireless Addressable Fire Alarm Systems, Wireless Nurse Call Systems & Wireless Attendant Call systems. 

We are associated with proven workmanship and establish intelligent deliverables on Fire Safety that suits the modern home, industries business environment. Products are manufactured in India and are compliant with NFPA72 (National Fire Alarm & Signaling Code) Edition-2016, BIS 11360-1985, and are also certified by STQC, Standard Testing, and Quality Certification by Govt of India.
                  """, style: body),
                          ),
                          const Expanded(flex: 1, child: SizedBox())
                        ],
                      ), //who are we
                      const SizedBox(height: 50),
                      const SizedBox(height: 10),
                      Text(
                        'What do we do?',
                        style: heading.copyWith(fontSize: 40),
                        textAlign: TextAlign.end,
                      ),
                      const SizedBox(height: 30),
                      Row(
                        children: [
                          Flexible(
                            flex: 3,
                            child: Text(
                              """Textel makes Wireless Nurse Call/Attendant Call system provides an economical and reliable communication by reducing the operation cost compared with conventional wired display units and inter phones which attract frequent breakdown and expensive periodical maintenance.

All these products are now empaneled in GeM (Government e-marketplace) which is a dynamic, self-sustaining, and user-friendly portal for procurement by Government offices. Our products are also approved by MHADA (Maharashtra Housing And Development Authority).""",
                              style: body,
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(),
                          ),
                        ],
                      ),

                      const SizedBox(height: 150),
                    ],
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: AnimatedOpacity(
                        duration: const Duration(milliseconds: 500),
                        opacity: currPixel >= 60 ? 1.0 : 0.0,
                        child: AnimatedPadding(
                            padding: EdgeInsets.only(left: padVal),
                            curve: Curves.easeInOut,
                            duration: const Duration(milliseconds: 750),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              color: Colors.white,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 30),
                                    child: Center(
                                      child: Text(
                                        'Clientele',
                                        overflow: TextOverflow.ellipsis,
                                        style: heading.copyWith(
                                          fontSize: 75,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 25),
                                  SizedBox(
                                      height: 250,
                                      width: MediaQuery.of(context).size.width,
                                      child: Stack(
                                          fit: StackFit.expand,
                                          children: [
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              child: ListView.builder(
                                                  itemCount: clientele.length,
                                                  physics:
                                                      const NeverScrollableScrollPhysics(),
                                                  shrinkWrap: true,
                                                  controller:
                                                      _clientScrollController,
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return Container(
                                                      margin: const EdgeInsets
                                                              .fromLTRB(
                                                          15, 0, 0, 0),
                                                      width: 350,
                                                      child: Image.asset(
                                                          '${clientele[index]['link']}'),
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          color:
                                                              Colors.grey[200],
                                                          boxShadow: const [
                                                            BoxShadow(
                                                                color: Colors
                                                                    .black26,
                                                                offset: Offset(
                                                                    2.5, 1.5),
                                                                blurRadius: 4,
                                                                blurStyle:
                                                                    BlurStyle
                                                                        .normal),
                                                          ]),
                                                    );
                                                  }),
                                            ),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              child: Row(
                                                // mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Flexible(
                                                    child: IconButton(
                                                        onPressed: () async {
                                                          if (_currClient !=
                                                              0) {
                                                            _clientScrollController.animateTo(
                                                                _clientScrollController
                                                                        .position
                                                                        .pixels -
                                                                    364,
                                                                duration:
                                                                    const Duration(
                                                                        milliseconds:
                                                                            150),
                                                                curve: Curves
                                                                    .easeInOut);
                                                            await Future.delayed(
                                                                const Duration(
                                                                    milliseconds:
                                                                        150));
                                                            setState(() {
                                                              _currClient =
                                                                  _currClient -
                                                                      1;
                                                            });
                                                          }
                                                        },
                                                        icon: const Icon(Icons
                                                            .keyboard_arrow_left)),
                                                  ),
                                                  Flexible(
                                                    child: IconButton(
                                                        onPressed: () async {
                                                          if (_currClient <
                                                              clientele.length-1) {
                                                            _clientScrollController.animateTo(
                                                                _clientScrollController
                                                                        .position
                                                                        .pixels +
                                                                    364,
                                                                duration:
                                                                    const Duration(
                                                                        milliseconds:
                                                                            150),
                                                                curve: Curves
                                                                    .easeInOut);
                                                            await Future.delayed(
                                                                const Duration(
                                                                    milliseconds:
                                                                        150));
                                                            setState(() {
                                                              _currClient =
                                                                  _currClient +
                                                                      1;
                                                            });
                                                          }
                                                        },
                                                        icon: const Icon(Icons
                                                            .keyboard_arrow_right)),
                                                  ),
                                                ],
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                              ),
                                            )
                                          ])),
                                  const SizedBox(height: 50),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: Text(
                                      clientele[_currClient as int]['name'],
                                      style: body.copyWith(
                                        fontSize: 25,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    AnimatedOpacity(
                      duration: const Duration(milliseconds: 750),
                      opacity: currPixel >= 60 ? 1.0 : 0.0,
                      child: Container(
                        width: 375,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Column(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: Text(
                                'Certifications',
                                style: heading.copyWith(
                                    fontSize: 65, letterSpacing: -2),
                              ),
                            ),
                            const SizedBox(height: 32),
                            SizedBox(
                              height: 363,
                              width: MediaQuery.of(context).size.width * 0.7,
                              child: ListView.builder(
                                  itemCount: certificates.length,
                                  physics: const BouncingScrollPhysics(),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return Center(
                                                  child: Container(
                                                constraints: BoxConstraints(
                                                  minHeight:
                                                      currentHeight * 0.4,
                                                  maxHeight:
                                                      currentHeight * 0.8,
                                                  maxWidth: currentWidth * 0.9,
                                                ),
                                                child: Image.asset(
                                                    certificates[index]['link'],
                                                    fit: BoxFit.cover),
                                              ));
                                            });
                                      },
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Container(
                                              margin: const EdgeInsets.fromLTRB(
                                                  15, 0, 0, 0),
                                              height: 325,
                                              width: 250,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  color: Colors.black54,
                                                  boxShadow: const [
                                                    BoxShadow(
                                                        color: Colors.black26,
                                                        offset:
                                                            Offset(2.5, 1.5),
                                                        blurRadius: 4,
                                                        blurStyle:
                                                            BlurStyle.normal),
                                                  ]),
                                              child: Image.asset(
                                                  certificates[index]['link'])),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(certificates[index]['name']
                                              .toString()),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                        ],
                                      ),
                                    );
                                  }),
                            ),
                            // const SizedBox(height: 50),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 75,
                ),
                Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: currentWidth * 0.125),
                  // height: currentHeight,
                  // width: currentWidth,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 60,
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                          width: 2.5,
                          color: Colors.black26,
                        ))),
                        child: FittedBox(
                          child: Text(
                            'Product Range',
                            style: heading,
                          ),
                        ),
                      ),
                      const SizedBox(height: 75),
                      LimitedBox(
                        maxHeight: 550,
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            controller: ScrollController(),
                            scrollDirection: Axis.vertical,
                            itemCount: product_data.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Provider.of<NavigationProvider>(context,
                                          listen: false)
                                      .increment();
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ResponsiveProduct(
                                                  data: product_data[index])));
                                },
                                child: Container(
                                  height: 350,
                                  margin:
                                      const EdgeInsets.fromLTRB(0, 0, 0, 15),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.deepPurple.shade50,
                                  ),
                                  child: Row(
                                    children: [
                                      Flexible(
                                        flex: 2,
                                        child: AspectRatio(
                                          aspectRatio: 4 / 3,
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(horizontal: 16),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              child: Image.asset(
                                                product_data[index]['url'][0],
                                                fit: BoxFit.fill,
                                              )),
                                        ),
                                      ),

                                      Expanded(
                                        flex: 3,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                                child: Text(
                                                  '${product_data[index]['name']}',
                                                  style: heading.copyWith(
                                                    fontSize: 22,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(height: 15),
                                              Expanded(
                                                flex: 3,
                                                child: Text(
                                                  "${product_data[index]['details']}",
                                                style: body.copyWith(
                                                  fontSize: 16,
                                                ), overflow: TextOverflow.clip),
                                              ),
                                              const SizedBox(height: 8),
                                              Padding(
                                                padding: const EdgeInsets.only(bottom: 10),
                                                child: Text(
                                                  'See more',
                                                  style: heading.copyWith(
                                                    color: color_darkBlue,
                                                    fontSize: 16
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 1),
                        child: ElevatedButton(
                          child: Text(
                            'Browse All Products',
                            style: body.copyWith(
                              color: color_darkBlue,
                            ),
                          ),
                          onPressed: () {
                            Provider.of<NavigationProvider>(context,
                                    listen: false)
                                .increment();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ResponsiveProducts()));
                          },
                          style: ButtonStyle(
                              backgroundColor: isBrowseActive
                                  ? MaterialStateProperty.all(
                                      Colors.grey.shade200)
                                  : MaterialStateProperty.all(
                                      Colors.transparent),
                              shadowColor:
                                  MaterialStateProperty.all(Colors.transparent),
                              animationDuration:
                                  const Duration(milliseconds: 500),
                              visualDensity: VisualDensity.comfortable),
                          onHover: (v) {
                            setState(() {
                              isBrowseActive = v;
                            });
                          },
                        ),
                      ),
                      const SizedBox(height: 100),
                    ],
                  ),
                ),
                Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: currentWidth * 0.12),
                    child: Column(children: [
                      SizedBox(
                        height: 75,
                        child: FittedBox(
                          child: Text(
                            'Connect With Us',
                            style: heading.copyWith(
                                letterSpacing: -0.8, wordSpacing: -0.5),
                          ),
                        ),
                      ),
                      const SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          MaterialButton(
                              color: color_red,
                              elevation: 0,
                              padding: const EdgeInsets.fromLTRB(75, 0, 75, 0),
                              hoverElevation: 5,
                              height: 85,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(250)),
                              child: Text(
                                'Brochure',
                                style: body.copyWith(
                                    fontSize: 35,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300),
                              ),
                              onPressed: () {
                                Provider.of<NavigationProvider>(context,
                                        listen: false)
                                    .increment();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ResponsiveBrochure()));
                              }),
                          MaterialButton(
                              color: color_red,
                              elevation: 0,
                              padding: const EdgeInsets.fromLTRB(75, 0, 75, 0),
                              hoverElevation: 5,
                              height: 85,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(250)),
                              child: Text(
                                'Get A Quote',
                                style: body.copyWith(
                                    fontSize: 35,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300),
                              ),
                              onPressed: () {}),
                        ],
                      ),
                      const SizedBox(height: 75),
                    ])),
                const Footer(),
              ],
            )),
      ),
    );
  }
}

class LandingMobile extends StatefulWidget {
  const LandingMobile({Key? key}) : super(key: key);

  @override
  State<LandingMobile> createState() => _LandingMobileState();
}

class _LandingMobileState extends State<LandingMobile> {
  late ScrollController _clientController;
  double _currClient = 0;
  bool physics = false;
  bool isBrowseActive = false;

  @override
  void initState() {
    _clientController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _clientController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    currentHeight = MediaQuery.of(context).size.height;
    currentWidth = MediaQuery.of(context).size.width;

    if (snackBarShowed) {
    } else {
      Future.delayed(Duration.zero, () {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            action: SnackBarAction(
              label: 'Ok',
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              },
            ),
            backgroundColor: Colors.black87,
            content: Text(
              'Use top-left logo to move to previous screen',
              style: body.copyWith(
                color: Colors.white,
              ),
            )));
      });
      snackBarShowed = true;
    }

    return SafeArea(
      child: Scaffold(
        endDrawer: CustomDrawer(
          width: currentWidth * drawerMultiplier,
          height: currentHeight,
        ),
        body: Container(
          height: currentHeight,
          width: currentWidth,
          color: Colors.white,
          child: ListView(
            children: [
              const SizedBox(height: 30),
              const Header(),
              const SizedBox(height: 20),
              Container(
                color: Colors.white,
                width: 20,
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Text(
                      'Who are we?',
                      style: heading.copyWith(fontSize: 40),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      children: [
                        Flexible(
                          flex: 3,
                          child: Text("""
Textel is an ISO 9001: 2015 certified manufacturing company, enlisted with MSME/NSIC under GSPP Scheme having expertise in consigning high-quality solutions for a decade in the field of Wireless Addressable Fire Alarm Systems, Wireless Nurse Call Systems & Wireless Attendant Call systems. 

We are associated with proven workmanship and establish intelligent deliverables on Fire Safety that suits the modern home, industries business environment. Products are manufactured in India and are compliant with NFPA72 (National Fire Alarm & Signaling Code) Edition-2016, BIS 11360-1985, and are also certified by STQC, Standard Testing, and Quality Certification by Govt of India.
                  """, style: body),
                        ),
                        const Expanded(flex: 1, child: SizedBox())
                      ],
                    ), //who are we
                    const SizedBox(height: 50),
                    const SizedBox(height: 10),
                    Text(
                      'What do we do?',
                      style: heading.copyWith(fontSize: 40),
                      textAlign: TextAlign.end,
                    ),
                    const SizedBox(height: 30),
                    Row(
                      children: [
                        Flexible(
                          flex: 3,
                          child: Text(
                            """Textel makes Wireless Nurse Call/Attendant Call system provides an economical and reliable communication by reducing the operation cost compared with conventional wired display units and inter phones which attract frequent breakdown and expensive periodical maintenance.

All these products are now empaneled in GeM (Government e-marketplace) which is a dynamic, self-sustaining, and user-friendly portal for procurement by Government offices. Our products are also approved by MHADA (Maharashtra Housing And Development Authority).""",
                            style: body,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(),
                        ),
                      ],
                    ),

                    const SizedBox(height: 150),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Center(
                        child: Text(
                          'Clientele',
                          overflow: TextOverflow.ellipsis,
                          style: heading.copyWith(
                            fontSize: 75,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    SizedBox(
                        height: 250,
                        width: MediaQuery.of(context).size.width,
                        child: Stack(fit: StackFit.expand, children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: ListView.builder(
                                itemCount: clientele.length,
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                controller: _clientController,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Container(
                                    margin:
                                        const EdgeInsets.fromLTRB(15, 0, 0, 0),
                                    width: 350,
                                    child: Image.asset(
                                        '${clientele[index]['link']}'),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.grey[200],
                                        boxShadow: const [
                                          BoxShadow(
                                              color: Colors.black26,
                                              offset: Offset(2.5, 1.5),
                                              blurRadius: 4,
                                              blurStyle: BlurStyle.normal),
                                        ]),
                                  );
                                }),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              // mainAxisSize: MainAxisSize.min,
                              children: [
                                Flexible(
                                  child: IconButton(
                                      onPressed: () async {
                                        if (_currClient != 0) {
                                          _clientController.animateTo(
                                              _clientController
                                                      .position.pixels -
                                                  364,
                                              duration: const Duration(
                                                  milliseconds: 150),
                                              curve: Curves.easeInOut);
                                          await Future.delayed(const Duration(
                                              milliseconds: 150));
                                          setState(() {
                                            _currClient = _currClient - 1;
                                          });
                                        }
                                      },
                                      icon: const Icon(
                                          Icons.keyboard_arrow_left)),
                                ),
                                Flexible(
                                  child: IconButton(
                                      onPressed: () async {
                                        if (_currClient != 32) {
                                          _clientController.animateTo(
                                              _clientController
                                                      .position.pixels +
                                                  364,
                                              duration: const Duration(
                                                  milliseconds: 150),
                                              curve: Curves.easeInOut);
                                          await Future.delayed(const Duration(
                                              milliseconds: 150));
                                          setState(() {
                                            _currClient = _currClient + 1;
                                          });
                                        }
                                      },
                                      icon: const Icon(
                                          Icons.keyboard_arrow_right)),
                                ),
                              ],
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            ),
                          )
                        ])),
                    const SizedBox(height: 50),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        clientele[_currClient as int]['name'],
                        style: body.copyWith(
                          fontSize: 25,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                width: 375,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Text(
                        'Certifications',
                        style:
                            heading.copyWith(fontSize: 65, letterSpacing: -2),
                      ),
                    ),
                    const SizedBox(height: 32),
                    SizedBox(
                      height: 363,
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: ListView.builder(
                          itemCount: certificates.length,
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return Center(
                                          child: Container(
                                        constraints: BoxConstraints(
                                          minHeight: currentHeight * 0.4,
                                          maxHeight: currentHeight * 0.8,
                                          maxWidth: currentWidth * 0.9,
                                        ),
                                        child: Image.asset(
                                            certificates[index]['link'],
                                            fit: BoxFit.cover),
                                      ));
                                    });
                              },
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                      margin: const EdgeInsets.fromLTRB(
                                          15, 0, 0, 0),
                                      height: 325,
                                      width: 250,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Colors.black54,
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Colors.black26,
                                                offset: Offset(2.5, 1.5),
                                                blurRadius: 4,
                                                blurStyle: BlurStyle.normal),
                                          ]),
                                      child: Image.asset(
                                          certificates[index]['link'])),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(certificates[index]['name'].toString()),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                            );
                          }),
                    ),
                    // const SizedBox(height: 50),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: currentWidth * 0.125),
                // height: currentHeight,
                // width: currentWidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 60,
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                        width: 2.5,
                        color: Colors.black26,
                      ))),
                      child: FittedBox(
                        child: Text(
                          'Product Range',
                          style: heading,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    LimitedBox(
                      maxHeight: currentHeight - 50,
                      child: ListView.separated(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        controller: ScrollController(),
                        scrollDirection: Axis.vertical,
                        itemCount: product_data.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                              onTap: () {
                                Provider.of<NavigationProvider>(context,
                                        listen: false)
                                    .increment();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ResponsiveProduct(
                                            data: product_data[index])));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.deepPurple.shade50,
                                    borderRadius: BorderRadius.circular(8)),
                                height: currentHeight - 100,
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Container(
                                      constraints: BoxConstraints(
                                          maxHeight: (currentHeight - 40) / 2),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 20),
                                      child: Image.asset(
                                          product_data[index]['url'][0]),
                                    ),
                                    Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Text(
                                          product_data[index]['name'],
                                          style: heading,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        )),
                                    Expanded(
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Text(
                                            product_data[index]['details'],
                                            style: body.copyWith(fontSize: 17),
                                            maxLines: 100,
                                            overflow: TextOverflow.ellipsis),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 8),
                                      child: Text(
                                        'See more',
                                        style: heading.copyWith(
                                            color: color_darkBlue,
                                            fontSize: 17),
                                        textAlign: TextAlign.start,
                                      ),
                                    ),
                                  ],
                                ),
                              ));
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(height: 15);
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 1),
                      child: ElevatedButton(
                        child: Text(
                          'Browse All Products',
                          style: body.copyWith(
                            color: color_darkBlue,
                          ),
                        ),
                        onPressed: () {
                          Provider.of<NavigationProvider>(context,
                                  listen: false)
                              .increment();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ResponsiveProducts()));
                        },
                        style: ButtonStyle(
                            backgroundColor: isBrowseActive
                                ? MaterialStateProperty.all(
                                    Colors.grey.shade200)
                                : MaterialStateProperty.all(Colors.transparent),
                            shadowColor:
                                MaterialStateProperty.all(Colors.transparent),
                            animationDuration:
                                const Duration(milliseconds: 500),
                            visualDensity: VisualDensity.comfortable),
                        onHover: (v) {
                          setState(() {
                            isBrowseActive = v;
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 100),
                  ],
                ),
              ),
              Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: currentWidth * 0.12),
                  child: Column(children: [
                    SizedBox(
                      height: 50,
                      child: FittedBox(
                        child: Text(
                          'Connect With Us',
                          style: heading.copyWith(
                              letterSpacing: -0.8, wordSpacing: -0.5),
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        MaterialButton(
                            color: color_red,
                            elevation: 0,
                            padding: const EdgeInsets.fromLTRB(75, 0, 75, 0),
                            hoverElevation: 5,
                            height: 85,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(250)),
                            child: Text(
                              'Brochure',
                              style: body.copyWith(
                                  fontSize: 35,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300),
                            ),
                            onPressed: () {
                              Provider.of<NavigationProvider>(context,
                                      listen: false)
                                  .increment();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ResponsiveBrochure()));
                            }),
                        const SizedBox(height: 50),
                        MaterialButton(
                            color: color_red,
                            elevation: 0,
                            padding: const EdgeInsets.fromLTRB(75, 0, 75, 0),
                            hoverElevation: 5,
                            height: 85,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(250)),
                            child: Text(
                              'Get A Quote',
                              style: body.copyWith(
                                  fontSize: 35,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300),
                            ),
                            onPressed: () {}),
                      ],
                    ),
                    const SizedBox(height: 75),
                  ])),
              const Footer(),
            ],
          ),
        ),
      ),
    );
  }
}
