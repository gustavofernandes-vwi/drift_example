
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:drift_exemple/models/tarefa.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'database.g.dart';

@DataClassName('TarefaRow')
class TarefaTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get titulo => text()();
  BoolColumn get concluida => boolean().withDefault(const Constant(false))();
  DateTimeColumn get prazo => dateTime().nullable()();
}

@DriftDatabase(tables: [TarefaTable])
class Database extends _$Database {
  Database() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  salvarTarefas(List<Tarefa> tarefas) async {
    await batch((batch) {
      batch.insertAllOnConflictUpdate(
        tarefaTable,
        tarefas.map((e) => TarefaTableCompanion.insert(
          id: e.id != null ? Value(e.id!) : const Value.absent(),
          titulo: e.titulo,
          concluida: Value(e.concluida),
          prazo: Value(e.prazo),
        )),
      );
    });
  }

  Stream<List<Tarefa>> recuperarTarefas() async* {
    final query = select(tarefaTable);

    yield* query.watch().map((event) => event.map(Tarefa.fromDb).toList());
  }
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}