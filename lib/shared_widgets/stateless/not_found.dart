import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vptrics/styles/app_media.dart';

class NotFound extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Widget? action;
  final void Function()? onAction;

  const NotFound({
    Key? key,
    required this.title,
    this.subtitle,
    this.action,
    this.onAction,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 24,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor.withOpacity(.8),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Theme.of(context).dividerColor.withOpacity(.15),
        ),
      ),
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SvgPicture.asset(
            "assets/images/not_found.svg",
            height: AppMedia.getProportionateHeight(160),
            fit: BoxFit.contain,
          ),
          SizedBox(
            height: 24,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.subtitle2?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          if (subtitle != null)
            Text(
              subtitle ?? "",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText2?.copyWith(
                    color: Theme.of(context)
                        .textTheme
                        .bodyText2
                        ?.color
                        ?.withOpacity(.65),
                  ),
            ),
          if (action != null) ...[
            SizedBox(
              height: 24,
            ),
            action as Widget
          ],
        ],
      ),
    );
  }
}
