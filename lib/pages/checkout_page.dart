// CheckoutPage.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:testing_final_project/widgets/bottom_bar.dart';
import 'package:testing_final_project/pages/credit_card_page.dart';

class CheckoutPage extends StatefulWidget {
  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody(),
      bottomNavigationBar: BottomBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          Navigator.pop(context);
        },
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      toolbarHeight: 90,
      title: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(bottom: 22, top: 50, right: 10),
        child: Text(
          'Checkout',
          style: TextStyle(
            height: 22 / 17,
            fontFamily: "SF Pro Text",
            fontSize: 17,
            letterSpacing: -0.41,
            fontWeight: FontWeight.w600,
            color: Color(0xFF2D0C57),
          ),
        ),
      ),
      backgroundColor: Color(0xFFF6F5F5),
      elevation: 7,
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
          ),
        ),
      ),
    );
  }

  Widget buildBody() {
    return Scaffold(
      backgroundColor: Color(0xFFF6F5F5),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Payment method',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff2d0c57),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CreditCardPage(),
                      ),
                    );
                  },
                  child: Text(
                    'CHANGE',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff7103ff),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 30),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 40),
                    child: SvgPicture.asset(
                      'assets/images/credit-card.svg',
                    ),
                  ),
                  Text(
                    '**** **** **** 4747',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff9586a8),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Delivery address',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff2d0c57),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                  ),
                  child: Text(
                    'CHANGE',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff7103ff),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 30),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 40),
                    child: SvgPicture.asset(
                      'assets/images/home.svg',
                    ),
                  ),
                  Text(
                    'Alexandra Smith \n Cesu 31 k-2 5.st, SIA Chili \n Riga \n LV–1012 \n Latvia',
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff9586a8),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
