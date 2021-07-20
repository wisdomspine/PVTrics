import 'package:flutter/material.dart';
import 'package:vptrics/shared_widgets/stateless/app_bottom_app_bar.dart';
import 'package:vptrics/styles/app_icons.dart';

class PatientsScreen extends StatefulWidget {
  static const String route = "PatientsScreen";
  const PatientsScreen({Key? key}) : super(key: key);

  @override
  _PatientsScreenState createState() => _PatientsScreenState();
}

class _PatientsScreenState extends State<PatientsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Patients",
          style: Theme.of(context).textTheme.headline5?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              AppIcons.search,
              color: Theme.of(context).iconTheme.color,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Container(),
      ),
      bottomNavigationBar: AppBottomAppBar(
        activeTab: AppBottomAppBarTab.petients,
      ),
    );
  }
}
