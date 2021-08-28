//import 'package:guia_da_mesada/app/database/sqlite/dao/pessoa_dao_implementacao.dart';

import 'package:get_it/get_it.dart';
import 'package:guia_da_mesada/app/domain/entities/pessoa.dart';
import 'package:guia_da_mesada/app/domain/entities/interfaces/pessoa_dao.dart';
import 'package:guia_da_mesada/app/domain/exception/domain_layer_exception.dart';

class PessoaService {
  var _dao = GetIt.I.get<PessoaDAO>();
  // salvar um contato, possibilidade de alterar/excluir e listar todos os contatos
  save(Pessoa pessoa) {
    validateName(pessoa.nome);
    validadeDataNasc(pessoa.dataNasc);
    validateUsuario(pessoa.usuario);
    validateSenha(pessoa.senha);

    _dao.save(pessoa);
  }

  remove(int id) {
    _dao.remove(id);
  }

  Future<List<Pessoa>> find() {
    return _dao.find();
  }

  // nome - obrigatório e no mínimo 3 caracteres e no máximo 80
  validateName(String name) {
    var tamanhoMin = 3;
    var tamanhoMax = 50;

    if (name == null) {
      throw new DomainLayerException("O nome é obrigatório.");
    } else if (name.length < tamanhoMin) {
      throw new DomainLayerException(
          "O nome deve possuir no mínimo $tamanhoMin caracteres.");
    } else if (name.length > tamanhoMax) {
      throw new DomainLayerException(
          "O nome deve possuir no máximo $tamanhoMax caracteres.");
    }
  }

  // dataNascimento - obrigatorio
  validadeDataNasc(DateTime dataNasc) {
    if (dataNasc == null) {
      throw new DomainLayerException("A data de nascimento é obrigatória.");
    }
  }

  // usuario - obrigatorio
  validateUsuario(String usuario) {
    if (usuario == null) {
      throw new DomainLayerException("O usuário é obrigatório.");
    }
  }

  // senha - obrigatório
  validateSenha(String senha) {
    if (senha == null) {
      throw new DomainLayerException("A senha é obrigatória.");
    }
  }
}
