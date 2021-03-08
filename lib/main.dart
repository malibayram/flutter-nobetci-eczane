import 'package:flutter/material.dart';

import './anasayfa.dart';

void main() {
  runApp(AnaGiris());
}

class AnaGiris extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Anasayfa(),
    );
  }
}
