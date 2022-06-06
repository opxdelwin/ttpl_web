import 'package:flutter/material.dart';

import '../../utils/utils.dart';
import '../footer.dart';
import '../header.dart';

class GalleryPc extends StatelessWidget {
  const GalleryPc({Key? key}) : super(key: key);

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
              child: Text('Gallery',
                  style: heading.copyWith(
                    fontSize: 40,
                  )),
            ),
            const SizedBox(height: 50),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width*0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Event Name here', style: heading.copyWith(fontSize: 25),),
                  SizedBox(
                      height: 150,
                      child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: clientele.length,
                          itemBuilder: (context, index) => GestureDetector(
                            onTap: (){
                              showDialog(context: context, builder: (context){return Center(
                                  child: Container(
                                      constraints: BoxConstraints(
                                        minHeight: size.height * 0.4,
                                        maxHeight: size.height * 0.8,
                                        maxWidth: size.width * 0.75,
                                      ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.stretch,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.circular(8)
                                              ),
                                              height: 400,
                                              child: Image.asset(clientele[index]['link'],
                                                  fit: BoxFit.contain)
                                          ),
                                          const SizedBox(height: 20,),
                                          Text(clientele[index]['name'], style: heading.copyWith(color: Colors.white, fontSize: 25),textAlign: TextAlign.center,)
                                        ],
                                      )
                                  ));});
                            },
                            child: SizedBox(
                              child: Image.asset(clientele[index]['link']),
                            ),
                          ))
                  ),
                  const SizedBox(height: 50),
                  Text('Event Name here', style: heading.copyWith(fontSize: 25),),
                  SizedBox(
                      height: 150,
                      child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: clientele.length,
                          itemBuilder: (context, index) => GestureDetector(
                            onTap: (){
                              showDialog(context: context, builder: (context){return Center(
                                  child: Container(
                                      constraints: BoxConstraints(
                                        minHeight: size.height * 0.4,
                                        maxHeight: size.height * 0.8,
                                        maxWidth: size.width * 0.75,
                                      ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.stretch,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.circular(8)
                                              ),
                                              height: 400,
                                              child: Image.asset(clientele[index]['link'],
                                                  fit: BoxFit.contain)
                                          ),
                                          const SizedBox(height: 20,),
                                          Text(clientele[index]['name'], style: heading.copyWith(color: Colors.white, fontSize: 25),textAlign: TextAlign.center,)
                                        ],
                                      )
                                  ));});
                            },
                            child: SizedBox(
                              child: Image.asset(clientele[index]['link']),
                            ),
                          ))
                  ),
                  const SizedBox(height: 50),
                  Text('Event Name here', style: heading.copyWith(fontSize: 25),),
                  SizedBox(
                      height: 150,
                      child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: clientele.length,
                          itemBuilder: (context, index) => GestureDetector(
                            onTap: (){
                              showDialog(context: context, builder: (context){return Center(
                                  child: Container(
                                      constraints: BoxConstraints(
                                        minHeight: size.height * 0.4,
                                        maxHeight: size.height * 0.8,
                                        maxWidth: size.width * 0.75,
                                      ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.stretch,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.circular(8)
                                              ),
                                              height: 400,
                                              child: Image.asset(clientele[index]['link'],
                                                  fit: BoxFit.contain)
                                          ),
                                          const SizedBox(height: 20,),
                                          Text(clientele[index]['name'], style: heading.copyWith(color: Colors.white, fontSize: 25),textAlign: TextAlign.center,)
                                        ],
                                      )
                                  ));});
                            },
                            child: SizedBox(
                              child: Image.asset(clientele[index]['link']),
                            ),
                          ))
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            const Footer(),
          ])),
    );
  }
}

class GalleryMobile extends StatelessWidget {
  const GalleryMobile({Key? key}) : super(key: key);

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
              child: Text('Gallery',
                  style: heading.copyWith(
                    fontSize: 40,
                  )),
            ),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text('Event Name here', style: heading,),
            ),
            SizedBox(
                height: 150,
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: clientele.length,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: (){
                        showDialog(context: context, builder: (context){return Center(
                            child: Container(
                                constraints: BoxConstraints(
                                  minHeight: size.height * 0.4,
                                  maxHeight: size.height * 0.8,
                                  maxWidth: size.width * 0.75,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(8)
                                        ),
                                        height: 400,
                                        child: Image.asset(clientele[index]['link'],
                                            fit: BoxFit.contain)
                                    ),
                                    const SizedBox(height: 20,),
                                    Text(clientele[index]['name'], style: heading.copyWith(color: Colors.white, fontSize: 25),textAlign: TextAlign.center,)
                                  ],
                                )
                            ));});
                      },
                      child: SizedBox(
                        child: Image.asset(clientele[index]['link']),
                      ),
                    ))
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text('Event Name here', style: heading,),
            ),            SizedBox(
                height: 150,
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: clientele.length,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: (){
                        showDialog(context: context, builder: (context){return Center(
                            child: Container(
                                constraints: BoxConstraints(
                                  minHeight: size.height * 0.4,
                                  maxHeight: size.height * 0.8,
                                  maxWidth: size.width * 0.75,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(8)
                                        ),
                                        height: 400,
                                        child: Image.asset(clientele[index]['link'],
                                            fit: BoxFit.contain)
                                    ),
                                    const SizedBox(height: 20,),
                                    Text(clientele[index]['name'], style: heading.copyWith(color: Colors.white, fontSize: 25),textAlign: TextAlign.center,)
                                  ],
                                )
                            ));});
                      },
                      child: SizedBox(
                        child: Image.asset(clientele[index]['link']),
                      ),
                    ))
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text('Event Name here', style: heading,),
            ),            SizedBox(
                height: 150,
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: clientele.length,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: (){
                        showDialog(context: context, builder: (context){return Center(
                            child: Container(
                                constraints: BoxConstraints(
                                  minHeight: size.height * 0.4,
                                  maxHeight: size.height * 0.8,
                                  maxWidth: size.width * 0.75,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(8)
                                        ),
                                        height: 400,
                                        child: Image.asset(clientele[index]['link'],
                                            fit: BoxFit.contain)
                                    ),
                                    const SizedBox(height: 20,),
                                    Text(clientele[index]['name'], style: heading.copyWith(color: Colors.white, fontSize: 25),textAlign: TextAlign.center,)
                                  ],
                                )
                            ));});
                      },
                      child: SizedBox(
                        child: Image.asset(clientele[index]['link']),
                      ),
                    ))
            ),
            const SizedBox(height: 16),
            const Footer(),
          ])),
    );
  }
}
