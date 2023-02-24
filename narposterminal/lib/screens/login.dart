import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:narposterminal/constant/appconstants.dart';
import 'package:narposterminal/screens/department.dart';
import 'package:narposterminal/utilities/translationoperations.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final TranslationHelper translationHelper = TranslationHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppConstant().logoImage,
              SizedBox(
                height: 20,
              ),
              getTextFormField(),
              SizedBox(
                height: 40,
              ),
              getElevatedButton()
            ],
          ),
        ),
      ),
    );
  }

  Widget getTextFormField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      obscureText: true,
      decoration: InputDecoration(
        hintText: "password".tr(),
      ),
      style: TextStyle(fontSize: 26),
      textAlign: TextAlign.center,
    );
  }

  Widget getElevatedButton() {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: AppConstant().mainColor),
          onPressed: () {
            Navigator.of(context).push(CupertinoPageRoute(
              builder: (context) {
                return DepartmentPage();
              },
            ));
          },
          child: Text(
            "enterbutton".tr(),
            style: TextStyle(fontSize: 26),
          )),
    );
  }
}
