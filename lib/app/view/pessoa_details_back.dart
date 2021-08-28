

import 'package:flutter/cupertino.dart';

class PessoaDetailsBack() {
  BuildContext context;
  Pessoa pessoa;

  PessoaDetailsBack(this.context) {
    pessoa = ModalRoute.of(context).settings.arguments;
  };

  irParaBack() {
    Navigator.of(context).pop();
  }
}