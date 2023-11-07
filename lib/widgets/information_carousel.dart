import 'package:flutter/material.dart';
// import 'package:carousel_slider/carousel_slider.dart';

class InformationSlider extends StatefulWidget {
  @override
  _InformationSliderState createState() => _InformationSliderState();
}

class _InformationSliderState extends State<InformationSlider> {
  List imageSliders = [
    'assets/images/vegetable_1.png',
    'assets/images/vegetable_2.png',
    'assets/images/vegetable_3.png',
  ];
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    //  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    //   systemNavigationBarColor: Color(0xFF000000),
    //   systemNavigationBarIconBrightness: Brightness.dark,
    //   systemNavigationBarDividerColor: null,
    //   statusBarColor: Color(0xFFFFFFFF),
    //   statusBarIconBrightness: Brightness.dark,
    //   statusBarBrightness: Brightness.dark,
    // ));

    return Stack(children: [
      Image.asset('assets/images/single_background.png'),
      Scaffold(
        body: Column(
          children: [
            Positioned(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: imageSliders.map((url) {
                  int index = imageSliders.indexOf(url);
                  return Container(
                    width: 8.0,
                    height: 8.0,
                    margin:
                        EdgeInsets.symmetric(vertical: 4.0, horizontal: 2.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: activeIndex == index
                          ? Colors.blue
                          : Color.fromRGBO(0, 0, 0, 0.4),
                    ),
                  );
                }).toList(),
              ),
            ),
            // Container(
            //     child: CarouselSlider(
            //   options: CarouselOptions(
            //       height: 200,
            //       viewportFraction: .6,
            //       aspectRatio: 1.2,
            //       enlargeCenterPage: true,
            //       scrollDirection: Axis.horizontal,
            //       onPageChanged: (index, reason) {
            //         setState(() {
            //           activeIndex = index;
            //         });
            //       }),
            //   items: [for (var item in imageSliders) Image.asset(item)],
            // )),
          ],
        ),
      )
    ]);
  }
}
