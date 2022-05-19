import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import "package:open_leaves/models/models.dart";
import "package:open_leaves/screens/hymn_single_screen.dart";
import 'dart:convert';

searchHYMN(BuildContext context) {
  showSearch(context: context, delegate: SearchHYMNDelegate());
}

class HymnUtil {
  Future<String>? _future;
  late Hymns _hymns;

  List<Hymn> get hymns {
    var result = <Hymn>[];
    _hymns = Hymns();
    _future = loadJson();
    _future?.then((value) {
      var hymns = jsonDecode(value);
      for (var hymn in hymns) {
        _hymns.hymns.add(Hymn.fromJson(hymn));
      }
      for (var hymn in _hymns.hymns) {
        result.add(hymn);
      }
    });
    return result;
  }

  Future<String> loadJson() async =>
      await rootBundle.loadString('assets/hymns.json');
}

class SearchHYMNDelegate extends SearchDelegate {
  List<Hymn> searchTerms = HymnUtil().hymns;

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<Hymn> matchQuery = [];
    for (var hymn in searchTerms) {
      if (hymn.hymnNo.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(hymn);
      }
    }

    if (matchQuery.isEmpty) {
      return Center(
          child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline_rounded),
            Text(
                "I could not find the hymn you're looking for. Try finding it again by its hymn number. If you see me again then it is likely that my developers left it out."),
          ],
        ),
      ));
    } else {
      return ListView.builder(
          itemCount: matchQuery.length,
          itemBuilder: (context, idx) {
            var result = matchQuery[idx];
            return InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => HymnSingle(hymn: result)));
              },
              child: ListTile(
                title: Text(result.hymnNo),
              ),
            );
          });
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Hymn> matchQuery = [];
    for (var hymn in searchTerms) {
      if (hymn.hymnNo.toLowerCase().contains(query.toLowerCase())) {
        if (!matchQuery.contains(hymn)) {
          matchQuery.add(hymn);
        }
      }
    }
    if (matchQuery.isEmpty) {
      return Center(
          child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline_rounded),
            Text(
                "No hymn matches your search query `${query}`. Try finding the hymn by its number. If no luck still, it's not your fault we'll add it to the future release."),
          ],
        ),
      ));
    } else {
      return ListView.builder(
          itemCount: matchQuery.length,
          itemBuilder: (context, idx) {
            var result = matchQuery[idx];
            return InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => HymnSingle(hymn: result)));
              },
              child: ListTile(
                title: Text(result.hymnNo),
              ),
            );
          });
    }
  }
}
