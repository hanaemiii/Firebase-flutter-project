import 'package:flutter/material.dart';
import 'package:testing_final_project/widgets/contactless_delivery.dart';

class CoverPage extends StatefulWidget {
  const CoverPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CoverPageState();
  }
}

class _CoverPageState extends State<CoverPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFA259FF),
      body: contactless_delivery(),
    );
  }
}
