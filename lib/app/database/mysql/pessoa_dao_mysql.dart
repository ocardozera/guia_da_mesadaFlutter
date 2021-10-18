import 'dart:convert';

import 'package:guia_da_mesada/app/domain/entities/interfaces/pessoa_dao.dart';
import 'package:guia_da_mesada/app/domain/entities/pessoa.dart';
import 'package:http/http.dart' as http;

class PessoaDAOMySQL implements PessoaDAO {
  final urlREST = Uri.parse('http://192.168.0.103:8080/pessoa');

  @override
  Future<List<Pessoa>> find() async {
    var resposta = await http.get(urlREST);
    if (resposta.statusCode != 200) {
      throw Exception('Erro RestAPI.');
    }
    Iterable listDart = json.decode(resposta.body);

    var listPessoa = <Pessoa>[];
    listDart.forEach((item) {
      var pessoa = Pessoa(
          id: item['id'],
          nome: item['nome'],
          dataNasc: item['dataNasc'],
          usuario: item['usuario'],
          senha: item['senha'],
          sexo: item['sexo']);

      listPessoa.add(pessoa);
    });

    return listPessoa;
  }

  @override
  remove(int id) async {
    var url = Uri.parse('http://192.168.0.103:8080/pessoa/$id');
    var resposta = await http.delete(url);

    if (resposta.statusCode != 200) {
      throw Exception('Erro RestAPI.');
    }
  }

  @override
  save(Pessoa pessoa) async {
    var headers = {'Content-Type': 'application/json'};

    var pessoaJson = json.encode({
      'id': pessoa.id,
      'nome': pessoa.nome,
      'dataNasc': pessoa.dataNasc,
      'usuario': pessoa.usuario,
      'senha': pessoa.senha,
      'sexo': pessoa.sexo
    });

    int statusCode = 0;
    if (pessoa.id == null) {
      var resposta =
          await http.post(urlREST, headers: headers, body: pessoaJson);
      statusCode = resposta.statusCode;
    } else {
      var resposta =
          await http.put(urlREST, headers: headers, body: pessoaJson);
      statusCode = resposta.statusCode;
    }

    if (statusCode != 200) {
      throw Exception('Erro RestAPI.');
    }
  }
}
