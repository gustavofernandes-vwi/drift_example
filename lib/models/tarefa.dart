import 'package:drift_exemple/repository/database.dart';

class Tarefa {
  final int? id;
  final String titulo;
  final bool concluida;
  final DateTime? prazo;

  Tarefa({
    this.id,
    required this.titulo,
    this.prazo,
    this.concluida = false,
  });

  bool get atrasada => !concluida && prazo != null && prazo!.isBefore(DateTime.now());

  Tarefa copyWith({
    int? id,
    String? titulo,
    bool? concluida,
    DateTime? prazo,
  }) => Tarefa(
    id: id ?? this.id,
    titulo: titulo ?? this.titulo,
    concluida: concluida ?? this.concluida,
    prazo: prazo ?? this.prazo,
  );

  Tarefa.fromJson(Map<String,dynamic> json) : this(
    id: json['id'],
    titulo: json['titulo'],
    concluida: json['concluida'] ?? false,
    prazo: json['prazo'] != null ? DateTime.parse(json['prazo']) : null,
  );

  Tarefa.fromDb(TarefaRow row) : this(
    id: row.id,
    titulo: row.titulo,
    concluida: row.concluida,
    prazo: row.prazo,
  );
}