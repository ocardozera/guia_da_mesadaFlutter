import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:guia_da_mesada/app/database/sqlite/connection.dart';
import 'package:guia_da_mesada/app/database/sqlite/dao/pessoa_dao_implementacao.dart';
import 'package:guia_da_mesada/app/domain/entities/pessoa.dart';
import 'package:guia_da_mesada/app/view/pessoas_list_back.dart';
import 'package:sqflite/sqflite.dart';

import '../my_app.dart';

class PessoasLista extends StatelessWidget {
  final _back = PessoaListBack();

  Widget botaoEditar(Function onPressed) {
    return IconButton(
        onPressed: onPressed, icon: Icon(Icons.edit), color: Colors.orange);
  }

  Widget botaoExcluir(BuildContext context, Function remove) {
    return IconButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: Text('Excluir'),
                    content: Text('Confirmar a exclusão?'),
                    actions: [
                      // ignore: deprecated_member_use
                      FlatButton(
                        child: Text('Não'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      // ignore: deprecated_member_use
                      FlatButton(child: Text('Sim'), onPressed: remove),
                    ],
                  ));
        },
        icon: Icon(Icons.delete),
        color: Colors.red);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Lista de Pessoas'),
          actions: [
            IconButton(
                icon: Icon(Icons.add_circle),
                onPressed: () {
                  _back.chamarFormulario(context);
                })
          ],
        ),
        body: Observer(builder: (context) {
          return FutureBuilder(
              future: _back.listaPessoas,
              builder: (context, futuro) {
                if (!futuro.hasData) {
                  return CircularProgressIndicator();
                } else {
                  List<Pessoa> lista = futuro.data;
                  return ListView.builder(
                      itemCount: lista.length,
                      itemBuilder: (context, i) {
                        var pessoa = lista[i];
                        return ListTile(
                            title: Text(pessoa.nome),
                            onTap: () {
                              _back.chamarDetalhePessoa(context, pessoa);
                            },
                            subtitle: Text(pessoa.dataNasc.toString()),
                            trailing: Container(
                                width: 100,
                                child: Row(children: [
                                  botaoEditar(() {
                                    _back.chamarFormulario(context, pessoa);
                                  }),
                                  botaoExcluir(context, () {
                                    _back.excluirPessoa(pessoa.id);
                                    Navigator.of(context).pop();
                                  })
                                ])));
                      });
                }
              });
        }));
  }
}
