import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:guia_da_mesada/app/domain/entities/filho.dart';
import 'package:guia_da_mesada/app/domain/services/filho_service.dart';
import 'package:mobx/mobx.dart';

import '../my_app.dart';

part 'filhos_list_back.g.dart';

class FilhoListBack = _FilhoListBack with _$FilhoListBack;

abstract class _FilhosListBack with Store{
  var _service = GetIt.I.get<FilhoService>();

  //lista de filhos
  @observable
  Future<List<Filho>> listaFilhos;
  
  // metodo de atualizacao lista filhos
  @action
  atualizarListaFilhos([dynamic value]) {
    listaFilhos = _service.find();
  }

  _FilhoListBack() {
    atualizarListaFilhos();
  }
  //metodo p chamar form (salvar/alterar)
  chamarFormulario(BuildContext context, [Filho filho]) {
    Navigator.of(context).pushNamed(MyApp.FILHOS_FORM, arguments: filho).then(atualizarListaFilhos);
  }

  //metodo excluir
  excluirFilho(int id) {
    _service.remove(id);
    atualizarListaFilhos();
  }

}