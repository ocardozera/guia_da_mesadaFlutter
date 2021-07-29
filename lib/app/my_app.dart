import 'package:flutter/material.dart';
import 'package:guia_da_mesada/app/view/filho_details.dart';
import 'package:guia_da_mesada/app/view/filhos_form.dart';
import 'package:guia_da_mesada/app/view/filhos_lista.dart';

class MyApp extends StatelessWidget {
  static const HOME = '/';
  static const FILHOS_FORM = 'filhos-form';
  static const FILHO_DETAILS = 'filho-details';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        routes: {
          HOME: (context) => FilhosLista(),
          FILHOS_FORM: (context) => FilhosForm()
          FILHO_DETAILS: (context) => FilhoDetails()
        });
  }
}
