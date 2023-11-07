import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:testing_final_project/pages/checkout_page.dart';
// product_list_item.dart

Widget shoppingListItem({
  required String itemName,
  required String productImage,
  required String price,
  required String measurement,
}) {
  return Builder(
    builder: (context) {
      return Container(
        margin: EdgeInsets.only(left: 5, right: 5, bottom: 25),
        child: Container(
          child: Row(
            children: [
              Image.asset('assets/images/$productImage'),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  height: 128,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        itemName,
                        style: TextStyle(
                          height: 22 / 18,
                          fontFamily: "SF Pro Text",
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF2D0C57),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            price.isNotEmpty ? price : "N/A",
                            style: TextStyle(
                              height: 1,
                              fontFamily: "SF Pro Text",
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF2D0C57),
                            ),
                          ),
                          SizedBox(width: 3),
                          Text(
                            measurement.isNotEmpty ? measurement : "N/A",
                            style: TextStyle(
                              height: 22 / 16,
                              fontFamily: "SF Pro Text",
                              fontSize: 16,
                              letterSpacing: -0.41,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF9586A8),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Container(
                            width: 60,
                            height: 40,
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
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
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CheckoutPage(),
                                  ));
                            },
                            child: Container(
                              width: 70,
                              height: 40,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 5),
                              decoration: BoxDecoration(
                                color: Color(0xFF0BCE83),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child: Text(
                                  'Buy',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "SF Pro Text",
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
