import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:guia_da_mesada/app/domain/entities/pessoa.dart';
import 'package:guia_da_mesada/app/domain/services/pessoa_service.dart';
import 'package:mobx/mobx.dart';

import '../my_app.dart';

part 'pessoas_list_back.g.dart';

class PessoaListBack = _PessoaListBack with _$PessoaListBack;

abstract class _PessoasListBack with Store {
  var _service = GetIt.I.get<PessoaService>();

  //lista de pessoas
  @observable
  Future<List<Pessoa>> listaPessoas;

  // metodo de atualizacao lista de pessoas
  @action
  atualizarListaPessoas([dynamic value]) {
    listaPessoas = _service.find();
  }

  _PessoaListBack() {
    atualizarListaPessoas();
  }

  //metodo p chamar form (salvar/alterar)
  chamarFormulario(BuildContext context, [Pessoa pessoa]) {
    Navigator.of(context)
        .pushNamed(MyApp.PESSOAS_FORM, arguments: pessoa)
        .then(atualizarListaPessoas);
  }

  chamarDetalhePessoa(BuildContext context, Pessoa pessoa) {
    Navigator.of(context).pushNamed(MyApp.PESSOA_DETAILS, arguments: pessoa);
  }

  //metodo excluir
  excluirPessoa(int id) {
    _service.remove(id);
    atualizarListaPessoas();
  }
}
