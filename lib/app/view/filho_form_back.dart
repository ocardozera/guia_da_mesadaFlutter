import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:guia_da_mesada/app/domain/entities/filho.dart';
import 'package:guia_da_mesada/app/domain/services/filho_service.dart';
import 'package:mobx/mobx.dart';

part 'filho_form_back.g.dart';

class FilhoFormBack = _FilhoFormBack with _$FilhoFormBack;

abstract class _FilhoFormBack with Store {
  Filho filho;
  var _service = GetIt.I.get<FilhoService>();
  bool _nomeValido;
  bool _dataNascValida;
  bool _usuarioValido;
  bool _senhaValida;

  @action
  bool get estaValido =>
      _nomeValido && _dataNascValida && _usuarioValido && _senhaValida;

// diferenciar novo com alteração
  _FilhoFormBack(BuildContext context) {
    var parametro = ModalRoute.of(context).settings.arguments;
    filho = (parametro == null) ? Filho() : parametro;
  }

// salvar
  save() async {
    await _service.save(filho);
  }

// validações
  String validarNome(String nome) {
    try {
      _service.validateName(nome);
      _nomeValido = true;
      return null;
    } catch (e) {
      _nomeValido = false;
      return e.toString();
    }
  }

  String validarDataNasc(DateTime dataNasc) {
    try {
      _service.validadeDataNasc(dataNasc);
      _dataNascValida = true;
      return null;
    } catch (e) {
      _dataNascValida = false;
      return e.toString();
    }
  }

  String validarUsuario(String usuario) {
    try {
      _service.validateUsuario(usuario);
      _usuarioValido = true;
      return null;
    } catch (e) {
      _usuarioValido = false;
      return e.toString();
    }
  }

  String validarSenha(String senha) {
    try {
      _service.validateUsuario(senha);
      _senhaValida = true;
      return null;
    } catch (e) {
      _senhaValida = false;
      return e.toString();
    }
  }
}
