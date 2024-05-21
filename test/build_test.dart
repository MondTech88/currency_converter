import 'package:flutter/material.dart';

class CurrencyConverterMpage extends StatefulWidget {
  const CurrencyConverterMpage({super.key});

  @override
  State<CurrencyConverterMpage> createState() {
    return _CurrencyConverterMpageState();
  }
}

class _CurrencyConverterMpageState extends State<CurrencyConverterMpage> {
  double convertedCurrency = 0.0;
  final oneDollar = 500;
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Color.fromARGB(255, 61, 76, 85),
        width: 2.0,
      ),
      borderRadius: BorderRadius.all(Radius.circular(12.0)),
    );

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 47, 65, 90),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 47, 65, 90),
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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: Text(
                  "$convertedCurrency FCFA",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Color.fromARGB(255, 194, 213, 218),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(13, 25, 13, 17),
                child: TextField(
                  controller: textController,
                  decoration: const InputDecoration(
                    hintText: "Please enter the amount in Dollar",
                    hintStyle: TextStyle(
                      color: Color.fromRGBO(120, 123, 124, 0.9),
                    ),
                    prefixIcon: Icon(
                      Icons.monetization_on_outlined,
                      color: Color.fromARGB(198, 40, 44, 48),
                      size: 35,
                    ),
                    filled: true,
                    fillColor: Color.fromARGB(255, 185, 196, 216),
                    focusedBorder: border,
                    enabledBorder: border,
                  ),
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(onPressed: () {}, child: const Text("1")),
                  ElevatedButton(onPressed: () {}, child: const Text("2")),
                  ElevatedButton(onPressed: () {}, child: const Text("3")),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        convertedCurrency =
                            double.parse(textController.text) * oneDollar;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 53, 76, 141),
                      foregroundColor: const Color.fromARGB(170, 207, 215, 219),
                      minimumSize: const Size(double.infinity, 55),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      ),
                    ),
                    child: const Text(
                      "Convert",
                      style: TextStyle(
                        fontSize: 20,
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
