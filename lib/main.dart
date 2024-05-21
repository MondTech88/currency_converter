import 'package:flutter/material.dart';

import 'currency_converter_mpage.dart';

void main() {
  return runApp(const HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CurrencyConverterMpage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
