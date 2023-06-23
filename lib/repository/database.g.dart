// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $TarefaTableTable extends TarefaTable
    with TableInfo<$TarefaTableTable, TarefaRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TarefaTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _tituloMeta = const VerificationMeta('titulo');
  @override
  late final GeneratedColumn<String> titulo = GeneratedColumn<String>(
      'titulo', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _concluidaMeta =
      const VerificationMeta('concluida');
  @override
  late final GeneratedColumn<bool> concluida =
      GeneratedColumn<bool>('concluida', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("concluida" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }),
          defaultValue: Constant(false));
  static const VerificationMeta _prazoMeta = const VerificationMeta('prazo');
  @override
  late final GeneratedColumn<DateTime> prazo = GeneratedColumn<DateTime>(
      'prazo', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, titulo, concluida, prazo];
  @override
  String get aliasedName => _alias ?? 'tarefa_table';
  @override
  String get actualTableName => 'tarefa_table';
  @override
  VerificationContext validateIntegrity(Insertable<TarefaRow> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('titulo')) {
      context.handle(_tituloMeta,
          titulo.isAcceptableOrUnknown(data['titulo']!, _tituloMeta));
    } else if (isInserting) {
      context.missing(_tituloMeta);
    }
    if (data.containsKey('concluida')) {
      context.handle(_concluidaMeta,
          concluida.isAcceptableOrUnknown(data['concluida']!, _concluidaMeta));
    }
    if (data.containsKey('prazo')) {
      context.handle(
          _prazoMeta, prazo.isAcceptableOrUnknown(data['prazo']!, _prazoMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TarefaRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TarefaRow(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      titulo: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}titulo'])!,
      concluida: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}concluida'])!,
      prazo: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}prazo']),
    );
  }

  @override
  $TarefaTableTable createAlias(String alias) {
    return $TarefaTableTable(attachedDatabase, alias);
  }
}

class TarefaRow extends DataClass implements Insertable<TarefaRow> {
  final int id;
  final String titulo;
  final bool concluida;
  final DateTime? prazo;
  const TarefaRow(
      {required this.id,
      required this.titulo,
      required this.concluida,
      this.prazo});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['titulo'] = Variable<String>(titulo);
    map['concluida'] = Variable<bool>(concluida);
    if (!nullToAbsent || prazo != null) {
      map['prazo'] = Variable<DateTime>(prazo);
    }
    return map;
  }

  TarefaTableCompanion toCompanion(bool nullToAbsent) {
    return TarefaTableCompanion(
      id: Value(id),
      titulo: Value(titulo),
      concluida: Value(concluida),
      prazo:
          prazo == null && nullToAbsent ? const Value.absent() : Value(prazo),
    );
  }

  factory TarefaRow.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TarefaRow(
      id: serializer.fromJson<int>(json['id']),
      titulo: serializer.fromJson<String>(json['titulo']),
      concluida: serializer.fromJson<bool>(json['concluida']),
      prazo: serializer.fromJson<DateTime?>(json['prazo']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'titulo': serializer.toJson<String>(titulo),
      'concluida': serializer.toJson<bool>(concluida),
      'prazo': serializer.toJson<DateTime?>(prazo),
    };
  }

  TarefaRow copyWith(
          {int? id,
          String? titulo,
          bool? concluida,
          Value<DateTime?> prazo = const Value.absent()}) =>
      TarefaRow(
        id: id ?? this.id,
        titulo: titulo ?? this.titulo,
        concluida: concluida ?? this.concluida,
        prazo: prazo.present ? prazo.value : this.prazo,
      );
  @override
  String toString() {
    return (StringBuffer('TarefaRow(')
          ..write('id: $id, ')
          ..write('titulo: $titulo, ')
          ..write('concluida: $concluida, ')
          ..write('prazo: $prazo')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, titulo, concluida, prazo);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TarefaRow &&
          other.id == this.id &&
          other.titulo == this.titulo &&
          other.concluida == this.concluida &&
          other.prazo == this.prazo);
}

class TarefaTableCompanion extends UpdateCompanion<TarefaRow> {
  final Value<int> id;
  final Value<String> titulo;
  final Value<bool> concluida;
  final Value<DateTime?> prazo;
  const TarefaTableCompanion({
    this.id = const Value.absent(),
    this.titulo = const Value.absent(),
    this.concluida = const Value.absent(),
    this.prazo = const Value.absent(),
  });
  TarefaTableCompanion.insert({
    this.id = const Value.absent(),
    required String titulo,
    this.concluida = const Value.absent(),
    this.prazo = const Value.absent(),
  }) : titulo = Value(titulo);
  static Insertable<TarefaRow> custom({
    Expression<int>? id,
    Expression<String>? titulo,
    Expression<bool>? concluida,
    Expression<DateTime>? prazo,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (titulo != null) 'titulo': titulo,
      if (concluida != null) 'concluida': concluida,
      if (prazo != null) 'prazo': prazo,
    });
  }

  TarefaTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? titulo,
      Value<bool>? concluida,
      Value<DateTime?>? prazo}) {
    return TarefaTableCompanion(
      id: id ?? this.id,
      titulo: titulo ?? this.titulo,
      concluida: concluida ?? this.concluida,
      prazo: prazo ?? this.prazo,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (titulo.present) {
      map['titulo'] = Variable<String>(titulo.value);
    }
    if (concluida.present) {
      map['concluida'] = Variable<bool>(concluida.value);
    }
    if (prazo.present) {
      map['prazo'] = Variable<DateTime>(prazo.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TarefaTableCompanion(')
          ..write('id: $id, ')
          ..write('titulo: $titulo, ')
          ..write('concluida: $concluida, ')
          ..write('prazo: $prazo')
          ..write(')'))
        .toString();
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(e);
  late final $TarefaTableTable tarefaTable = $TarefaTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [tarefaTable];
}
