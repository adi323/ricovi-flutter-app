import 'dart:convert';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:ricovi/models/respModel.dart';

// coverage:ignore-file
abstract class Utility {
  // coverage:ignore-start
  static void printDLog(String message) {
    Logger().d('Ricovi: $message');
  }

  static String getDayMonthYear(DateTime dateTime) =>
      '${DateFormat.y().format(dateTime)}-${DateFormat('MM').format(dateTime)}-${getOnlyDate(dateTime)}';

  static String getMonthYear(DateTime dateTime) =>
      DateFormat('MMMM y').format(dateTime);

  static String getOnlyDate(DateTime dateTime) =>
      DateFormat('dd').format(dateTime);

  /// Print info log.
  ///
  /// [message] : The message which needed to be print.
  static void printILog(String message) {
    Logger().i('Ricovi: $message');
  }

  // static String? validatePassword(String value) {
  //   if (value.trim().isNotEmpty) {
  //     if (value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
  //       if (value.contains(RegExp(r'[A-Z]'))) {
  //         if (value.contains(RegExp(r'[0-9]'))) {
  //           if (value.length < 6) {
  //             return 'shouldBe6Characters'.tr;
  //           } else {
  //             return null;
  //           }
  //         } else {
  //           return 'shouldHaveOneDigit'.tr;
  //         }
  //       } else {
  //         return 'shouldHaveOneUppercaseLetter'.tr;
  //       }
  //     } else {
  //       return 'shouldHaveOneSpecialCharacter'.tr;
  //     }
  //   } else {
  //     return 'passwordRequired'.tr;
  //   }
  // }
  static List<bool> passwordValidator(String password) {
    var validationStatus = <bool>[false, false, false, false];
    validationStatus[0] = password.length >= 8;
    validationStatus[1] = RegExp(r'[A-Z]').hasMatch(password);
    validationStatus[2] = RegExp(r'[0-9]').hasMatch(password);
    validationStatus[3] = RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(password);
    return validationStatus;
  }

  /// Show alert dialog
  static void showAlertDialog({
    required String message,
    required String title,
    required Function() onPress,
  }) async {
    await Get.dialog<dynamic>(
      CupertinoAlertDialog(
        title: Text('$title'),
        content: Text('$message'),
        actions: <Widget>[
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: onPress,
            child: const Text('Yes'),
          ),
          const CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: closeDialog,
            child: Text('No'),
          )
        ],
      ),
    );
  }

  /// Show error dialog from response model
  static void showInfoDialog(ResponseModel data,
      [bool isSuccess = false]) async {
    await Get.dialog<dynamic>(
      CupertinoAlertDialog(
        title: Text(isSuccess ? 'SUCCESS' : 'ERROR'),
        content: Text(
          jsonDecode(data.data)['message'] as String? ?? 'Invalid Data',
        ),
        actions: [
          CupertinoDialogAction(
            onPressed: Get.back,
            isDefaultAction: true,
            child: const Text(
              'Okay',
              style: TextStyle(color: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }

  /// Show error dialog from response model
  static void showSuccessDialog(ResponseModel data,
      [bool isSuccess = false]) async {
    await Get.dialog<dynamic>(
      CupertinoAlertDialog(
        title: const Text('SUCCESS'),
        content: Text(
          jsonDecode(data.data)['message'] as String? ?? 'Invalid Data',
        ),
        actions: [
          CupertinoDialogAction(
            onPressed: Get.back,
            isDefaultAction: true,
            child: const Text(
              'Okay',
              style: TextStyle(color: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }

  /// Show error dialog from response model
  static void showDialog(String message) async {
    await Get.dialog<dynamic>(
      CupertinoAlertDialog(
        title: const Text('SUCCESS'),
        content: Text(
          message,
        ),
        actions: [
          CupertinoDialogAction(
            onPressed: Get.back,
            isDefaultAction: true,
            child: const Text(
              'Okay',
              style: TextStyle(color: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }

  /// Print error log.
  ///
  /// [message] : The message which needed to be print.
  static void printELog(String message) {
    Logger().e('Ricovi: $message');
  }

  static bool emailValidator(String email) => EmailValidator.validate(email);

  static void showLoadingDialog() {
    closeDialog();
    Get.dialog<void>(
      WillPopScope(
        onWillPop: () async => false,
        child: Align(
          alignment: Alignment.center,
          child: Wrap(
            children: const [
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  Colors.blue,
                ),
              ),
            ],
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }

  /// Close any open dialog.
  static void closeDialog() {
    if (Get.isDialogOpen ?? false) Get.back<dynamic>();
  }

  /// Returns true if the internet connection is available.
  static Future<bool> isNetworkAvailable() async =>
      await InternetConnectionChecker().hasConnection;

  /// Close any open snackbar
  static void closeSnackbar() {
    if (Get.isSnackbarOpen) Get.back<void>();
  }

  /// Print info log.
  ///
  /// [message] : The message which needed to be print.
  static void printLog(dynamic message) {
    Logger().log(Level.info, message);
  }

  /// Show loader
  static void showLoader() async {
    await Get.dialog<dynamic>(
      const Center(
        child: SizedBox(
          height: 60,
          width: 60,
          child: Card(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: CircularProgressIndicator(
                color: Colors.blue,
              ),
            ),
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }
}
