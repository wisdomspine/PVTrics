import 'package:flutter/material.dart';

class AppDialogs {
  AppDialogs() {
    throw Exception("[CoreDialogs] can't be instantiated");
  }

  static Future<bool?> confirm(
    BuildContext context, {
    required String message,
    String? cancelText,
    required String acceptText,
    Color? acceptTextColor,
  }) {
    return showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        contentTextStyle: Theme.of(context).textTheme.bodyText2,
        content: Text(
          message,
          style: TextStyle(
            fontSize: 16,
            height: 1.5,
          ),
          textAlign: TextAlign.justify,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop<bool>(context, false);
            },
            child: Text(
              cancelText ?? "Cancel",
              style: TextStyle(
                fontSize: 16,
                height: 1.5,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop<bool>(context, true);
            },
            child: Text(
              acceptText,
              style: TextStyle(
                color: acceptTextColor,
                fontSize: 16,
                height: 1.5,
              ),
            ),
          )
        ],
      ),
    );
  }
}
