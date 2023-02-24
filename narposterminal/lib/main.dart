import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:narposterminal/screens/department.dart';
import 'package:narposterminal/screens/licence.dart';
import 'package:narposterminal/screens/login.dart';
import 'package:narposterminal/screens/tables.dart';
import 'package:narposterminal/utilities/translation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
        supportedLocales: const [Locale('en', 'US'), Locale('tr', 'TR')],
        path:
            'assets/translations', // <-- change the path of the translation files
        fallbackLocale: const Locale('en', 'US'),
        child:const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    //TranslationsHelper2.setDeviceLanguage(context,"en");

    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale, //BURASI
      title: 'Flutter Demo',
      theme: ThemeData(brightness: Brightness.light, primarySwatch: Colors.red),
      home: LicencePage(parentContext: context,),
      debugShowCheckedModeBanner: false,
    );
  }
}

