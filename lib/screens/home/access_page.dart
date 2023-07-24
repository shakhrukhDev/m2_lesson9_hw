import 'package:flutter/material.dart';

class AccessPage extends StatelessWidget {
  const AccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)?.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        title: Text("Access Page"),
      ),
      body: Column(
        children: [
          Text(data['name'], style: TextStyle(fontSize: 20),),
          Text(data['password'],  style: TextStyle(fontSize: 20),),
        ],
      ),
    );
  }
}
