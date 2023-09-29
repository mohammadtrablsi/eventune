import 'package:flutter/material.dart';

import '../controller/deepLinkController.dart';


class MyAppx extends StatelessWidget {
  const MyAppx({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        ElevatedButton(
            onPressed: () {
              DeepLinkController.buildDynamicLinks('mohammad ','/placed/3');
            },
            child: Text('Click')),
      ],
    ));
  }
}
