import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:islami_app/core/utils/app_colors.dart';

showUserToast(bool isError, String message) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: isError ? Colors.red : AppColors.goldLightColor,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}
