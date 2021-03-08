import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import './eczane.dart';

class DetaySayfa extends StatefulWidget {
  final Map<String, String> im;

  const DetaySayfa({@required this.im});

  @override
  _DetaySayfaState createState() => _DetaySayfaState();
}

class _DetaySayfaState extends State<DetaySayfa> {
  List<Eczane> _eczaneListesi = [];

  Future _httpIstekYap(String ilKodu) async {
    http.Response cevap =
        await http.get("http://api.kodlama.net/eczane/il/$ilKodu");

    print(cevap.statusCode);
    if (cevap.statusCode == 200) {
      Map icCevap = jsonDecode(utf8.decode(cevap.bodyBytes));
      if (icCevap["success"]) {
        _eczaneListesi = icCevap["data"]
            .map((e) => Eczane.fromJson(e))
            .toList()
            .cast<Eczane>();
        setState(() {});
      }
    }
  }

  @override
  void initState() {
    _httpIstekYap(widget.im.keys.first);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.im.values.first),
      ),
      body: Center(
        child: Column(
          children: [
            RaisedButton(
              onPressed: () => _httpIstekYap(widget.im.keys.first),
              child: Text("İstek Yap"),
            ),
            Expanded(
              child: ListView(
                children: [
                  for (Eczane eczane in _eczaneListesi)
                    Card(
                      child: ListTile(
                        title: Text(eczane.eczaneAdi),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("İlçe: ${eczane.eczaneIlce}"),
                            Text(eczane.eczaneAdres),
                            Text("Tel: ${eczane.eczaneTelefon}"),
                          ],
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.phone),
                          onPressed: () {
                            print(
                              "tel:${eczane.eczaneTelefon} numarası arandı",
                            );
                          },
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
