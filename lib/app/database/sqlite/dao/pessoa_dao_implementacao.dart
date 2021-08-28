import 'package:guia_da_mesada/app/domain/entities/pessoa.dart';
import 'package:guia_da_mesada/app/domain/entities/interfaces/pessoa_dao.dart';
import 'package:sqflite/sqflite.dart';

import '../connection.dart';

class PessoaDAOImplementacao implements PessoaDAO {
  Database _db;

  @override
  Future<List<Pessoa>> find() async {
    _db = await Connection.get();
    List<Map<String, dynamic>> listaEncontrada = await _db.query('pessoa');
    List<Pessoa> lista = List.generate(listaEncontrada.length, (i) {
      var linha = listaEncontrada[i];
      return Pessoa(
          id: linha['id'],
          nome: linha['nome'],
          dataNasc: linha['dataNasc'],
          usuario: linha['usuario'],
          senha: linha['senha'],
          sexo: linha['sexo']);
    });
    return lista;
  }

  @override
  remove(int id) async {
    _db = await Connection.get();
    var sql = 'DELETE FROM pessoa WHERE id = ?';
    _db.rawDelete(sql, [id]);
  }

  @override
  save(Pessoa pessoa) async {
    _db = await Connection.get();
    var sql;

    if (pessoa.id == null) {
      sql =
          'INSERT INTO pessoa (nome, dataNasc, usuario, senha, sexo) VALUES (?,?,?,?,?)';
      _db.rawInsert(sql, [
        pessoa.nome,
        pessoa.dataNasc,
        pessoa.usuario,
        pessoa.senha,
        pessoa.sexo
      ]);
    } else {
      sql =
          'UPDATE pessoa SET nome = ?, dataNasc = ?, usuario = ?, senha = ?, sexo = ? WHERE id = ?';
      _db.rawUpdate(sql, [
        pessoa.nome,
        pessoa.dataNasc,
        pessoa.usuario,
        pessoa.senha,
        pessoa.sexo,
        pessoa.id
      ]);
    }
  }
}
