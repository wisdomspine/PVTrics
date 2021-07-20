import 'package:flutter/material.dart';

class BottomAppBarTab extends StatelessWidget {
  final bool? active;
  final Widget icon;
  final void Function()? onPressed;
  const BottomAppBarTab({
    Key? key,
    this.active,
    required this.icon,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (active ?? false)
      return CircleAvatar(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: Border.all(
              color: Theme.of(context).accentColor.withAlpha(100),
            ),
          ),
          clipBehavior: Clip.hardEdge,
          child: ElevatedButton(
            onPressed: onPressed,
            child: icon,
            style: ElevatedButton.styleFrom(
              elevation: 0,
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
        ),
      );

    IconButton(
      onPressed: onPressed,
      icon: icon,
    );
    return IconButton(
      onPressed: onPressed,
      icon: icon,
      color: Theme.of(context).accentColor,
    );
  }
}
