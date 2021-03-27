import 'package:flutter/material.dart';
import 'package:product_list/app/app.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' as intl;
import 'package:logger/logger.dart';
import 'package:product_list/domain/domain.dart';

/// A chunk of methods which can be used to
/// the common operations performed everywhere
/// in the application.
abstract class Utility {
  /// Print debug log.
  ///
  /// [message] : The message which needed to be print.
  static void printDLog(String message) {
    Logger().d('${StringConstants.appName} $message');
  }

  /// Print info log.
  ///
  /// [message] : The message which needed to be print.
  static void printILog(String message) {
    Logger().i('${StringConstants.appName} $message');
  }

  /// Print error log.
  ///
  /// [message] : The message which needed to be print.
  static void printELog(String message) {
    Logger().e('${StringConstants.appName} $message');
  }

  /// Returns [TextDirection.rtl] if the current locale has RTL support.
  static TextDirection getTextDirectionRTL(String languageCode) {
    if (intl.Bidi.isRtlLanguage(languageCode)) {
      return TextDirection.rtl;
    }
    return TextDirection.ltr;
  }

  /// Log writer for get
  static void localLogWriter(String message, {bool isError = false}) {
    if (isError) {
      printELog(message);
    } else {
      printILog(message);
    }
  }

  /// Show a message to the user.
  ///
  /// [message] : Message you need to show to the user.
  /// [messageType] : Type of the message for different background color.
  /// [onTap] : An event for onTap.
  /// [actionName] : The name for the action.
  static void showMessage(String message, MessageType messageType,
      Function() onTap, String actionName) {
    if (message == null || message.isEmpty) return;
    closeSnackbar();
    var backgroundColor = Colors.black;
    switch (messageType) {
      case MessageType.error:
        backgroundColor = Colors.red;
        break;
      case MessageType.information:
        backgroundColor = Colors.blue;
        break;
      case MessageType.success:
        backgroundColor = Colors.green;
        break;
      default:
        backgroundColor = Colors.black;
        break;
    }
    Future.delayed(
      const Duration(seconds: 0),
      () {
        Get.rawSnackbar(
          messageText: Text(
            message,
            style: Styles.white15,
          ),
          mainButton: TextButton(
            onPressed: onTap ?? Get.back,
            child: Text(
              actionName,
              style: Styles.white14,
            ),
          ),
          backgroundColor: backgroundColor,
          margin: Dimens.edgeInsets15_15_15_15,
          borderRadius: Dimens.ten + Dimens.five,
          snackStyle: SnackStyle.FLOATING,
        );
      },
    );
  }

  /// Show a loading dialog
  static void showLoadingDialog() {
    closeDialog();
    Future.delayed(
      const Duration(seconds: 0),
      () {
        Get.dialog<void>(
          CenterCircularProgressbar(),
        );
      },
    );
  }

  /// Close any open dialog.
  static void closeDialog() {
    if (Get.isDialogOpen ?? false) Get.back<void>();
  }

  /// Close any open bottom sheet.
  static void closeBottomsheet() {
    if (Get.isBottomSheetOpen ?? false) Get.back<void>();
  }

  /// Close any open snackbar
  static void closeSnackbar() {
    if (Get.isSnackbarOpen ?? false) Get.back<void>();
  }
}
