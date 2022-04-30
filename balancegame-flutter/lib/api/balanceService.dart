import 'package:balancegame_flutter/model/catalogModel.dart';
import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
part 'balanceService.g.dart';

@RestApi(baseUrl: 'http://10.0.2.2:9090')
abstract class BalanceService {
  factory BalanceService(Dio dio, {String baseUrl}) = _BalanceService;

  //게임 리스트 가져오기
  @GET('/api/1.0/catalogs')
  Future<CatalogGetDto> getBalanceGameList();

  //통계에 값 저장
  @POST('/api/1.0/statistics/insert')
  Future<String> insertBalanceGameStatistics(
    @Body() @JsonSerializable() Object json
  );
}