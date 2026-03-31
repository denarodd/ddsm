import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: TelaInicial()));
}

class TelaInicial extends StatelessWidget {
  const TelaInicial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Text("App da 3G"),
        actions: [Text("Aqui tem butão...")],
      ),
      body: ListView(
        reverse: true,
        children: [
          Text("Ola 5"),
          Text("Ola 5"),
          Text("Ola 5"),
          Text("Ola 5"),
          Text("Ola 5"),
          Text("Ola 5"),
          Text("Ola 5"),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: null),
    );
  }
}
