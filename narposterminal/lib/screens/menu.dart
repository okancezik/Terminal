import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:narposterminal/constant/appconstants.dart';
import 'package:narposterminal/widgets/productsearch.dart';

class MenuDeneme extends StatefulWidget {
  final String title;
  const MenuDeneme({super.key, required this.title});

  @override
  State<MenuDeneme> createState() => _MenuDenemeState();
}

class _MenuDenemeState extends State<MenuDeneme> {
  List<String> _mainMenuList = [
    "SADAKAT",
    "BURGERLER",
    "PİZZA",
    "KEBAP",
    "PİDE",
    "DÖNER",
    "SOSİSLİLER",
    "ATIŞTIRMALIK",
    "SICAK İÇECEKLER",
    "SOĞUK İÇECEKLER"
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
              IconButton(
                onPressed: () {
                  _showSearch();
                },
                icon: Icon(Icons.search),
                color: Colors.black,
              ),
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
            child: Column(
              children: [
                Column(
                  children: _mainMenuList.map((e) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 2.0),
                      child: GestureDetector(
                        child: Container(
                          alignment: Alignment.center,
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              border:
                                  Border.all(color: Colors.white, width: 1)),
                          child: Text(
                            "$e",
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        onTap: () {},
                      ),
                    );
                  }).toList(),
                )
              ],
            ),
          ),
          Column(
            children: [],
          )
        ],
      ),
      bottomNavigationBar: Container(
        color: AppConstant().mainColor,
        child: TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              "close".tr(),
              style: TextStyle(fontSize: 20, color: Colors.white),
            )),
      ),
    );
  }

  void _showSearch() {
    showSearch(
        context: context, delegate: ProductSearch(menuList: _mainMenuList));
  }
}
