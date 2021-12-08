import 'package:dio/dio.dart';
import 'package:balacegame_flutter/model/catalogModel.dart';
import 'package:retrofit/retrofit.dart';
part 'balanceService.g.dart';

@RestApi(baseUrl: 'http://10.0.2.2:9090')
abstract class BalanceService {
  factory BalanceService(Dio dio, {String baseUrl}) = _BalanceService;

  @GET('/api/1.0/catalogs')
  Future<CatalogGetDto> getBalanceGameList();

}