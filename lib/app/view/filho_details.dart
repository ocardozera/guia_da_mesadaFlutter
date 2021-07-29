import 'package:flutter/material.dart';
import 'package:guia_da_mesada/app/view/filho_details_back.dart';

class FilhoDetails extends StatelessWidget {
  var _back = FilhoDetailsBack(context);
  Filho filho = _back.filho;

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
                child: Text('${filho.nome}', style: TextStyle(fontSize: 30),),
              ),
              Card(
                child: ListTile(
                  title: Text('Data Nascimento: '),
                  subtitle: Text('${filho.dataNasc}'),
              )),
              Card(
                child: ListTile(
                  title: Text('Usuario: '),
                  subtitle: Text('${filho.usuario}'),
              )),
              Card(
                child: ListTile(
                  title: Text('Senha: '),
                  subtitle: Text('${filho.senha}'),
              )),
              Card(
                child: ListTile(
                  title: Text('Sexo: '),
                  subtitle: Text('${filho.sexo}'),
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