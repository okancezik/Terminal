import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:narposterminal/constant/appconstants.dart';
import 'package:narposterminal/screens/login.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:narposterminal/utilities/translationoperations.dart';

class LicencePage extends StatefulWidget {
  const LicencePage({super.key});

  @override
  State<LicencePage> createState() => _LicencePageState();
}

class _LicencePageState extends State<LicencePage> {
  List<String> _languages = ["TR", "EN"];
  String _selectedLanguage = "TR";
  final TranslationHelper translationHelper = TranslationHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 25, left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [Spacer(), getTranslationsButton(context)],
              ),
              AppConstant().logoImage,
              Form(
                  child: Column(
                children: [
                  getUsernameTextFormField(),
                  SizedBox(
                    height: 20,
                  ),
                  getPasswordTextFormField(),
                  SizedBox(
                    height: 40,
                  ),
                  getElevatedButton()
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }

  Widget getUsernameTextFormField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: "username".tr(),
      ),
      style: TextStyle(fontSize: 26),
      textAlign: TextAlign.center,
    );
  }

  Widget getPasswordTextFormField() {
    return StreamBuilder<String>(
      stream: translationHelper.translationstream,
      builder: (context, snapshot) {
        return TextFormField(
          keyboardType: TextInputType.number,
          obscureText: true,
          decoration: InputDecoration(
            hintText: "password".tr(),
          ),
          style: TextStyle(fontSize: 26),
          textAlign: TextAlign.center,
        );
      },
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
                return LogInPage();
              },
            ));
          },
          child: StreamBuilder(
            stream: translationHelper.translationstream,
            builder: (context, snapshot) {
              return Text(
                "takealicence".tr(),
                style: TextStyle(fontSize: 26),
              );
            },
          )),
    );
  }

  Widget getTranslationsButton(context) {
    return DropdownButton2<String>(
      icon: Icon(Icons.translate),
      value: _selectedLanguage,
      items: _languages.map<DropdownMenuItem<String>>((e) {
        return DropdownMenuItem(
          child: Text(e),
          value: e,
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          _selectedLanguage = value!;
          if (_selectedLanguage.toLowerCase() == "en") {
            translationHelper.handleTranslationEn(context);
          } else {
            translationHelper.handleTranslationTr(context);
          }
        });
      },
    );
  }
}
