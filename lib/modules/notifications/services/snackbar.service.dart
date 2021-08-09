import 'package:flutter/material.dart';

const double kEdgePaddingMin = 8;
const double kEdgePadding = 16;

class SnackbarService {
  static const Duration duration = Duration(seconds: 4);

  /// Shows an error snackbar, one of[scaffoldKey] or [context]
  /// must be provided but not both
  static Future errorText({
    required BuildContext context,
    required String message,
    SnackBarAction? action,
  }) async {
    SnackBar snackbar = SnackBar(
      behavior: SnackBarBehavior.floating,
      margin: _margin,
      padding: _padding,
      duration: duration,
      content: Text(
        message,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Theme.of(context).errorColor,
        ),
      ),
      backgroundColor: Theme.of(context).backgroundColor.withOpacity(.6),
      action: action,
      shape: Theme.of(context).cardTheme.shape,
      elevation: .2,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
    await Future.delayed(duration);

    return;
  }

  static Future showText({
    required BuildContext context,
    required String message,
    SnackBarAction? action,
  }) async {
    SnackBar snackbar = SnackBar(
      behavior: SnackBarBehavior.floating,
      margin: _margin,
      padding: _padding,
      duration: duration,
      content: Text(
        message,
        textAlign: TextAlign.center,
        style: TextStyle(color: Theme.of(context).accentColor),
      ),
      backgroundColor: Theme.of(context).cardColor,
      action: action,
      shape: Theme.of(context).cardTheme.shape,
      elevation: .2,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
    await Future.delayed(duration);

    return;
  }

  static EdgeInsetsGeometry get _margin => EdgeInsets.only(
        left: kEdgePadding,
        right: kEdgePadding,
        bottom: kEdgePadding * 1.65,
      );
  static EdgeInsetsGeometry get _padding => EdgeInsets.symmetric(
        vertical: kEdgePaddingMin * .65,
        horizontal: kEdgePaddingMin * 1.75,
      );
}
