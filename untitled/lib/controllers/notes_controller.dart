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
    _notes.removeAt(index);
    notifyListeners();
  }

  modifyNotes(index, String? title, String? subtitle) {
    _notes[index].title = title;
    _notes[index].subtitle = subtitle;
    notifyListeners();
  }
}
