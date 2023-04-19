import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

/// 自定义异常
class AppException implements Exception {
   final String message;
   final int code;

  AppException({required this.code, required this.message});

  @override
  String toString() {
    return "code: $code message: $message";
  }

  factory AppException.create(DioError error) {
    switch (error.type) {
      case DioErrorType.cancel:
        {
          return BadRequestException(-1, "请求取消");
        }
        break;
      case DioErrorType.connectionTimeout:
        {
          return BadRequestException(-1, "连接超时");
        }
        break;
      case DioErrorType.sendTimeout:
        {
          return BadRequestException(-1, "请求超时");
        }
        break;
      case DioErrorType.receiveTimeout:
        {
          return BadRequestException(-1, "响应超时");
        }
        break;
      case DioErrorType.badResponse:
        {
          try {
            var errCode = error.response?.statusCode ?? -1;
            // String errMsg = error.response.statusMessage;
            // return ErrorEntity(code: errCode, message: errMsg);
            switch (errCode) {
              case 400:
                {
                  return BadRequestException(errCode, "请求语法错误");
                }
                break;
              case 401:
                {
                  return UnauthorisedException(errCode, "没有权限");
                }
                break;
              case 403:
                {
                  return UnauthorisedException(errCode, "服务器拒绝执行");
                }
                break;
              case 404:
                {
                  return UnauthorisedException(errCode, "无法连接服务器");
                }
                break;
              case 405:
                {
                  return UnauthorisedException(errCode, "请求方法被禁止");
                }
                break;
              case 500:
                {
                  return UnauthorisedException(errCode, "服务器内部错误");
                }
                break;
              case 502:
                {
                  return UnauthorisedException(errCode, "无效的请求");
                }
                break;
              case 503:
                {
                  return UnauthorisedException(errCode, "服务器挂了");
                }
                break;
              case 505:
                {
                  return UnauthorisedException(errCode, "不支持HTTP协议请求");
                }
                break;
              default:
                {
                  // return ErrorEntity(code: errCode, message: "未知错误");
                  return AppException(code: errCode, message: error.response?.statusMessage ?? '未知错误');
                }
            }
          } on Exception catch (_) {
            return AppException(code: -1, message: "未知错误");
          }
        }
        break;
      default:
        {
          return AppException(code: -1, message: error.message ?? "未知错误");
        }
    }
  }
}

/// 请求错误
class BadRequestException extends AppException {
  BadRequestException(int code, String message) : super(code: code, message: message);
}

/// 未认证异常
class UnauthorisedException extends AppException {
  UnauthorisedException(int code, String message) : super(code: code, message: message);
}
