import 'package:flutter/material.dart';
import 'package:guia_da_mesada/app/view/filho_form_back.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class FilhoForm extends StatelessWidget {
  const FilhoForm({ Key? key }) : super(key: key);
    
  final _form = GlobalKey<FormState>();

  Widget fieldName(FilhoFormBack back) {
    return TextFormField(
      validator: back.validarNome,
      onSaved: (newValue) => back.filho.nome = newValue,
      initialValue: back.filho.nome,
      decoration: InputDecoration (
        labelText: 'Nome:'
      )
    );
  }

  Widget fieldDataNasc(FilhoFormBack back) {
    var mascara = MaskTextInputFormatter(mask: '##/##/####');
    return TextFormField(
      validator: back.validarDataNasc,
      onSaved: (newValue) => back.filho.dataNasc = newValue,
      initialValue: back.filho.dataNasc,
      decoration: InputDecoration (
        inputFormatters: [mascara],
        keyboardType: TextInputType.number,
        labelText: 'Data de nascimento:',
        hintText: '01/01/1999'
      )
    );
  }

  Widget fieldUsuario(FilhoFormBack back) {
    return TextFormField(
      validator: back.validarUsuario,
      onSaved: (newValue) => back.filho.usuario = newValue,
      initialValue: back.filho.usuario,
      decoration: InputDecoration (
        labelText: 'Usuário:'
      )
    );
  } 

  Widget fieldSenha(FilhoFormBack back) {
    return TextFormField(
      validator: back.validarSenha,
      onSaved: (newValue) => back.filho.senha = newValue,
      initialValue: back.filho.senha,
      decoration: InputDecoration (
        labelText: 'Senha:'
      )
    );
  }

  Widget fieldSexo(FilhoFormBack back) {
    return TextFormField(
      initialValue: back.filho.sexo,
      decoration: InputDecoration (
        labelText: 'Sexo: '
      )
    );
  }



  @override
  Widget build(BuildContext context) {
    var _back = FilhoFormBack(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro de filhos"),
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