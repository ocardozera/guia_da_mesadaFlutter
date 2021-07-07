import 'package:get_it/get_it.dart';
import 'package:guia_da_mesada/app/database/sqlite/dao/filho_dao_implementacao.dart';
import 'package:guia_da_mesada/app/domain/entities/interfaces/filho_dao.dart';
import 'package:guia_da_mesada/app/domain/services/filho_service.dart';


setupInjection() {
  GetIt getIt = GetIt.I;

  getIt.registerSingleton<FilhoDAO>(FilhoDAOImplementacao());
  getIt.registerSingleton<FilhoService>(FilhoService());
}