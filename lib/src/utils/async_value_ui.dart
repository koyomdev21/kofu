import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kofu/src/common_widgets/alert_dialogs.dart';
import 'package:kofu/src/exceptions/app_exception.dart';

extension AsyncValueUI on AsyncValue {
  void showAlertDialogOnError(BuildContext context) {
    if (!isLoading && hasError) {
      final message = _errorMessage(error);
      showExceptionAlertDialog(
        context: context,
        title: 'Error',
        exception: message,
      );
    }
  }

  String _errorMessage(Object? error) {
    if (error is AppException) {
      return error.details.message;
    } else if (error is DioError) {
      if (error.type == DioErrorType.receiveTimeout) {
        return 'Connection error. Please try again later';
      }
      return 'Session expired. Please relogin again';
    } else {
      return error.toString();
    }
  }
}
