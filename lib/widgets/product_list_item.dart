import 'package:testing_final_project/widgets/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:testing_final_project/models/shopping_cart.dart';
import 'package:provider/provider.dart';

Widget productListItem({
  required String itemName,
  required String productImage,
  required String price,
  required String measurement,
  required ShoppingCart shoppingCart,
  required BuildContext context,
}) {
  return Builder(
    builder: (context) {
      final shoppingCart = Provider.of<ShoppingCart>(context, listen: false);

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
                          AnimatedButton(
                            onPressed: () {
                              shoppingCart.addToCart({
                                'itemName': itemName,
                                'productImage': productImage,
                                'price': price,
                                'measurement': measurement,
                              });

                              _showSnackBar(context, itemName);
                            },
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

void _showSnackBar(BuildContext context, String itemName) {
  final snackBar = SnackBar(
    content: Text('$itemName added to the shopping cart'),
    duration: Duration(seconds: 2),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}


