import 'package:get_it/get_it.dart';
import 'package:guia_da_mesada/app/database/mysql/pessoa_dao_mysql.dart';
import 'package:guia_da_mesada/app/database/sqlite/dao/pessoa_dao_implementacao.dart';
import 'package:guia_da_mesada/app/domain/entities/interfaces/pessoa_dao.dart';
import 'package:guia_da_mesada/app/domain/services/pessoa_service.dart';

setupInjection() {
  GetIt getIt = GetIt.I;

  getIt.registerSingleton<PessoaDAO>(PessoaDAOMySQL());
  getIt.registerSingleton<PessoaService>(PessoaService());
}
