import 'package:flutter/material.dart';

class FilhosForm extends StatefulWidget {

  @override
  _FilhosFormState createState() => _FilhosFormState();
}

class _FilhosFormState extends State<FilhosForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Filhos')
      )
    );
  }
}