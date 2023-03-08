import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:narposterminal/screens/menu.dart';
import 'package:narposterminal/screens/selectcustomer.dart';
import 'package:narposterminal/screens/statustable.dart';
import 'package:narposterminal/utilities/statetable.dart';
import 'package:narposterminal/widgets/tablesearch.dart';

class TablePage extends StatefulWidget {
  final String title;
  const TablePage({super.key, required this.title});

  @override
  State<TablePage> createState() => _TablePageState();
}

class _TablePageState extends State<TablePage> {
  final ColorOfTable _colorTable = ColorOfTable();
  List<String> _tableList = ["M1", "M2", "M3", "M4", "M5"];

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
                "${widget.title}",
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
        bottomNavigationBar: getBottomNavBar());
  }

  Color setColorOfTable(int index) {
    return _colorTable.handleFull();
  }

  void _showSearchTable() {
    showSearch(context: context, delegate: TableSearch());
  }

  Widget getTables(index) {
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

  Widget getBottomNavBar() {
    return Container(
      color: Color.fromARGB(248, 237, 212, 136),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
              onPressed: () {
                return Navigator.of(context).pop();
              },
              child: Text(
                "departmant".tr(),
                style: TextStyle(fontSize: 20, color: Colors.black),
                textAlign: TextAlign.center,
              ))
        ],
      ),
    );
  }
}
