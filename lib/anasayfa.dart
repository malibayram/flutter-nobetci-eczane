import 'package:eczane/detay_sayfa.dart';
import 'package:flutter/material.dart';

import './iller.dart';

class Anasayfa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nöbetçi Eczaneler"),
      ),
      body: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3,
        ),
        children: [
          for (Map<String, String> ilMap in iller)
            Card(
              child: InkWell(
                onTap: () {
                  print(ilMap.keys.first);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (ctx) => DetaySayfa(im: ilMap),
                    ),
                  );
                },
                child: Center(
                  child: Text(ilMap.values.first),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
