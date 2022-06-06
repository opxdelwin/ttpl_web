import 'dart:html' as html;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ttpl_website/provider/navigation_provider.dart';
import 'package:ttpl_website/screens/footer.dart';
import 'package:ttpl_website/utils/utils.dart';

import '../custom_drawer.dart';
import '../header.dart';

late double height;
late double width;
bool snackBarShowed = false;

class ProductPc extends StatefulWidget {
  const ProductPc({Key? key, required this.data}) : super(key: key);

  final Map data;

  @override
  State<ProductPc> createState() => _ProductPcState();
}

class _ProductPcState extends State<ProductPc> {
  late CarouselController _carouselController;

  bool isOpen = false;

  @override
  void initState() {
    _carouselController = CarouselController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    bool isAutoPlay = true;
    return Scaffold(
      body: SizedBox(
          height: height,
          width: width,
          child: ListView(
            children: [
              const Header(),

              //product details
              SizedBox(
                  width: width,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          child: Column(
                            children: [
                              AspectRatio(
                                  aspectRatio: 5 / 3,
                                  child: Container(
                                    margin: const EdgeInsets.only(left: 50),
                                    padding: const EdgeInsets.symmetric(vertical: 20),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(
                                          color: Colors.black54,
                                          width: 3,
                                        )),
                                    child: Image.asset(widget.data['url'][0],
                                        fit: BoxFit.contain),
                                  )),
                              const SizedBox(height: 25),
                              Container(
                                margin: const EdgeInsets.only(left: 50),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      child: InkWell(
                                        onTap: () {
                                          html.window.open(
                                              widget.data['gem-link'], "_blank");
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.all(7),
                                          height: 100,
                                          width: 150,
                                          decoration: BoxDecoration(
                                              // color: Colors.green,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Image.asset(
                                              'assets/images/GeM_logo.jpg',),
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      child: InkWell(
                                        onTap: () {
                                          html.window.open(
                                              'https://www.mhada.gov.in/en', "_blank");
                                        },
                                        child: Container(
                                          height: 100,
                                          width: 150,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(5),
                                          ),
                                          child: Image.asset('assets/images/mhada.jpg'),
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      child: InkWell(
                                        onTap: () {
                                          html.window.open(
                                              'https://www.stqc.gov.in/', "_blank");
                                        },
                                        child: Container(
                                          height: 100,
                                          width: 200,
                                          decoration: BoxDecoration(
                                            // color: Colors.green,
                                            borderRadius: BorderRadius.circular(5),
                                          ),
                                          child: Image.asset('assets/images/stqc_approved.png'),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          )),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            padding:
                                EdgeInsets.symmetric(horizontal: width * 0.025),
                            child: Text(
                              widget.data['name'],
                              style: heading,
                              textAlign: TextAlign.start,
                            ),
                          ),

                          const SizedBox(height: 25,),

                          AnimatedContainer(
                            padding :EdgeInsets.symmetric(horizontal: width * 0.025),
                            height: isOpen ? null : 350,
                            duration: const Duration(milliseconds: 250),
                            child: Text(
                              widget.data['details'],
                              style: body,
                              overflow: TextOverflow.clip,
                            ),
                          ),
                          GestureDetector(
                              onTap: (){
                                setState((){
                                  isOpen = !isOpen;
                                });
                              },
                              child: Padding(
                                  padding :EdgeInsets.symmetric(horizontal: width * 0.025, vertical: 10),
                                  child: Text(isOpen ? 'See less' : 'See more', style: heading.copyWith(
                                    color: color_darkBlue,
                                    fontSize: 18
                                  ),)))
                        ],
                      )),
                    ],
                  )),
              const SizedBox(height: 50),

              Center(child: Text('Compatible Products', style: heading.copyWith(
                fontSize: 35,
              ))),

              const SizedBox(height: 50),

              // compatible products
              SizedBox(
                // padding: EdgeInsets.symmetric(horizontal: width * 0.012),
                height: 400,
                child: Stack(children: [
                  SizedBox(
                      width: width,
                      child: CarouselSlider.builder(
                          carouselController: _carouselController,
                          itemCount: widget.data['compatible-products'].length,
                          options: CarouselOptions(
                            pauseAutoPlayOnManualNavigate: true,
                            pauseAutoPlayOnTouch: true,
                            autoPlay: isAutoPlay,
                            autoPlayAnimationDuration:
                                const Duration(milliseconds: 425),
                            autoPlayCurve: Curves.easeInOut,
                            autoPlayInterval: const Duration(seconds: 12),
                            scrollDirection: Axis.horizontal,
                            scrollPhysics: const FixedExtentScrollPhysics(),
                            enlargeCenterPage: true,
                            enlargeStrategy: CenterPageEnlargeStrategy.scale,
                          ),
                          itemBuilder: (context, index, pageViewIndex) {
                            return CompatibleProductBuilder(
                              data: widget.data['compatible-products'][index],
                              index: index,
                            );
                          })),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.070),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ClipOval(
                          child: IconButton(
                              onPressed: () {
                                _carouselController.previousPage(
                                  curve: Curves.easeInOut,
                                  duration: const Duration(milliseconds: 500),
                                );
                              },
                              icon: const Icon(Icons.arrow_back_ios_rounded)),
                        ),
                        ClipOval(
                          child: IconButton(
                              onPressed: () {
                                _carouselController.nextPage(
                                  curve: Curves.easeInOut,
                                  duration: const Duration(milliseconds: 500),
                                );
                              },
                              icon:
                                  const Icon(Icons.arrow_forward_ios_rounded)),
                        )
                      ],
                    ),
                  ),
                ]),
              ),
              const SizedBox(height: 50),
              const Footer(),
            ],
          )),
    );
  }
}

class ProductMobile extends StatefulWidget {
  const ProductMobile({Key? key, required this.data}) : super(key: key);
  final Map data;

  @override
  State<ProductMobile> createState() => _ProductMobileState();
}

class _ProductMobileState extends State<ProductMobile> {
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
            // controller: _screenController,
            children: [
              const Header(),
              const SizedBox(height: 12),
              Column(
                children: [
                  ///product image
                  Container(
                    height: 300,
                    width: width,
                    margin: EdgeInsets.symmetric(horizontal: width * 0.035),
                    // color: Colors.green,
                    child: Image.asset(widget.data['url'][0]),
                  ),
                  const SizedBox(
                    height: 12,
                  ),

                  ///gem link and certifications
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.035),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: InkWell(
                              onTap: () {
                                html.window
                                    .open(widget.data['gem-link'], "_blank");
                              },
                              child: Container(
                                padding: const EdgeInsets.all(7),
                                height: 100,
                                width: 150,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5)),
                                child: Image.asset('assets/images/GeM_logo.jpg',
                                    fit: BoxFit.cover),
                              ),
                            ),
                          ),
                          Flexible(
                            child: InkWell(
                              onTap: () {
                                html.window.open(
                                    'https://www.mhada.gov.in/en', "_blank");
                              },
                              child: Container(
                                height: 100,
                                width: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Image.asset('assets/images/mhada.jpg'),
                              ),
                            ),
                          ),
                          Flexible(
                            child: InkWell(
                              onTap: () {
                                html.window.open(
                                    'https://www.stqc.gov.in/', "_blank");
                              },
                              child: Container(
                                height: 100,
                                width: 200,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Image.asset('assets/images/stqc_approved.png'),
                              ),
                            ),
                          )
                        ],
                      )),
                  const SizedBox(
                    height: 12,
                  ),

                  ///product title
                  Container(
                    // color: Colors.cyan,
                    padding: EdgeInsets.symmetric(horizontal: width * 0.035),
                    width: width,
                    child: Text(
                      widget.data['name'],
                      style: heading.copyWith(fontSize: 35),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),

                  ///product details
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.035),
                    width: width,
                    child: Text(widget.data['details'], style: body),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  ///compatible product header
                  Container(
                    decoration: const BoxDecoration(
                        // color: Colors.cyan,
                        border: Border(
                            bottom:
                                BorderSide(width: 2.5, color: Colors.black26))),
                    padding: const EdgeInsets.symmetric(
                        vertical: 5, horizontal: 8.5),
                    // height: 75,
                    child: Text(
                      'Compatible Products',
                      style: heading.copyWith(
                        fontSize: 28,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),

                  ///list of compatible products
                  SizedBox(
                      height: height * 0.83,
                      width: width * 0.82,
                      child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: widget.data['compatible-products'].length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Provider.of<NavigationProvider>(context,
                                    listen: false)
                                    .increment();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            CompatibleProductPage(
                                              data: widget.data[
                                              'compatible-products']
                                              [index],  index: index,)));
                              },
                              child: Container(
                                margin: const EdgeInsets.fromLTRB(0, 0, 0, 14),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                  border: Border.all(width: 1.2, color: Colors.black87)
                                ),
                                padding: const EdgeInsets.all(8),
                                height: 250,
                                width: width * 0.82,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Flexible(
                                      child: Image.asset(
                                          widget.data['compatible-products']
                                              [index]['url']),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Flexible(
                                        child: Text(
                                      widget.data['compatible-products'][index]
                                          ['details'],
                                      style: body.copyWith(fontSize: 18),
                                    )),
                                    Text('See more', style: body.copyWith(
                                      color: color_darkBlue,
                                      fontSize: 16,
                                    ),),
                                  ],
                                ),
                              ),
                            );
                          })),
                ],
              ),
              const SizedBox(height: 15),
              const Footer(),
            ],
          )),
    );
  }
}

class CompatibleProductPage extends StatelessWidget {
  const CompatibleProductPage({Key? key,required this.data, required this.index}) : super(key: key);
  final Map data;
  final int index;


  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

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
      endDrawer: CustomDrawer(
        width: width * drawerMultiplier,
        height: height,
      ),
      body: SizedBox(
          height: height,
          width: width,
          child: ListView(
            // controller: _screenController,
            children: [
              const Header(),
              const SizedBox(height: 12),
              Column(
                children: [
                  ///product image
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black87, width: 1.2),
                      borderRadius: BorderRadius.circular(8)
                    ),
                    padding: EdgeInsets.all(width * 0.032),
                    // color: Colors.green,
                    child: Image.asset(data['url']),
                  ),
                  const SizedBox(
                    height: 40,
                  ),

                  ///gem link and certifications
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.035),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Place order from GeM: ', style: body.copyWith(
                            fontSize: 25,
                          ),),
                          const SizedBox(width: 25,),
                          MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                              onTap: () {
                                html.window.open(product_data[index]['gem-link'], "_blank");
                              },
                              child: Container(
                                height: 100,
                                width: 150,
                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(5),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.shade300,
                                          offset: const Offset(5, 3),
                                          blurRadius: 3),
                                    ]),
                                child: Image.asset('assets/images/GeM_logo.jpg',
                                    fit: BoxFit.cover),
                              ),
                            ),
                          ),
                        ],
                      )),
                  const SizedBox(
                    height: 12,
                  ),

                  ///product title
                  Container(
                    // color: Colors.cyan,
                    padding: EdgeInsets.symmetric(horizontal: width * 0.035),
                    width: width,
                    child: Text(
                      data['name'],
                      style: heading.copyWith(fontSize: 35),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),

                  ///product details
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.035),
                    width: width,
                    child: Text(data['details'], style: body),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Footer(),
            ],
          )),
    );
  }
}

class CompatibleProductBuilder extends StatefulWidget {
  const CompatibleProductBuilder({Key? key, required this.data, required this.index})
      : super(key: key);

  final int index;
  final Map data;

  @override
  State<CompatibleProductBuilder> createState() =>
      _CompatibleProductBuilderState();
}

class _CompatibleProductBuilderState extends State<CompatibleProductBuilder> {
  @override
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Provider.of<NavigationProvider>(context, listen: false).increment();
        Navigator.push(context, MaterialPageRoute(builder: (context)=>CompatibleProductPage(data: widget.data, index: widget.index)));
    },
      child: Container(
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.grey.shade50,
            border: Border.all(width: 1.2, color: Colors.black87)
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.white,
                margin: const EdgeInsets.all(8),
                // height: containerHeight,
                child: Image.asset(
                  widget.data['url'],
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Flexible(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 8, 8, 0),
                      height: 50,
                      // color: Colors.grey,
                      child: FittedBox(
                          child: Text(
                        widget.data['name'],
                        style: heading.copyWith(
                          fontSize: 30,
                        ),
                      )),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Flexible(
                        child: Text(widget.data['details'],
                            style: body)),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text('See more', style: heading.copyWith(
                        color: color_darkBlue,
                        fontSize: 18,
                      )),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
