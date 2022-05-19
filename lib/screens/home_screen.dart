import 'package:flutter/material.dart';
import 'package:open_leaves/screens/hymns_list_screen.dart';
import 'package:open_leaves/screens/publish_screen.dart';
import 'package:open_leaves/hymn_utils.dart';
import 'package:open_leaves/screens/settings_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  showComingSoon(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Information'),
            contentPadding: EdgeInsets.all(20.0),
            content: Text('This feature is coming soon. check again soonest.'),
            actions: [
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('Close'))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        title: Text(
          'Open Leaves',
          style: TextStyle(
              fontSize: 30, fontFamily: 'Nunito', fontWeight: FontWeight.bold),
        ),
        elevation: 0.0,
        backgroundColor: Colors.blue,
        toolbarHeight: MediaQuery.of(context).size.height * .1,
        actions: [
          IconButton(
              onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => SettingsScreen())),
              icon: const Icon(Icons.settings))
        ],
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * .1,
            decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0))),
            child: Center(
              child: Container(
                  width: MediaQuery.of(context).size.width * .2,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white),
                  child: IconButton(
                      onPressed: () => searchHYMN(context),
                      icon: Icon(Icons.search))),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: MediaQuery.of(context).size.height * .6,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: GridView.count(
              crossAxisCount: 2,
              children: [
                NavPad(
                  title: "Offline Hymns",
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const HymsList())),
                ),
                NavPad(
                    title: "Fetch hymns", onTap: () => showComingSoon(context)),
                NavPad(
                    title: "Collections", onTap: () => showComingSoon(context)),
                NavPad(
                  title: "Publish",
                  onTap: () => showComingSoon(context),
                ),
              ],
            ),
          ),
          const Text("OpenLeaves ver1.0.5")
        ],
      ),
    );
  }
}

class NavPad extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const NavPad({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: InkWell(
        onTap: onTap,
        child: Card(
          elevation: 3.0,
          child: Center(
              child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    title,
                    style: const TextStyle(fontSize: 20),
                  ))),
        ),
      ),
    );
  }
}
