import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes/components/drawer.dart';
import 'package:notes/models/notes.dart';
import 'package:notes/models/notes_database.dart';
import 'package:provider/provider.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  final textcontroller = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getnotes();
  }

  void addnote() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("New Note"),
        content: TextField(
          controller: textcontroller,
        ),
        actions: [
          MaterialButton(
            onPressed: () {
              context.read<NotesDatabase>().addNote(textcontroller.text);
              textcontroller.clear();
              Navigator.pop(context);
            },
            child: Text("Save"),
          )
        ],
      ),
    );
  }

  void getnotes() {
    context.read<NotesDatabase>().getNotes();
  }

  void delete(note) {
    context.read<NotesDatabase>().deleteNote(note.id);
  }

  void update(Note note) {
    textcontroller.text = note.text;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Edit Note"),
        content: TextField(
          controller: textcontroller,
        ),
        actions: [
          MaterialButton(
            onPressed: () {
              context
                  .read<NotesDatabase>()
                  .updateNote(note, textcontroller.text);
              textcontroller.clear();
              Navigator.pop(context);
            },
            child: Text("Save"),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final db = context.watch<NotesDatabase>();
    final notes = db.currentnotes;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      drawer: MyDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => addnote(),
        child: Icon(Icons.add),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Text(
              "Notes",
              style: GoogleFonts.dmSerifText(
                  fontSize: 40,
                  color: Theme.of(context).colorScheme.inversePrimary),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) {
                final note = notes[index];
                return ListTile(
                  leading: Text(note.text),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                          onPressed: () => update(note),
                          icon: Icon(Icons.edit)),
                      IconButton(
                          onPressed: () => delete(note),
                          icon: Icon(Icons.delete))
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
