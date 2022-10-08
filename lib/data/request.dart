import 'dart:async';

import 'package:dio/dio.dart';

abstract class Constants {
  static const contentType = "application/json";
}

enum MethodType { GET, POST, PATCH, DELETE }

Map<MethodType, String> methods = {
  MethodType.GET: "GET",
  MethodType.POST: "POST",
  MethodType.PATCH: "PATCH",
  MethodType.DELETE: "DELETE",
};

class Request {
  Dio _dio = Dio();

  Request({String? base}) {
    if (base == null) base = environment.apiUrl;
    _dio = Dio(BaseOptions(
        baseUrl: base,
        receiveTimeout: environment.receiveTimeout,
        connectTimeout: environment.connectTimeout,
        contentType: Constants.contentType));
  }

  Future<Object> requestApi({
    required MethodType method,
    required String url,
    Map<String, dynamic>? data,
    Map<String, dynamic>? header,
  }) async {
    try {
      var response = await _dio.request(
        url,
        data: data,
        options: Options(method: methods[method], headers: header),
      );
      return response.data;
    } catch (e) {
      return handleError(e);
    }
  }

  Future<ErrorModel> handleError(dynamic error) async {
    ErrorModel errorModel = ErrorModel();
    errorModel.message = error.toString();
    if (error is DioError) {
      switch (error.type) {
        case DioErrorType.sendTimeout:
          errorModel.type = ErrorType.TIME_OUT;
          // errorModel.description = LocaleKeys.request_send_timeout;
          break;
        case DioErrorType.connectTimeout:
          errorModel.type = ErrorType.TIME_OUT;
          // errorModel.description = LocaleKeys.request_connect_timeout;
          break;
        case DioErrorType.receiveTimeout:
          errorModel.type = ErrorType.TIME_OUT;
          // errorModel.description = LocaleKeys.request_receive_timeout;
          break;
        case DioErrorType.cancel:
          errorModel.type = ErrorType.CANCELLED;
          // errorModel.description = LocaleKeys.request_cancelled;
          break;
        case DioErrorType.other:
          errorModel.type = ErrorType.NO_INTERNET;
          // errorModel.description = LocaleKeys.no_internet;
          break;
        case DioErrorType.response:
          try {
            errorModel.type = ErrorType.UNKNOWN;
            errorModel.code = error.response!.statusCode ?? errorModel.code;
            errorModel.description =
                error.response!.data ?? errorModel.description;
          } catch (e) {}
          break;
      }
    }
    if (errorModel.code == 401) {}
    return errorModel;
  }
}

class ErrorModel {
  int code;
  String description;
  String message;
  ErrorType type;

  ErrorModel({
    this.code = 0,
    this.message = "",
    this.description = "LocaleKeys.unknown_error",
    this.type = ErrorType.UNKNOWN,
  });
}

class ProdEnvironment {
  final baseUrl = "https://chatappgolangdat.herokuapp.com";
  final baseApi = "/";
  final baseVersion = "";
  final receiveTimeout = 2 * 60 * 1000;
  final connectTimeout = 2 * 60 * 1000;

  String get apiUrl => "$baseUrl$baseApi$baseVersion";
}

final environment = ProdEnvironment();
// ignore_for_file: constant_identifier_names

enum ErrorType { TIME_OUT, NO_INTERNET, CANCELLED, UNKNOWN }

const urlGetActive = "/user/getActive";

const urlGetNotActive = "/user/getNotActive";

const urlSendMessage = "/sendMessage/";

const urlGetAllMessageOfRoom = "/user/getAllMessageOfRoom/";

const urlGetAllChatRoom = "/user/getAllChatRoom/";

const webSkUrl = "ws://chatappgolangdat.herokuapp.com/ws/";
