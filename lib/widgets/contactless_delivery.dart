import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:testing_final_project/pages/home_page.dart';

class contactless_delivery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Container(
          height: 500,
          width: 500,
          alignment: Alignment.topLeft,
          margin: EdgeInsets.only(top: 63, left: 20),
          child: Stack(
            children: [
              SvgPicture.asset(
                'assets/images/LOGO.svg',
                // width: 63,
                // height: 63,
              ),
            ],
          ),
        ),
        SvgPicture.asset(
          'assets/images/Ellipse 8.svg',
          color: Color(0xFF7E19FF).withOpacity(0.6),
          // width: MediaQuery.of(context).size.width * 624.28 / 414,
          // height: MediaQuery.of(context).size.height * 750.61 / 896,
        ),
        SvgPicture.asset(
          'assets/images/Ellipse 10.svg',
          color: Color(0xFF6F12E7).withOpacity(0.8),
          // width: MediaQuery.of(context).size.width * 549 / 414,
          // height: MediaQuery.of(context).size.height * 481 / 896,
        ),
        SvgPicture.asset(
          'assets/images/Ellipse 12.svg',
          color: Color(0xFFACFF86).withOpacity(0.6),
          // width: MediaQuery.of(context).size.width * 549 / 414,
          // height: MediaQuery.of(context).size.height * 481 / 896,
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 312 / 896,
              ),
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.all(20),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Color(0xFFF6F5F5),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30.0),
                      topLeft: Radius.circular(30.0),
                    ),
                  ),

                  // child: Column(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   crossAxisAlignment: CrossAxisAlignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      //
                      Container(
                        width: 104,
                        height: 104,
                        // margin: EdgeInsets.only(top: 64, bottom: 416),
                        padding: EdgeInsets.all(32),
                        decoration: BoxDecoration(
                          color: Color(0xFFFFFFFF),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: SvgPicture.asset(
                          'assets/images/Box.svg',
                          width: 40,
                          height: 40,
                        ),
                      ),

                      //

                      Container(
                        width: 326,
                        height: 80,
                        // margin: EdgeInsets.only(top: 192, bottom: 312, left: 44, right: 44),
                        // alignment: Alignment.center,
                        child: Text(
                          "Non-Contact Deliveries",
                          style: TextStyle(
                              height: 41 / 34,
                              fontFamily: "SF Pro Display",
                              letterSpacing: 0.41,
                              fontSize: 34,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF2D0C57)),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        // margin: EdgeInsets.only(
                        //     bottom: 208, left: 21, right: 19, top: 297),
                        width: 374,
                        height: 79,
                        child: Text(
                          "When placing an order, select the option “Contactless delivery” and the courier will leave your order at the door.",
                          style: TextStyle(
                              fontFamily: "SF Pro Text",
                              letterSpacing: -0.41,
                              fontSize: 17,
                              height: 25.5 / 17,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF9586A8)),
                          textAlign: TextAlign.center,
                        ),
                      ),

                      // margin: EdgeInsets.only(
                      //     top: 424, bottom: 104, left: 20, right: 20),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePage(),
                            ),
                          );
                        },
                        // style: Button.styleFrom(
                        //     backgroundColor: Color(0xFF0BCE83),
                        //     shape: RoundedRectangleBorder(
                        //       borderRadius: BorderRadius.circular(8),
                        //     ),
                        //     padding: EdgeInsets.symmetric(
                        //         horizontal: 56.61, vertical: 16)),
                        child: Container(
                          margin: EdgeInsets.only(top: 10, bottom: 10),
                          decoration: BoxDecoration(
                            color: Color(0xFF0BCE83),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 56.61, vertical: 16),
                          child: Container(
                            alignment: Alignment.center,
                            height: 24,
                            width: 260.79,
                            child: Text(
                              'ORDER NOW',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontFamily: "SF Pro Text",
                                  height: 18 / 15,
                                  letterSpacing: -0.01,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),

                      Container(
                        // margin: EdgeInsets.only(bottom: 54, top: 512),
                        height: 18,
                        width: 80,
                        child: TextButton(
                          onPressed: () {},
                          child: Text("DISMISS",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 15,
                                  height: 18 / 15,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "SF Pro Text",
                                  letterSpacing: -0.01,
                                  color: Color(0xFF9586A8))),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
