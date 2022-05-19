import 'package:flutter/material.dart';
import 'package:open_leaves/hymn_utils.dart';
import "package:open_leaves/models/models.dart";

class HymnSingle extends StatelessWidget {
  final Hymn hymn;
  const HymnSingle({Key? key, required this.hymn}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        elevation: 0,
        title: Text("Viewing Hymn " + hymn.hymnNo),
        actions: [
          IconButton(
              onPressed: () => searchHYMN(context),
              icon: const Icon(Icons.search_rounded))
        ],
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 50),
        decoration: BoxDecoration(
            color: Colors.blue.shade50,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: SingleChildScrollView(
          child: Card(
            elevation: 5,
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  const Icon(Icons.music_note_outlined),
                  const Divider(
                    thickness: 2,
                    color: Colors.black,
                  ),
                  Text(
                    hymn.content,
                    style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Nunito'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
