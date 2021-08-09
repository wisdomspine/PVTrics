import 'package:flutter/material.dart';
import 'package:loading_overlay/loading_overlay.dart';

class LoadingScreen extends StatelessWidget {
  final bool? loading;
  final Widget child;
  final Widget? indicator;
  final Color? backgroundColor;
  final Color? spinnerColor;

  const LoadingScreen({
    Key? key,
    this.loading,
    required this.child,
    this.indicator,
    this.backgroundColor,
    this.spinnerColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
      isLoading: loading ?? false,
      opacity: .3,
      color: backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
      child: child,
      progressIndicator: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            indicator ??
                CircularProgressIndicator(
                  color: spinnerColor,
                ),
          ],
        ),
      ),
    );
  }
}
