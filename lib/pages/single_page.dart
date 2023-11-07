import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SinglePage extends StatefulWidget {
  final Map<String, dynamic> itemData;

  const SinglePage({required this.itemData, Key? key}) : super(key: key);

  @override
  State<SinglePage> createState() => _SinglePageState();
}

class _SinglePageState extends State<SinglePage> {
  late final Map<String, dynamic> itemData;
  late int currentIndex;

  @override
  void initState() {
    super.initState();
    itemData = widget.itemData;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      background(),
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 100,
          backgroundColor: Colors.transparent,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(bottom: 22, top: 50, left: 15),
              width: 150,
              height: 150,
              child: SvgPicture.asset(
                'assets/images/Vector.svg',
                color: Color(0xFF2D0C57),
              ),
            ),
          ),
        ),
        body: information(),
      )
    ]);
  }

  Widget background() {
    final String imageName = widget.itemData['imageName'];

    return Image.asset(
      'assets/images/$imageName',
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      fit: BoxFit.cover,
    );
  }

  Widget information() {
    final String itemName = widget.itemData['itemName'];
    final String price = widget.itemData['price'];
    final String measurement = widget.itemData['measurement'];
    final String measurementEach = widget.itemData['measurementEach'];

    final String info = widget.itemData['info'];

    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 640 / 896,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Color(0xFFF6F5F5),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30.0),
              topLeft: Radius.circular(30.0),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                itemName,
                style: TextStyle(
                    height: 41 / 30,
                    fontFamily: "SF Pro Display",
                    fontSize: 30,
                    letterSpacing: 0.41,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF2D0C57)),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        price,
                        style: TextStyle(
                            height: 43.08 / 32,
                            fontFamily: "SF Pro Text",
                            fontSize: 32,
                            letterSpacing: -0.8,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF2D0C57)),
                      ),
                      SizedBox(width: 5),
                      Text(
                        measurement,
                        style: TextStyle(
                            height: 43.08 / 24,
                            fontFamily: "SF Pro Text",
                            fontSize: 24,
                            letterSpacing: -0.8,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF9586A8)),
                      )
                    ],
                  ),
                  Text(
                    measurementEach,
                    style: TextStyle(
                        height: 25.5 / 17,
                        fontFamily: "SF Pro Text",
                        fontSize: 17,
                        letterSpacing: -0.41,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF06BE77)),
                  )
                ],
              ),
              Text(
                'Spain',
                style: TextStyle(
                    height: 1,
                    fontFamily: "SF Pro Text",
                    fontSize: 22,
                    letterSpacing: -0.41,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF2D0C57)),
              ),
              Text(
                info,
                style: TextStyle(
                    height: 25.5 / 17,
                    fontFamily: "SF Pro Text",
                    fontSize: 17,
                    letterSpacing: -0.41,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF9586A8)),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Container(
                    width: 78,
                    height: 56,
                    padding: EdgeInsets.symmetric(horizontal: 29, vertical: 10),
                    decoration: BoxDecoration(
                      color: Color(0xFFFFFFFF),
                      border: Border.all(
                        color: Color(0xFFD9D0E3),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: SvgPicture.asset('assets/images/heart.svg'),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      height: 56,
                      padding:
                          EdgeInsets.symmetric(horizontal: 29, vertical: 10),
                      decoration: BoxDecoration(
                        color: Color(0xFF0BCE83),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/images/shopping-cart.svg',
                              color: Colors.white),
                          SizedBox(width: 10),
                          Text(
                            'ADD TO CART',
                            style: TextStyle(
                                height: 18 / 15,
                                fontFamily: "SF Pro Text",
                                fontSize: 15,
                                letterSpacing: -0.01,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              // Expanded(
              //   child: SizedBox(),
              // )
            ],
          )),
    );
    //
  }
}
