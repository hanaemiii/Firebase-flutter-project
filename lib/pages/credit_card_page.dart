import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CreditCardPage extends StatefulWidget {
  @override
  _CreditCardPageState createState() => _CreditCardPageState();
}

class _CreditCardPageState extends State<CreditCardPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController cardExpirationController = TextEditingController();
  TextEditingController cardCvcController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff6f5f5),
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
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(right: 20, left:20, bottom:60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Credit / Debit card',
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: 'SF Pro Display',
                  height: 41 / 30,
                  letterSpacing: 0.41,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff2d0c57),
                ),
              ),
              Stack(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    height: 220,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Color(0xFFB993D6),
                          Color(0xFF8CA6DB),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
      BoxShadow(
                color: Color.fromRGBO(184, 148, 215, 0.35),
        spreadRadius: 5,
        blurRadius: 7,
        // offset: Offset(0, 3),
      ),
    ],
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    bottom: 0,
                    child: Image.asset(
                      'assets/images/Ellipse.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.topRight,
                        padding: EdgeInsets.all(25),
                        child: Image.asset(
                          'assets/images/mc_symbol.png',
                        ),
                      ),
                      if (cardNumberController.text.isEmpty)
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(''),
                        ),
                      if (cardNumberController.text.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            cardNumberController.text,
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'SF Pro Display',
                              fontSize: 26,
                              fontWeight: FontWeight.w500,
                              height: 30.908 / 26,
                              letterSpacing: 2.283,
                              shadows: [
                                Shadow(
                                  offset: Offset(0, 0.7010492086410522),
                                  blurRadius: 3.0,
                                  color: Color.fromRGBO(77, 5, 169, 0.30),
                                )
                              ],
                            ),
                          ),
                        ),
                      if (nameController.text.isNotEmpty ||
                          cardExpirationController.text.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              if (nameController.text.isEmpty) Text(''),
                              if (nameController.text.isNotEmpty)
                                Text(
                                  nameController.text.toUpperCase(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'SF Pro Display',
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    height: 30.908 / 26,
                                    letterSpacing: 2.283,
                                    shadows: [
                                      Shadow(
                                        offset: Offset(0, 0.7010492086410522),
                                        blurRadius: 3.0,
                                        color: Color.fromRGBO(77, 5, 169, 0.30),
                                      )
                                    ],
                                  ),
                                ),
                              if (cardExpirationController.text.isNotEmpty)
                                Text(
                                  cardExpirationController.text,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'SF Pro Display',
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    height: 30.908 / 26,
                                    letterSpacing: 2.283,
                                    shadows: [
                                      Shadow(
                                        offset: Offset(0, 0.7010492086410522),
                                        blurRadius: 3.0,
                                        color: Color.fromRGBO(77, 5, 169, 0.30),
                                      )
                                    ],
                                  ),
                                ),
                            ],
                          ),
                        ),
                      if (cardCvcController.text.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Opacity(
                            opacity: 0.0,
                            child: Text(
                              cardCvcController.text,
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'SF Pro Display',
                                fontSize: 26,
                                fontWeight: FontWeight.w500,
                                height: 30.908 / 26,
                                letterSpacing: 2.283,
                                shadows: [
                                  Shadow(
                                    offset: Offset(0, 0.7010492086410522),
                                    blurRadius: 3.0,
                                    color: Color.fromRGBO(77, 5, 169, 0.30),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
              Center(
                child: SvgPicture.asset(
                  'assets/images/photo_camera.svg',
                ),
              ),
              buildTextFieldColumn(
                'Name on card',
                'JOHN SMITH',
                MediaQuery.of(context).size.width,
                controller: nameController,
                displayController: nameController,
                type: TextInputType.text,
                maxLength: 24,
              ),
              SizedBox(height: MediaQuery.of(context).size.width * 0.03),
              buildTextFieldColumn(
                'Card number',
                'XXXX XXXX XXXX XXXX',
                MediaQuery.of(context).size.width,
                controller: cardNumberController,
                displayController: cardNumberController,
                type: TextInputType.number,
                maxLength: 19,
                    suffixIcon: Image.asset('assets/images/mc_symbol 1.png'),

              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: buildTextFieldColumn(
                      'Expiry date',
                      'MM/YY',
                      MediaQuery.of(context).size.width / 2,
                      controller: cardExpirationController,
                      displayController: cardExpirationController,
                      type: TextInputType.number,
                      maxLength: 5,
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: buildTextFieldColumn(
                      'CVC',
                      '123',
                      MediaQuery.of(context).size.width / 2,
                      controller: cardCvcController,
                      displayController: cardCvcController,
                      type: TextInputType.number,
                      maxLength: 3,
    suffixIcon: Image.asset('assets/images/Hint.png'),
                    ),
                  ),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width * 0.14,
                decoration: BoxDecoration(
                  color: Color(0xff0acf83),
                  borderRadius: BorderRadius.circular(
                      MediaQuery.of(context).size.width * 0.02),
                ),
                child: Center(
                  child: Text(
                    'USE THIS CARD',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                      fontWeight: FontWeight.w600,
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextFieldColumn(String label, String hint, double? width,
      {required TextEditingController controller,
        required TextEditingController displayController,
        required type,
        int? maxLength,
        Widget? suffixIcon}) {
    double screenWidth = MediaQuery.of(context).size.width;

    List<TextInputFormatter> inputFormatters = [];

    if (label == 'Name on card') {
      inputFormatters.add(FilteringTextInputFormatter.singleLineFormatter);
    }
    if (label == 'Card number') {
      inputFormatters.add(CardNumberFormatter());
    }

    if (label == 'Expiry date') {
      inputFormatters.add(ExpiryDateFormatter());
    } else if (label == 'CVC') {
      inputFormatters.add(FilteringTextInputFormatter.digitsOnly);
    }

    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 0, screenWidth * 0.04),
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 15),
            child: Text(
              label,
              style: TextStyle(
                fontFamily: 'SF Pro Text',
                fontSize: 14,
                height: 22 / 14,
                letterSpacing: -0.41,
                fontWeight: FontWeight.w400,
                color: Color(0xff9586a8),
              ),
            ),
          ),
          Container(
            width: width,
            height: screenWidth * 0.14,
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xffd8d0e3)),
              color: Color(0xffffffff),
              borderRadius: BorderRadius.circular(screenWidth * 0.025),
            ),
            child: TextFormField(
              controller: controller,
              maxLength: maxLength,
              keyboardType: type,
              textCapitalization: TextCapitalization.characters,
              inputFormatters: inputFormatters,
              onChanged: (text) {
                displayController.text = text;
                setState(() {});
              },
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: TextStyle(
                  height: 2,
                  fontFamily: "SF Pro Text",
                  fontSize: 14,
                  letterSpacing: 0,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF9586A8),
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.fromLTRB(
                  screenWidth * 0.05,
                  screenWidth * 0.02,
                  screenWidth * 0.05,
                  screenWidth * 0.02,
                ),
                counterText: "",
                suffixIcon: suffixIcon, 
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ExpiryDateFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String formattedText = newValue.text;

    if (formattedText.length == 2 && newValue.selection.baseOffset == 2) {
      formattedText += '/';
    }

    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }
}

class CardNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String formattedText = newValue.text.replaceAll(RegExp(r'\D'), '');

    StringBuffer buffer = StringBuffer();
    for (int i = 0; i < formattedText.length; i++) {
      buffer.write(formattedText[i]);
      int index = i + 1;
      if (index % 4 == 0 && formattedText.length != index) {
        buffer.write(" ");
      }
    }

    return TextEditingValue(
        text: buffer.toString(), selection: TextSelection.collapsed(offset: buffer.length));
  }
}
