import 'package:badiup/screens/admin_main_menu.dart';
import 'package:flutter/material.dart';

class AdminHomePage extends StatefulWidget {
  AdminHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AdminHomePageState createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Center(
        child: Text('ADMIN HOME PAGE : ORDERS'),
      ),
      drawer: _buildDrawer(),
    );
  }

  Drawer _buildDrawer() {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    return Drawer(
      key: scaffoldKey,
      child: AdminMainMenu(),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text("BADI UP"),
      centerTitle: true,
    );
  }
}