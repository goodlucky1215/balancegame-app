// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'balanceService.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _BalanceService implements BalanceService {
  _BalanceService(this._dio, {this.baseUrl}) {
    baseUrl ??= 'http://10.0.2.2:9090';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<Map<String, List<CatalogGetDto>>> getBalanceGameList() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Map<String, List<CatalogGetDto>>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/api/1.0/catalogs',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!.map((k, dynamic v) => MapEntry(
        k,
        (v as List)
            .map((i) => CatalogGetDto.fromJson(i as Map<String, dynamic>))
            .toList()));
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
