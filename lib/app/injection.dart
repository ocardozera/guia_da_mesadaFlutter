import 'package:get_it/get_it.dart';
import 'package:guia_da_mesada/app/database/sqlite/dao/filho_dao_implementacao.dart';
import 'package:guia_da_mesada/app/domain/entities/interfaces/filho_dao.dart';


setupInjection() {
  GetIt getIt = GetIt.I;

  getIt.registerSingleton<FilhoDAO>(FilhoDAOImplementacao());
  


}