
import 'package:testing_final_project/models/selected_item.dart';
import 'package:testing_final_project/models/tab_bar.dart';
import 'package:testing_final_project/pages/cover_page.dart';
import 'package:flutter/material.dart';
import 'package:testing_final_project/models/shopping_cart.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:testing_final_project/pages/credit_card_page.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ShoppingCart()),
        ChangeNotifierProvider(create: (context) => SelectedItemProvider()),
        ChangeNotifierProvider(create: (context) => TabProvider()),
      ],
      child: MaterialApp(
        title: 'Delivery App',
        debugShowCheckedModeBanner: false,
        home: CoverPage(),
      ),
    );
  }
}
