import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:meter_reading/config/shared_preferences.dart';
import 'package:meter_reading/core/constants/app_string.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(BaseOptions(
        baseUrl: AppString.baseUrl,
        receiveDataWhenStatusError: true,
        followRedirects: false,
        sendTimeout: 60 * 2000,
        receiveTimeout: 60 * 1000,
        validateStatus: (status) {
          return status! <= 500;
        },
        headers: {
          'Content-Type': 'application/json',
          // 'API-KEY': 'AWRsdgdyr5tDFHDF435345werfTer3',
          // "X-localization": StorageService.getcurrentLanguage(),
          'Authorization':
              // 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiNmMwYzg1NGYzNjkxOGNhMGNjMDNmYTNmNzlhNzdlYjA2ZGEzZDYxOTZjMmEzZDA4NDc1YzU2YWFkODFkMjFkN2UyNWI3NjI1NTUyNDgyNDkiLCJpYXQiOjE2OTYzMjkwMDEuMTE0NzM4LCJuYmYiOjE2OTYzMjkwMDEuMTE0NzQyLCJleHAiOjE3Mjc5NTE0MDEuMTA5NjAyLCJzdWIiOiI1Iiwic2NvcGVzIjpbXX0.Q7aM7ItCgJybprwYYVWgNaSukIJNauB5MRD0p5755KH5ucvDyLyO-ddMDFZHqQPnmFxtT_hfo_KGzeLj-oclKUpFs9nNdHhA_rXBFZeNw_qBrqbRQhjv6fzH4fFi0UWZG8pyCE7DTp1A3g2TTt2atb033Jg7rK2cw5C60Hl8jWioGmY4TCCEEWt7d5NUg_BXTWSR75QUySTQxSWMqtRLljJUD5nLklLrdYwKKix3RbJd_8YkiD6dXRD_SXuuLIGHm2BQ7jrW_AVwFa4VXwpVL2C7G1C2h1bzgfR4QCaRFpOT6W4Cme75XrftsJzPwJOFYLuS6e0Kfs6a_GBCTwrSuQH2vFWstI7E8f5rol2i0kSNBmGdAvRwhTQre07vWBXKq2uKnlbB7jVWDraWay0W7t7VG2BtVrQroSPI8fTZfaFrJhXpbKBL1rxkcIfO-3XappDcx6kJz0C5Uhlvr4EvAItyYuih_6peDpmLJwgVHStqAgXXj8pU3QiIYt57IZYzM-5BMQNXOYb1KFEvnDGEFmJxU00F-nGUiEMjzG3bKwWhvwGXXdaK0CU7tMNPzL37UbGdjPXo7F0x_jtorktgryi1HYkHeTvUUZ4ZFTWWZFiUrkVYGut60T5tzqVb2JXlrYt-7SEQ0YR9ZxdqvKH0pnQdRQ-8kKgONlFx7SjLjWk'
              'Bearer ${SPHelper.sHelper.getToken()}'
        }));
  }

  static Future<Response> getData(
    String url, {
    Map<String, dynamic>? query,
  }) async {
    log(url.toString());
    return await dio!.get(url, queryParameters: query);
  }

  static Future<Response> postData(
    String url, {
    Map<String, dynamic>? data,
  }) async {
    log(url.toString());
    log(SPHelper.sHelper.getToken().toString());

    return await dio!.post(url, data: data);
  }

  static Future<Response> postFormData(
    String url, {
    FormData? formData,
  }) async {
    return await dio!.post(url, data: formData);
  }

  static Future<Response> putData(
    String url, {
    Map<String, dynamic>? data,
  }) async {
    return await dio!.put(url, data: data);
  }

  static Future<Response> deleteData(
    String url, {
    Map<String, dynamic>? data,
  }) async {
    return await dio!.delete(url, data: data);
  }
}
