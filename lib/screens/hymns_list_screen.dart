import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:open_leaves/hymn_utils.dart';
import 'dart:convert';
import "package:open_leaves/screens/hymn_single_screen.dart";
import "package:open_leaves/models/models.dart";

class HymsList extends StatefulWidget {
  const HymsList({Key? key}) : super(key: key);

  @override
  State<HymsList> createState() => _HymsListState();
}

class _HymsListState extends State<HymsList> {
  Future? _future;
  late Hymns _hymns;

  Future<String> loadJson() async =>
      await rootBundle.loadString('assets/hymns.json');

  @override
  void initState() {
    _future = loadJson();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const Text("Hymns"),
        actions: [
          IconButton(
              onPressed: () => searchHYMN(context),
              icon: const Icon(Icons.search))
        ],
      ),
      backgroundColor: Colors.blue,
      body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Container(
                margin: EdgeInsets.only(top: 25),
                child: FutureBuilder(
                    future: _future,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Center(
                            child: CircularProgressIndicator.adaptive(),
                          ),
                        );
                      } else {
                        var loopData = jsonDecode(snapshot.data! as String);
                        _hymns = Hymns.fromJson(loopData);
                        List<Widget> hymnListr = [];
                        for (var hymn in _hymns.hymns) {
                          hymnListr.add(InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      HymnSingle(hymn: hymn)));
                            },
                            child: Column(
                              children: [
                                ListTile(
                                  leading: const Icon(Icons.music_note),
                                  title: Text("Hymn No #" + hymn.hymnNo),
                                ),
                                const Divider(
                                  thickness: 2,
                                  color: Colors.black,
                                )
                              ],
                            ),
                          ));
                        }

                        return ListView(
                          children: hymnListr,
                        );
                      }
                    }),
              ))),
    );
  }

  List<String> generateHymns(int count) {
    List<String> rList = [];
    for (var i = 1; i <= count; i++) {
      var newHymn = "hymn $i".toUpperCase();
      rList.add((newHymn));
    }
    return rList;
  }
}
