import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:narposterminal/constant/appconstants.dart';
import 'package:narposterminal/screens/tables.dart';

class DepartmentPage extends StatefulWidget {
  const DepartmentPage({super.key});

  @override
  State<DepartmentPage> createState() => _DepartmentPageState();
}

class _DepartmentPageState extends State<DepartmentPage> {
  List<String> _departments = [
    "RESTORAN",
    "GELAL",
    "PAKET",
    "YEMEKSEPETİ",
    "GETİR",
    "KİRAZMENU"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: AppConstant().logoImage,
      ),
      body: ListView.builder(
        itemCount: _departments.length,
        itemBuilder: (context, index) {
          return departmentList(index);
        },
      ),
    );
  }

  Widget departmentList(int index) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, left: 15, right: 15),
      child: SizedBox(
        height: 50,
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(CupertinoPageRoute(builder: (context) {
              return TablePage(title: _departments[index]);
            },));
          },
          child: Text(
            "${_departments[index]}",
            style: TextStyle(fontSize: 24),
            textAlign: TextAlign.center,
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppConstant().mainColor,
          ),
        ),
      ),
    );
  }
}
