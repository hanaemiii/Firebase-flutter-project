import 'package:testing_final_project/widgets/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:testing_final_project/pages/categories_tab.dart';
import 'package:testing_final_project/pages/shopping_cart_page.dart';
import 'package:testing_final_project/models/shopping_cart.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late ShoppingCart shoppingCart;
  int currentTab = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    shoppingCart = ShoppingCart(); // Create an instance of ShoppingCart
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        backgroundColor: Color(0xFFF6F5F5),
        elevation: 0,
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
      ),
      body: TabBarView(
        controller: _tabController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          CategoriesTab(),
          ShoppingCartPage(
              cartItems: shoppingCart.items, shoppingCart: shoppingCart),
          Placeholder(),
        ],
      ),
      bottomNavigationBar: BottomBar(
        onTap: (int index) {
          setState(() {
            currentTab = index;
            _tabController.animateTo(index);
          });
        },
        currentIndex: currentTab,
       
      ),
    );
  }
}
