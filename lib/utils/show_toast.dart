import 'package:flutter/material.dart';
import 'package:nomnoman/widgets/app_text.dart';

showToast(BuildContext context, String msg) =>
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: AppText(msg, color: Colors.white),
      duration: Duration(seconds: 2),
    ));
