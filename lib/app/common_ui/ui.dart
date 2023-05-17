
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_task/app/constants/contants.dart';
import 'package:get/get.dart';

class Ui {
  static SnackBar successAwesomeSnackBar({String title = 'Success', required String message}) {

    return SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      duration: const Duration(seconds: 3),
      content: AwesomeSnackbarContent(
        title: title,
        message: message,
        contentType: ContentType.success,
      ),
    );
  }

  static SnackBar errorAwesomeSnackBar({String title = 'Something went wrong!', required String message}) {

    return SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      duration: const Duration(seconds: 3),
      content: AwesomeSnackbarContent(
        title: title,
        message: message,
        contentType: ContentType.failure,
      ),
    );
  }



  static customLoader() {
    return const SpinKitDoubleBounce(

      color: primaryColor,
    );
  }

  static customDialogLoader() {
    return Get.dialog(SpinKitDoubleBounce(
      color: Get.theme.primaryColor,
    ));
  }






}
