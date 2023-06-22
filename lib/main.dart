import 'package:drift_exemple/models/tarefa.dart';
import 'package:drift_exemple/widgets/tarefa_item.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Drift demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Minhas tarefas'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Tarefa> tarefas = [];

  _importarTarefas() {
    final List<Map<String,dynamic>> tarefasImportadas = [
      {'titulo': 'Escolher tema', 'concluida': true},
      {'titulo': 'Realizar pesquisa', 'concluida': true},
      {'titulo': 'Escrever roteiro', 'prazo': '2023-06-22 11:30'},
      {'titulo': 'Preparar apresentação', 'prazo': '2023-06-23 10:15'},
    ];

    setState(() {
      tarefas = tarefasImportadas.map((e) => Tarefa.fromJson(e)).toList();
    });
  }

  _editar(int index, Tarefa tarefa) {
    setState(() {
      tarefas[index] = tarefa;
    });
  }

  _marcarConcluida(int index, bool concluida) {
    _editar(index, tarefas[index].copyWith(concluida: concluida));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: CustomScrollView(
        slivers: [
          if (tarefas.isEmpty) const SliverFillRemaining(
            child: Center(
              child: Text("Você não possuí nenhuma tarefa"),
            ),
          ),
          if (tarefas.isNotEmpty) ...[
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => TarefaItem(
                  tarefas[index],
                  onMarcarConcluida: (concluida) => _marcarConcluida(index, concluida),
                ),
                childCount: tarefas.length
              ),
            ),
          ]
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _importarTarefas,
        tooltip: 'Increment',
        child: const Icon(Icons.download),
      ),
    );
  }
}
