import 'package:flutter/material.dart';
import 'package:guia_da_mesada/app/view/pessoa_form_back.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class PessoaForm extends StatelessWidget {
  const PessoaForm({ Key? key }) : super(key: key);
    
  final _form = GlobalKey<FormState>();

  Widget fieldName(PessoaFormBack back) {
    return TextFormField(
      validator: back.validarNome,
      onSaved: (newValue) => back.pessoa.nome = newValue,
      initialValue: back.pessoa.nome,
      decoration: InputDecoration (
        labelText: 'Nome:'
      )
    );
  }

  Widget fieldDataNasc(PessoaFormBack back) {
    var mascara = MaskTextInputFormatter(mask: '##/##/####');
    return TextFormField(
      validator: back.validarDataNasc,
      onSaved: (newValue) => back.pessoa.dataNasc = newValue,
      initialValue: back.pessoa.dataNasc,
      decoration: InputDecoration (
        inputFormatters: [mascara],
        keyboardType: TextInputType.number,
        labelText: 'Data de nascimento:',
        hintText: '01/01/1999'
      )
    );
  }

  Widget fieldUsuario(PessoaFormBack back) {
    return TextFormField(
      validator: back.validarUsuario,
      onSaved: (newValue) => back.pessoa.usuario = newValue,
      initialValue: back.pessoa.usuario,
      decoration: InputDecoration (
        labelText: 'Usuário:'
      )
    );
  } 

  Widget fieldSenha(PessoaFormBack back) {
    return TextFormField(
      validator: back.validarSenha,
      onSaved: (newValue) => back.pessoa.senha = newValue,
      initialValue: back.pessoa.senha,
      decoration: InputDecoration (
        labelText: 'Senha:'
      )
    );
  }

  Widget fieldSexo(PessoaFormBack back) {
    return TextFormField(
      initialValue: back.pessoa.sexo,
      decoration: InputDecoration (
        labelText: 'Sexo: '
      )
    );
  }



  @override
  Widget build(BuildContext context) {
    var _back = PessoaFormBack(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro de pessoas"),
        actions: [
          IconButton(icon: Icon(Icons.save), 
          onPressed: () {
            _form.currentState.validate();
            _form.currentState.save();
            if (_back.estaValido) {
              _back.save();
              Navigator.of(context).pop();
            }

          })
        ]
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Form(
          key: _form,
          child: Column(
            children: [
              fieldName(_back),
              fieldDataNasc(_back),
              fieldUsuario(_back),
              fieldSenha(_back),
              fieldSexo(_back)
            ]
          )
        )
      ),

      
    );
  }
}