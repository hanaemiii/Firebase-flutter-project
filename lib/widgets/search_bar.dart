import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchBar extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onSearch;

  SearchBar({required this.controller, required this.onSearch});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 25),
      height: 48,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(27),
        border: Border.all(color: Color(0xFFD9D0E3)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 27,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                shadowColor: Colors.transparent,
                primary: Colors.white,
              ),
              child: SvgPicture.asset(
                'assets/images/search.svg',
              ),
              onPressed: () {
                onSearch(controller.text);
              },
            ),
          ),
          Expanded(
            child: TextField(
              textAlign: TextAlign.left,
              onChanged: (query) {
                onSearch(query);
              },
              controller: controller,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search',
                hintStyle: TextStyle(
                  
                  height: 22 / 17,
                  fontFamily: "SF Pro Text",
                  fontSize: 17,
                  letterSpacing: -0.41,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF9586A8),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
