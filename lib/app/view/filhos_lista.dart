import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:guia_da_mesada/app/database/sqlite/connection.dart';
import 'package:guia_da_mesada/app/database/sqlite/dao/filho_dao_implementacao.dart';
import 'package:guia_da_mesada/app/domain/entities/filho.dart';
import 'package:guia_da_mesada/app/view/filhos_list_back.dart';
import 'package:sqflite/sqflite.dart';

import '../my_app.dart';

class FilhosLista extends StatelessWidget {
  final _back = FilhoListBack();

  Widget botaoEditar(Function onPressed) {
    return IconButton(onPressed: onPressed, icon: Icon(Icons.edit), color: Colors.orange);
  }

  Widget botaoExcluir(BuildContext context, Function remove) {
    return IconButton(onPressed: (){
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Excluir'),
          content: Text('Confirmar a exclusão?'),
          actions: [
            FlatButton(child: Text('Não'), onPressed: (){
              Navigator.of(context).pop();
            },),
            FlatButton(child: Text('Sim'), onPressed: remove),
          ],
        )
      );
    }, icon: Icon(Icons.delete), color: Colors.red);
  }


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
      body: Observer(builder: (context){
        return FutureBuilder(
          future: _back.listaFilhos,
          builder: (context, futuro) {
            if (!futuro.hasData) {
              return CircularProgressIndicator();
            } else {
              List<Filho> lista = futuro.data;
              return ListView.builder(
                itemCount: lista.length,
                itemBuilder: (context, i) {
                  var filho = lista[i];
                  return ListTile(
                    title: Text(filho.nome),
                    subtitle: Text(filho.dataNasc.toString()),
                    trailing: Container(
                      width: 100,
                      child: Row(
                        children: [
                          botaoEditar( (){
                            _back.chamarFormulario(context, filho);
                          }),
                          botaoExcluir(context, (){
                            _back.excluirFilho(filho.id);
                            Navigator.of(context).pop();
                          })
                        ]
                      )
                    )
                  );
                }
              );
            }
          }
        );
      })
    );
  }







}