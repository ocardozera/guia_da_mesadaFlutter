import 'package:flutter/material.dart';

import '../my_app.dart';

class FilhosLista extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Filhos'),
        actions: [
          IconButton(
            icon: Icon(Icons.add_circle), 
            onPressed: (){
              Navigator.of(context).pushNamed(MyApp.FILHOS_FORM);
            }
            )
        ],
      ),
      body: ListView(),

    );
  }
}