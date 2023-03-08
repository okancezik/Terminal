import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:narposterminal/screens/menu.dart';
import 'package:narposterminal/screens/selectcustomer.dart';
import 'package:narposterminal/screens/selecttable.dart';
import 'package:narposterminal/screens/tables.dart';

class StatusTablePage extends StatefulWidget {
  final String title;
  const StatusTablePage({super.key, required this.title});

  @override
  State<StatusTablePage> createState() => _StatusTablePageState();
}

class _StatusTablePageState extends State<StatusTablePage> {
  List<String> _operationsTable = [
    "Müşteri Seç",
    "Marş",
    "Hesap Yaz",
    "Hizmet",
    "Kişi Sayısı",
    "Fiyat Değiştir",
    "Ürün Ekle",
    "Adisyon Notu",
    "Masa Değiştir"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Expanded(
          child: Row(
            children: [
              Image.asset(
                "assets/images/logo.png",
                width: 180,
              ),
              Spacer(),
              Text(
                "${widget.title}",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              )
            ],
          ),
        ),
      ),
      body: Row(
        children: [
          SingleChildScrollView(
            child: Column(children: [
              GestureDetector(
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: 110,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      border: Border.all(color: Colors.white, width: 1)),
                  child: Text(
                    "Müşteri Seç",
                    textAlign: TextAlign.center,
                  ),
                ),
                onTap: (() {
                  Navigator.of(context).push(CupertinoPageRoute(
                    builder: (context) {
                      return SelectCustomerPage();
                    },
                  ));
                }),
              ),
              GestureDetector(
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: 110,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      border: Border.all(color: Colors.white, width: 1)),
                  child: Text(
                    "Hesap Yaz",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ),
                onTap: (() {
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Hesap yazdırıldı"),
                    duration: Duration(seconds: 2),
                    elevation: 12,
                  ));
                }),
              ),
              GestureDetector(
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: 110,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      border: Border.all(color: Colors.white, width: 1)),
                  child: Text(
                    "Hizmet",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ),
                onTap: (() {
                  Navigator.of(context).push(CupertinoPageRoute(
                    builder: (context) {
                      return SelectCustomerPage();
                    },
                  ));
                }),
              ),
              GestureDetector(
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: 110,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      border: Border.all(color: Colors.white, width: 1)),
                  child: Text(
                    "Kişi Sayısı",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ),
                onTap: (() {
                  Navigator.of(context).push(CupertinoPageRoute(
                    builder: (context) {
                      return SelectCustomerPage();
                    },
                  ));
                }),
              ),
              GestureDetector(
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: 110,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      border: Border.all(color: Colors.white, width: 1)),
                  child: Text(
                    "Fiyat Değiştir",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ),
                onTap: (() {
                  Navigator.of(context).push(CupertinoPageRoute(
                    builder: (context) {
                      return SelectCustomerPage();
                    },
                  ));
                }),
              ),
              GestureDetector(
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: 110,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      border: Border.all(color: Colors.white, width: 1)),
                  child: Text(
                    "Ürün Ekle",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ),
                onTap: (() {
                  Navigator.of(context).push(CupertinoPageRoute(
                    builder: (context) {
                      return MenuPage(title: widget.title);
                    },
                  ));
                }),
              ),
              GestureDetector(
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: 110,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      border: Border.all(color: Colors.white, width: 1)),
                  child: Text(
                    "Adisyon Notu",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ),
                onTap: (() {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Sipariş Notu"),
                        content: Form(
                            child: TextFormField(
                          keyboardType: TextInputType.text,
                          maxLines: 2,
                          decoration:
                              InputDecoration(hintText: "Notunuzu giriniz..."),
                        )),
                        actions: [
                          ButtonBar(
                            children: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text("İPTAL")),
                              TextButton(
                                  onPressed: () {
                                    //kaydetme işlemi yapılır
                                    Navigator.of(context).pop();
                                  },
                                  child: Text("KAYDET"))
                            ],
                          )
                        ],
                      );
                    },
                  );
                }),
              ),
              GestureDetector(
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: 110,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      border: Border.all(color: Colors.white, width: 1)),
                  child: Text(
                    "Masa Değiştir",
                    textAlign: TextAlign.center,
                  ),
                ),
                onTap: (() {
                  Navigator.of(context).push(CupertinoPageRoute(
                    builder: (context) {
                      return SelectTablePage();
                    },
                  ));
                }),
              ),
            ]),
          )
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SizedBox(
                  height: 40,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("ÖDEME AL"),
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  )),
            ),
            Expanded(
              child: SizedBox(
                  height: 40,
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("KAPAT"))),
            ),
          ],
        ),
      ),
    );
  }
}
