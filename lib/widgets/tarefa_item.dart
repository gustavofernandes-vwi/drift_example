import 'package:drift_exemple/models/tarefa.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TarefaItem extends StatefulWidget {
  final Tarefa tarefa;
  final Function(bool concluida) onMarcarConcluida;

  const TarefaItem(
    this.tarefa, {
    required this.onMarcarConcluida,
    super.key,
  });

  @override
  State<TarefaItem> createState() => _TarefaItemState();
}

class _TarefaItemState extends State<TarefaItem> {
  static DateFormat dateFormat = DateFormat('dd/MM/yyyy hh:mm');
  Color? get textColor {
    if (widget.tarefa.concluida) {
      return Theme.of(context).disabledColor;
    }

    if (widget.tarefa.atrasada) {
      return Colors.red;
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: widget.tarefa.concluida,
        onChanged: (value) {
          if (value != null) widget.onMarcarConcluida(value);
        },
      ),
      title: Text(
        widget.tarefa.titulo,
        style: TextStyle(
          decoration: widget.tarefa.concluida ? TextDecoration.lineThrough : null,
          color: textColor,
        ),
      ),
      subtitle: widget.tarefa.prazo != null ? Text(dateFormat.format(widget.tarefa.prazo!)) : null,
    );
  }
}