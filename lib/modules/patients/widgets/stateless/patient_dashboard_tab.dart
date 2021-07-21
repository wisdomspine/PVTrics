import 'package:flutter/material.dart';

class PatientDashboardTab extends StatelessWidget {
  final Widget icon;
  final void Function()? onPressed;
  final String label;
  const PatientDashboardTab({
    Key? key,
    required this.icon,
    required this.label,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(80),
            border: Border.all(
              color: Theme.of(context).dividerColor.withOpacity(.2),
            ),
            color: Theme.of(context).cardColor.withOpacity(.9),
          ),
          clipBehavior: Clip.hardEdge,
          child: IconButton(
            padding: EdgeInsets.all(16),
            color: Theme.of(context).accentColor,
            onPressed: onPressed,
            icon: icon,
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Text(label),
      ],
    );
  }
}
