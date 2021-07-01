import 'package:flutter/material.dart';
import 'package:guia_da_mesada/app/database/sqlite/connection.dart';
import 'package:guia_da_mesada/app/database/sqlite/dao/filho_dao_implementacao.dart';
import 'package:guia_da_mesada/app/domain/entities/filho.dart';
import 'package:sqflite/sqflite.dart';

import '../my_app.dart';

class FilhosLista extends StatelessWidget {

  Future<List<Filho>> _buscarFilhos() async {
    return FilhoDAOImplementacao().find();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _buscarFilhos(),
      builder: (context, futuro) {
        if (futuro.hasData) {
          List<Filho> lista = futuro.data;

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
                      title: Text(filho.nome),
                      subtitle: Text(filho.dataNasc.toString()),
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