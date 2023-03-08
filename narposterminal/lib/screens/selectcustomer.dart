import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:narposterminal/constant/appconstants.dart';

class SelectCustomerPage extends StatefulWidget {
  const SelectCustomerPage({super.key});

  @override
  State<SelectCustomerPage> createState() => _SelectCustomerPageState();
}

class _SelectCustomerPageState extends State<SelectCustomerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: Text(
            "selectcustomer".tr(),
            style: TextStyle(color: Colors.black),
          )),
      body: Form(
          child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            Text("openaccount".tr(),
                style: TextStyle(color: AppConstant().mainColor)),
            TextFormField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(hintText: "namecustomer".tr()),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(hintText: "phonecustomer".tr()),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(hintText: "addresscustomer".tr()),
            ),
            SizedBox(height: 15,),
            SizedBox(
              height: 35,
              width: double.infinity,
              child: ElevatedButton(onPressed: () {
                
              }, 
              child: Text("searchcustomer".tr(), style: TextStyle(fontSize: 17),),
              style: ElevatedButton.styleFrom(backgroundColor: AppConstant().mainColor,foregroundColor: Colors.white),),
            )
          ],
          
        ),
      )),
      bottomNavigationBar: Row(
        children: [
          Divider(),
          Spacer(),
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                "cancel".tr(),
                style: TextStyle(fontSize: 16, color: AppConstant().mainColor),
              ))
        ],
      ),
    );
  }
}
