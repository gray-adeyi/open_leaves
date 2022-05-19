import 'package:flutter/material.dart';

class PublishScreen extends StatelessWidget {
  const PublishScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const Text("Publish Hymns"),
      ),
      backgroundColor: Colors.blue,
      body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Card(
                    elevation: 5,
                    color: Colors.blue.shade300,
                    child: Container(
                      height: MediaQuery.of(context).size.height * .8,
                      width: MediaQuery.of(context).size.width * .8,
                      child: Column(
                        children: [
                          const Text("Publish hymns"),
                          Row(
                            children: [
                              Container(width: 100, child: const TextField()),
                              ElevatedButton(
                                  onPressed: () => true,
                                  child: Icon(Icons.search)),
                              ElevatedButton(
                                  onPressed: () => true, child: Text('Edit')),
                            ],
                          ),
                          ElevatedButton(
                              onPressed: () => true,
                              child: Text('Add New Hymn')),
                        ],
                      ),
                    ),
                  )
                ],
              ))),
    );
  }
}
