

import 'package:flutter/cupertino.dart';

class FilhoDetailsBack() {
  BuildContext context;
  Filho filho;

  FilhoDetailsBack(this.context) {
    filho = ModalRoute.of(context).settings.arguments;
  };

  irParaBack() {
    Navigator.of(context).pop();
  }
}