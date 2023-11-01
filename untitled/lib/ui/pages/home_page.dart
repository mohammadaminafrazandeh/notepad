import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/controllers/notes_controller.dart';
import 'package:untitled/models/note_model.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NotesController>(builder: (_, noteController, child) {
      Note note = Note();
      return Scaffold(
        body: noteController.getNotes.isEmpty
            ? const Center(child: Text('Enter somthing in other page...'))
            : ListView.builder(
                itemCount: noteController.getNotes.length,
                itemBuilder: (context, index) {
                  Note desiredNote = noteController.findNotebyIDviaIndex(index);
                  return ListTile(
                    title: Text(
                        desiredNote.title ?? 'no entrance recorded for title'),
                    subtitle: Text(desiredNote.subtitle ??
                        'no entrance recorded for subtitle'),
                    onLongPress: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Edit note'),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  TextFormField(
                                    controller: TextEditingController(
                                        text: noteController
                                            .getNotes[index].title),
                                    decoration: textFormDecoration('Title'),
                                    onChanged: (value) {
                                      note.title = value;
                                    },
                                  ),
                                  const SizedBox(height: 25),
                                  TextFormField(
                                    controller: TextEditingController(
                                        text: noteController
                                            .getNotes[index].subtitle),
                                    decoration: textFormDecoration('Subtitle'),
                                    onChanged: (value) {
                                      note.subtitle = value;
                                    },
                                  ),
                                  const SizedBox(height: 25),
                                  ElevatedButton(
                                    onPressed: () {
                                      noteController.modifyNotes(
                                          index, note.title, note.subtitle);

                                      Navigator.pop(context);
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.teal[100]),
                                    child: const Text(
                                      'Edit',
                                      style: TextStyle(color: Colors.teal),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          });
                    },
                    trailing: GestureDetector(
                      onTap: () {
                        noteController.removeNotes(index);
                      },
                      child: const Icon(Icons.delete_outline),
                    ),
                  );
                },
              ),
      );
    });
  }
}

InputDecoration textFormDecoration(String label) {
  return InputDecoration(
    label: Text(label),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(50),
      borderSide: const BorderSide(
        color: Colors.teal,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(50),
      borderSide: const BorderSide(
        color: Colors.teal,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(50),
      borderSide: const BorderSide(
        color: Colors.deepPurple,
      ),
    ),
  );
}
