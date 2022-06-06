import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ttpl_website/provider/navigation_provider.dart';
import 'package:ttpl_website/screens/header.dart';
import 'package:ttpl_website/screens/products/responsiveProduct.dart';

import '../../utils/utils.dart';
import '../footer.dart';

class ProductsPc extends StatelessWidget {
  const ProductsPc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
          height: size.height,
          width: size.width,
          child: ListView(children: [
            const Header(),
            Center(
              child:
                  Text('Our Products', style: heading.copyWith(fontSize: 40)),
            ),
            const SizedBox(height: 50),
            const _ProductBuilder(index: 0),
            const _ProductBuilder(index: 1),
            const _ProductBuilder(index: 2),
            const Footer(),
          ])),
    );
  }
}

class ProductsMobile extends StatelessWidget {
  const ProductsMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
          height: size.height,
          width: size.width,
          child: ListView(children: [
            const Header(),
            Center(
              child:
              Text('Our Products', style: heading.copyWith(fontSize: 40)),
            ),
            const SizedBox(height: 50),
            const _ProductBuilder(index: 0, isMobile: true),
            const _ProductBuilder(index: 1, isMobile: true),
            const _ProductBuilder(index: 2, isMobile: true),
            const Footer(),
          ])),
    );
  }
}

class _ProductBuilder extends StatefulWidget {

  const _ProductBuilder({Key? key, required this.index, this.isMobile = false}) : super(key: key);
  final int index;
  final bool isMobile;

  @override
  State<_ProductBuilder> createState() => _ProductBuilderState();
}

class _ProductBuilderState extends State<_ProductBuilder> {
  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if(widget.isMobile){
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
              child: Text(product_data[widget.index]['name'],
                  style: heading.copyWith(fontSize: 30),
                  textAlign: TextAlign.start)),
          const SizedBox(height: 16),
          Column(
            crossAxisAlignment:CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 250,
                child: Image.asset(product_data[widget.index]['url'][0]),
              ),
              const SizedBox(height: 16),

              Flexible(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AnimatedContainer(
                        height: isOpen ? null : 350,
                        duration: const Duration(milliseconds: 250),
                        child: Text(
                          product_data[widget.index]['details'],
                          style: body,
                          overflow: TextOverflow.clip,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const SizedBox(height: 8),
                      InkWell(
                          onTap: () {
                            setState(() {
                              isOpen = !isOpen;
                            });
                          },
                          child: isOpen
                              ? InkWell(
                            onTap: () async {
                              Provider.of<NavigationProvider>(context,
                                  listen: false)
                                  .increment();

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ResponsiveProduct(
                                            data:
                                            product_data[widget.index],
                                          )));

                              await Future.delayed(
                                  const Duration(milliseconds: 200));

                              setState(() {
                                isOpen = !isOpen;
                              });
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Browse Product Page',
                                  style: body.copyWith(
                                    color: color_red,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.2,
                                  ),
                                ),
                                Icon(
                                  Icons.keyboard_arrow_right,
                                  color: color_darkBlue,
                                )
                              ],
                            ),
                          )
                              : Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'See more',
                                style: body.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const Icon(Icons.keyboard_arrow_down)
                            ],
                          ))
                    ],
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 50)
        ],
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
              child: Text(product_data[widget.index]['name'],
                  style: heading.copyWith(fontSize: 30),
                  textAlign: TextAlign.start)),
          Row(
            crossAxisAlignment:
            isOpen ? CrossAxisAlignment.center : CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 450,
                child: Image.asset(product_data[widget.index]['url'][0]),
              ),
              Flexible(
                child: Container(
                  padding: EdgeInsets.fromLTRB(0, 0, size.width * 0.04, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AnimatedContainer(
                        height: isOpen ? null : 350,
                        duration: const Duration(milliseconds: 250),
                        child: Text(
                          product_data[widget.index]['details'],
                          style: body,
                          overflow: TextOverflow.clip,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const SizedBox(height: 8),
                      InkWell(
                          onTap: () {
                            setState(() {
                              isOpen = !isOpen;
                            });
                          },
                          child: isOpen
                              ? InkWell(
                            onTap: () async {
                              Provider.of<NavigationProvider>(context,
                                  listen: false)
                                  .increment();

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ResponsiveProduct(
                                            data:
                                            product_data[widget.index],
                                          )));

                              await Future.delayed(
                                  const Duration(milliseconds: 200));

                              setState(() {
                                isOpen = !isOpen;
                              });
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Browse Product Page',
                                  style: body.copyWith(
                                    color: color_red,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.2,
                                  ),
                                ),
                                Icon(
                                  Icons.keyboard_arrow_right,
                                  color: color_darkBlue,
                                )
                              ],
                            ),
                          )
                              : Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'See more',
                                style: body.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const Icon(Icons.keyboard_arrow_down)
                            ],
                          ))
                    ],
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 50)
        ],
      );
    }
  }
}
