import 'package:flutter/material.dart';
import 'package:guia_da_mesada/app/database/sqlite/connection.dart';
import 'package:sqflite/sqflite.dart';

import '../my_app.dart';

class FilhosLista extends StatelessWidget {

  Future <List<Map<String,dynamic>>> _buscarFilhos() async {
    Database db = await Connection.get();
    return db.query('filho');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _buscarFilhos(),
      builder: (context, futuro) {
        if (futuro.hasData) {
          var lista = futuro.data;

          return Scaffold(
            appBar: AppBar(
              title: Text('Lista de Filhos'),
              actions: [
                IconButton(
                  icon: Icon(Icons.add_circle), 
                  onPressed: (){
                    Navigator.of(context).pushNamed(MyApp.FILHOS_FORM);
                    })
                ],),
                  body: ListView.builder(
                  itemCount: lista.length,
                  itemBuilder: (context, i){
                    var filho = lista[i];
                    return ListTile(
                      title: Text(filho['nome']),
                      subtitle: Text(filho['dataNasc']),
                      trailing: Container(
                        width: 100,
                        child: Row(children: [
                          IconButton(icon: Icon(Icons.edit), onPressed: null),
                          IconButton(icon: Icon(Icons.delete), onPressed: null),
                          ],
                        ),
                      ),
                    );
                  },
                  ),
          );
        } else {
          return Scaffold();
        }
        

      }
    );
    
    
    
  }
}