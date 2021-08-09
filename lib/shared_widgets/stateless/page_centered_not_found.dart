import 'package:flutter/material.dart';
import 'package:vptrics/shared_widgets/stateless/not_found.dart';

class PageCenteredNotFound extends StatelessWidget {
  final NotFound child;

  const PageCenteredNotFound({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: IntrinsicHeight(
            child: child,
          ),
        ),
      ),
    );
  }
}
