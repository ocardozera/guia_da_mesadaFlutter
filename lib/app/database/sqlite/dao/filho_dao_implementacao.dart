
import 'package:guia_da_mesada/app/domain/entities/filho.dart';
import 'package:guia_da_mesada/app/domain/entities/interfaces/filho_dao.dart';
import 'package:sqflite/sqflite.dart';

import '../connection.dart';

class FilhoDAOImplementacao implements FilhoDAO{
  Database _db;




  @override
  Future<List<Filho>> find() async {
    _db = await Connection.get();
    List<Map<String, dynamic>> listaEncontrada = await _db.query('filho');
    List<Filho> lista = List.generate(listaEncontrada.length, (i) {
      var linha = listaEncontrada[i];
      return Filho (
        id: linha['id'],
        nome: linha['nome'],
        dataNasc: linha['dataNasc'],
        usuario: linha['usuario'],
        senha: linha['senha'],
        sexo: linha['sexo']

    );
    }
    );
    return lista;
  }

  @override
  remove(int id) async {
    _db = await Connection.get();
    var sql = 'DELETE FROM filho WHERE id = ?';
    _db.rawDelete(sql, [id]);
    }
  
    @override
    save(Filho filho) async {
      _db = await Connection.get();
      var sql;

      if (filho.id == null) {
        sql = 'INSERT INTO filho (nome, dataNasc, usuario, senha, sexo) VALUES (?,?,?,?,?)';
        _db.rawInsert(sql, [filho.nome, filho.dataNasc, filho.usuario, filho.senha, filho.sexo]);

      } else {
        sql = 'UPDATE filho SET nome = ?, dataNasc = ?, usuario = ?, senha = ?, sexo = ? WHERE id = ?';
        _db.rawUpdate(sql, [filho.nome, filho.dataNasc, filho.usuario, filho.senha, filho.sexo, filho.id]);
      }


  }
  
}