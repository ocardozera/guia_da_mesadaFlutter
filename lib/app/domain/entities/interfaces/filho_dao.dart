import '../filho.dart';

abstract class FilhoDAO{
  // definimos o que um DAO deve fazer

  save(Filho filho); //salvar e alterar

  remove(int id); //deletar

  Future<List<Filho>> find(); //buscar
}