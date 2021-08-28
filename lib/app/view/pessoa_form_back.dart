import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:guia_da_mesada/app/domain/entities/pessoa.dart';
import 'package:guia_da_mesada/app/domain/services/pessoa_service.dart';

class PessoaFormBack {
  Pessoa pessoa;
  var _service = GetIt.I.get<PessoaService>();
  bool _nomeValido;
  bool _dataNascValida;
  bool _usuarioValido;
  bool _senhaValida;

  bool get estaValido =>
      _nomeValido && _dataNascValida && _usuarioValido && _senhaValida;

// diferenciar novo com alteração
  PessoaFormBack(BuildContext context) {
    var parametro = ModalRoute.of(context).settings.arguments;
    pessoa = (parametro == null) ? Pessoa() : parametro;
  }

// salvar
  save() async {
    await _service.save(pessoa);
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
