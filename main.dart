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
        actions: [Text("Aqui tem um botão.")],
      ),
      body: ListView(
        reverse: true,
        children: [
          Text("Ola 3"),
          Text("Ola 3"),
          Text("Ola 3"),
          Text("Ola 3"),
          Text("Ola 3"),
          Text("Ola 3"),
          Text("Ola 3"),
          Text("Ola 3"),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TelaFormulario()),
          ).then((Aluno) {
            debugPrint("Esse é meu Aluno: " + Aluno.Nome);
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class TelaFormulario extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController Nome = TextEditingController();
    TextEditingController Telefone = TextEditingController();
    TextEditingController Matricula = TextEditingController();
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Text("Nome:"),
          TextField(controller: Nome),
          Text("Telefone:"),
          TextField(controller: Telefone),
          Text("Matricula:"),
          TextField(controller: Matricula),
          ElevatedButton(
            onPressed: () {
              if (Nome.text != "" &&
                  Telefone.text != "" &&
                  Matricula.text != "") {
                Aluno info = Aluno(Nome.text, Telefone.text, Matricula.text);
                Navigator.pop(context, info);
              } else {
                debugPrint("Preencha todos os campos para continuar...");
              }
              Navigator.pop(context);
            },
            child: Text("Salvar"),
          ),
        ],
      ),
    );
  }
}

class Aluno {
  String Nome;
  String Telefone;
  String Matricula;

  Aluno(this.Nome, this.Telefone, this.Matricula);
}
