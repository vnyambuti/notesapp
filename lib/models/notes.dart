import 'package:isar/isar.dart';

part 'notes.g.dart';

@collection
class Note {
  Id id = Isar.autoIncrement;

  late String text;
}
