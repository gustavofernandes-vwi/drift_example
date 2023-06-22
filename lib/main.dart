import 'package:drift_exemple/models/tarefa.dart';
import 'package:drift_exemple/widgets/tarefa_item.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
  final tarefasController = BehaviorSubject<List<Tarefa>>.seeded([]);
  Stream<List<Tarefa>> get tarefasOut => tarefasController.stream;
  Sink<List<Tarefa>> get tarefasIn => tarefasController.sink;
  List<Tarefa> get tarefas => tarefasController.value;

  _importarTarefas() {
    final List<Map<String,dynamic>> tarefasImportadas = [
      {'titulo': 'Escolher tema', 'concluida': true},
      {'titulo': 'Realizar pesquisa', 'concluida': true},
      {'titulo': 'Escrever roteiro', 'prazo': '2023-06-22 11:30'},
      {'titulo': 'Preparar apresentação', 'prazo': '2023-06-23 10:15'},
    ];

    tarefasIn.add(tarefasImportadas.map((e) => Tarefa.fromJson(e)).toList());
  }

  _editar(int index, Tarefa tarefa) {
    List<Tarefa> tarefas = this.tarefas;
    tarefas[index] = tarefa;
    tarefasIn.add(tarefas);
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
      body: StreamBuilder<List<Tarefa>>(
        stream: tarefasOut,
        builder: (context, snapshot) {
          final List<Tarefa> tarefas = snapshot.data ?? [];
          return CustomScrollView(
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
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _importarTarefas,
        tooltip: 'Increment',
        child: const Icon(Icons.download),
      ),
    );
  }
}
