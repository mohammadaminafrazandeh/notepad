import 'package:flutter/material.dart';
import 'package:untitled/models/note_model.dart';

class NotesController extends ChangeNotifier {
  final List<Note> _notes = [];

  List<Note> get getNotes => _notes;

  addNotes(Note note) {
    _notes.add(note);
    notifyListeners();
  }

  removeNotes(index) {
    var id = getNotes[index].id;
    _notes.removeWhere((note) => note.id == id);
    notifyListeners();

  }

  modifyNotes(index, String? title, String? subtitle) {
    findNotebyIDviaIndex(index).title = title;
    findNotebyIDviaIndex(index).subtitle = subtitle;
    notifyListeners();
  }

  Note findNotebyIDviaIndex(index) {
    var id = getNotes[index].id;
    return _notes.firstWhere((note) => note.id == id);
  }
}
