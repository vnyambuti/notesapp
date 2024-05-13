import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:notes/models/notes.dart';
import 'package:path_provider/path_provider.dart';

class NotesDatabase extends ChangeNotifier {
  static late Isar isar;

  Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();

    isar = await Isar.open([NoteSchema], directory: dir.path);
  }

  List<Note> currentnotes = [];

  Future<void> addNote(note) async {
    final newNote = Note()..text = note;

    await isar.writeTxn(() => isar.notes.put(newNote));
    getNotes();
  }

  Future<void> getNotes() async {
    List<Note> fetchedNotes = await isar.notes.where().findAll();
    currentnotes = fetchedNotes;
    notifyListeners();
  }

  Future<void> updateNote(Note note, text) async {
    final fetchnote = await isar.notes.get(note.id);
    if (fetchnote != null) {
      fetchnote.text = text;
      await isar.writeTxn(() => isar.notes.put(fetchnote));
      getNotes();
    }
  }

  Future<void> deleteNote(id) async {
    await isar.writeTxn(() => isar.notes.delete(id));
    getNotes();
  }
}
