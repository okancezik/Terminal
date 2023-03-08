import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:narposterminal/screens/statustable.dart';

import '../utilities/statetable.dart';

class SelectTablePage extends StatefulWidget {
  const SelectTablePage({super.key});

  @override
  State<SelectTablePage> createState() => _SelectTablePageState();
}

class _SelectTablePageState extends State<SelectTablePage> {
  List<String> _tableList = ["M1", "M2", "M3", "M4", "M5"];
  final ColorOfTable _colorTable = ColorOfTable();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Image.asset(
              "assets/images/logo.png",
              width: 200,
            ),
            Spacer(),
            IconButton(
              onPressed: () {
                _showSearchTable();
              },
              icon: Icon(Icons.search),
              color: Colors.black,
            ),
            Text(
              "Masa Seç",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            )
          ],
        ),
      ),
      body: GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemCount: _tableList.length,
        itemBuilder: (context, index) {
          return getTables(index);
        },
      ),
    );
  }

  void _showSearchTable() {}

  Widget getTables(int index) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: GestureDetector(
        onTap: () {
          _colorTable.handleEmpty();
          Navigator.of(context).push(CupertinoPageRoute(
            builder: (context) {
              // return MenuPage(
              //   title: "${widget.title} - ${_tableList[index]}",
              // );
              return StatusTablePage(title: "xyz");
            },
          ));
        },
        child: StreamBuilder(
          stream: _colorTable.stream,
          builder: (context, snapshot) {
            return Container(
              alignment: Alignment.center,
              color: snapshot.data,
              height: 10,
              child: Text(
                "${_tableList[index]}",
                style: TextStyle(
                  fontSize: 24,
                ),
                textAlign: TextAlign.center,
              ),
            );
          },
        ),
      ),
    );
  }
}
