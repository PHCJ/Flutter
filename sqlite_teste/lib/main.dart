import 'package:flutter/material.dart';
import 'package:sqlite_teste/database_helper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SQFlite Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final dbHelp = DatabaseHelper.instance;
  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Exemplo de CRUD básico'),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: const Text(
                'Inserir dados',
                style: TextStyle(fontSize: 20),
              ),
              onPressed: () {
                _inserir();
              },
            ),
            ElevatedButton(
              child: const Text(
                'Consultar dados',
                style: TextStyle(fontSize: 20),
              ),
              onPressed: () {
                _consultar();
              },
            ),
            ElevatedButton(
              child: const Text(
                'Atualizar dados',
                style: TextStyle(fontSize: 20),
              ),
              onPressed: () {
                _atualizar();
              },
            ),
            ElevatedButton(
              child: const Text(
                'Deletar dados',
                style: TextStyle(fontSize: 20),
              ),
              onPressed: () {
                _deletar();
              },
            ),
          ],
        )));
  }

  void _inserir() async {
    Map<String, dynamic> row = {
      DatabaseHelper.columnNome: 'Paulo',
      DatabaseHelper.columnIdade: 26
    };
    final id = await dbHelp.insert(row);
    print('linha inserida id: $id');
  }

  void _consultar() async {
    final todasLinhas = await dbHelp.queryAllRows();
    print('Consulta todas as linhas');
    for (var row in todasLinhas) {
      print(row);
    }
  }

  void _atualizar() async {
    Map<String, dynamic> row = {
      DatabaseHelper.columnId: 1,
      DatabaseHelper.columnNome: 'Jose',
      DatabaseHelper.columnIdade: 23
    };
    final linhasAfetadas = await dbHelp.update(row);
    print('atualizadas $linhasAfetadas linhas');
  }

  void _deletar() async {
    final id = await dbHelp.queryRowCount();
    final linhaDeletada = await dbHelp.delete(id!);
    print('Deletada(s) $linhaDeletada linha(s): linha $id');
  }
}
