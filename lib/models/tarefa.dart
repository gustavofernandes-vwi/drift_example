class Tarefa {
  final String titulo;
  final bool concluida;
  final DateTime? prazo;

  Tarefa({
    required this.titulo,
    this.prazo,
    this.concluida = false,
  });

  bool get atrasada => !concluida && prazo != null && prazo!.isBefore(DateTime.now());

  Tarefa copyWith({
    String? titulo,
    bool? concluida,
    DateTime? prazo,
  }) => Tarefa(
    titulo: titulo ?? this.titulo,
    concluida: concluida ?? this.concluida,
    prazo: prazo ?? this.prazo,
  );

  Tarefa.fromJson(Map<String,dynamic> json) : this(
    titulo: json['titulo'],
    concluida: json['concluida'] ?? false,
    prazo: json['prazo'] != null ? DateTime.parse(json['prazo']) : null,
  );
}