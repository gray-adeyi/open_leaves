import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(
              Icons.info_outline,
              color: Colors.red,
            ),
            title: Text(
              "None of these is working yet.",
              style: TextStyle(color: Colors.red),
            ),
          ),
          ListTile(
            title: Text("Change Theme"),
          ),
          ListTile(
            title: Text("Change Font"),
          ),
          ListTile(
            title: Text("Toggle Splash Screen"),
          ),
        ],
      ),
    );
  }
}
