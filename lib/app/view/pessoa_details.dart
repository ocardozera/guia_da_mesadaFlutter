import 'package:flutter/material.dart';
import 'package:guia_da_mesada/app/view/pessoa_details_back.dart';

class PessoaDetails extends StatelessWidget {
  var _back = PessoaDetailsBack(context);
  Pessoa pessoa = _back.pessoa;

  const ({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints){

        //var width = constraints.biggest.width;
        //var height = constraints.biggest.height;

        return Scaffold(
          body: ListView(
            children: [
              Center(
                child: Text('${pessoa.nome}', style: TextStyle(fontSize: 30),),
              ),
              Card(
                child: ListTile(
                  title: Text('Data Nascimento: '),
                  subtitle: Text('${pessoa.dataNasc}'),
              )),
              Card(
                child: ListTile(
                  title: Text('Usuario: '),
                  subtitle: Text('${pessoa.usuario}'),
              )),
              Card(
                child: ListTile(
                  title: Text('Senha: '),
                  subtitle: Text('${pessoa.senha}'),
              )),
              Card(
                child: ListTile(
                  title: Text('Sexo: '),
                  subtitle: Text('${pessoa.sexo}'),
              )),
            ],
          )
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.arrow_back),
            onPressed: (){
              _back.irParaBack();
              
            },
          )
        );

      },
      
    );
  }
}