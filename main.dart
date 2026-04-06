import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: TelaInicial()));
}

class TelaInicial extends StatefulWidget {
  const TelaInicial({super.key});

  @override
  State<TelaInicial> createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  List<Aluno> alunoList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Text("App da 3G"),
        actions: [Text("Aqui tem butão...")],
      ),
      body: ListView.builder(
        itemCount: alunoList.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.person_4_rounded),
              title: Text(alunoList[index].nome),
              subtitle: Text(
              "Tel.: ${alunoList[index].telefone} | Matrícula: ${alunoList[index].matricula}",
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TelaFormulario()),
          ).then((aluno) {
            setState(() {
              alunoList.add(aluno);
            });
            debugPrint("esse é meu aluno: " + aluno.nome);
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class TelaFormulario extends StatelessWidget {
  const TelaFormulario({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nome = TextEditingController();
    TextEditingController telefone = TextEditingController();
    TextEditingController matricula = TextEditingController();

    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Text("nome:"),
          TextField(controller: nome),
          Text("telefone:"),
          TextField(controller: telefone),
          Text("matricula:"),
          TextField(controller: matricula),
          ElevatedButton(
            onPressed: () {
              if (nome.text != '' &&
                  telefone.text != '' &&
                  matricula.text != '') {
                Aluno info = Aluno(nome.text, telefone.text, matricula.text);
                Navigator.pop(context, info);
              } else {
                debugPrint("Preencha todos os campos burrão");
              }
            },
            child: Text("Salvar"),
          ),
        ],
      ),
    );
  }
}

class Aluno {
  String nome;
  String telefone;
  String matricula;

  Aluno(this.nome, this.telefone, this.matricula);
}
