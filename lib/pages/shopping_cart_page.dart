import 'package:flutter/material.dart';
import 'package:testing_final_project/widgets/shopping_list_item.dart';
import 'package:testing_final_project/models/shopping_cart.dart';
import 'package:provider/provider.dart';

class ShoppingCartPage extends StatefulWidget {
  final List<Map<String, dynamic>> cartItems;
  final ShoppingCart shoppingCart;
  static const routeName = '/shopping_cart_page';

  const ShoppingCartPage(
      {Key? key, required this.cartItems, required this.shoppingCart})
      : super(key: key);

  @override
  _ShoppingCartPageState createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  @override
  Widget build(BuildContext context) {
    final shoppingCart = Provider.of<ShoppingCart>(context);

    return Scaffold(
      backgroundColor: Color(0xFFF6F5F5),
      body: Consumer<ShoppingCart>(
        builder: (BuildContext context, ShoppingCart value, Widget? child) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [ Container(
                margin: EdgeInsets.only(bottom: 50),
                child: Text(
                  'Shopping list',
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF2D0C57),
                  ),),
              ),
                Expanded(
                  child: ListView.builder(
                    itemCount: shoppingCart.items.length,
                    itemBuilder: (context, index) {
                      final item = shoppingCart.items[index];
                      return shoppingListItem(
                        itemName: item['itemName'],
                        productImage: item['productImage'] ?? '',
                        price: item['price']?.toString() ?? '',
                        measurement: item['measurement']?.toString() ?? '',
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
