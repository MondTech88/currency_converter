import 'package:flutter/material.dart';

import 'sizes/screen_size.dart';

class CurrencyConverterMpage extends StatefulWidget {
  const CurrencyConverterMpage({super.key});

  @override
  State<CurrencyConverterMpage> createState() {
    return _CurrencyConverterMpageState();
  }
}

class _CurrencyConverterMpageState extends State<CurrencyConverterMpage> {
  dynamic convertedCurrency = 0.0;
  final oneDollar = 612.4669;
  String money = "CFA";
  final textController = TextEditingController();
  Color convertedCurrencyColor = const Color.fromARGB(255, 194, 213, 218);

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = ScreenSize.width(context);
    const border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Color.fromARGB(255, 61, 76, 85),
        width: 2.0,
      ),
      borderRadius: BorderRadius.all(Radius.circular(12.0)),
    );

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 43, 58, 80),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 43, 58, 80),
        elevation: 0.0,
        centerTitle: true,
        title: const Text(
          "Currency Converter",
          style: TextStyle(
            color: Color.fromARGB(255, 175, 195, 223),
            fontSize: 22,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  text: "$convertedCurrency ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: convertedCurrencyColor,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: money,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(13, 25, 13, 17),
                child: SizedBox(
                  height: 65,
                  child: TextField(
                    style: const TextStyle(
                      color: Color.fromARGB(255, 46, 51, 51),
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                    controller: textController,
                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: true,
                      signed: false,
                    ),
                    decoration: const InputDecoration(
                      isDense: true,
                      hintText: "Please enter the amount in USD",
                      hintStyle: TextStyle(
                        color: Color.fromRGBO(0, 21, 27, 0.486),
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                      enabledBorder: border,
                      focusedBorder: border,
                      prefixIcon: Icon(
                        Icons.monetization_on_outlined,
                        color: Color.fromARGB(198, 40, 44, 48),
                        size: 35,
                      ),
                      filled: true,
                      fillColor: Color.fromARGB(255, 185, 196, 216),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(13, 0, 7, 0),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          money = "CFA";
                          convertedCurrency = 0.0;
                          convertedCurrencyColor =
                              const Color.fromARGB(255, 194, 213, 218);
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 87, 92, 99),
                        foregroundColor:
                            const Color.fromARGB(220, 215, 226, 228),
                        minimumSize: Size((screenWidth / 2) - 20, 55),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                      child: const Text(
                        "Clear",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(7, 0, 13, 0),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          try {
                            convertedCurrency =
                                oneDollar * (double.parse(textController.text));
                            money = "CFA";
                            convertedCurrencyColor =
                                const Color.fromARGB(255, 194, 213, 218);
                          } catch (e) {
                            convertedCurrency = "Bad Input";
                            money = "";
                            convertedCurrencyColor =
                                const Color.fromARGB(218, 196, 56, 56);
                          }
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 87, 92, 99),
                        foregroundColor:
                            const Color.fromARGB(220, 215, 226, 228),
                        minimumSize: Size((screenWidth / 2) - 20, 55),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                      child: const Text(
                        "Convert",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
