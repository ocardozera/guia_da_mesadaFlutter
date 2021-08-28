import '../pessoa.dart';

abstract class PessoaDAO {
  // definimos o que um DAO deve fazer

  save(Pessoa pessoa); //salvar e alterar

  remove(int id); //deletar

  Future<List<Pessoa>> find(); //buscar
}
