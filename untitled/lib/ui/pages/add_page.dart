import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/controllers/bottom_navigation_bar_conroller.dart';
import 'package:untitled/controllers/notes_controller.dart';
import 'package:untitled/models/note_model.dart';

// ignore: must_be_immutable
class AddPage extends StatelessWidget {
  AddPage({super.key});

  final Note _noteEdit = Note();
  @override
  Widget build(BuildContext context) {
    return Consumer<NotesController>(builder: (_, notesController, child) {
      return Scaffold(
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 200,
                height: 50,
                child: TextFormField(
                  validator: (value) => value ?? 'Title cannot be blank',
                  decoration: textFormDecoration('Title'),
                  cursorColor: Colors.teal,
                  onChanged: (value) {
                    _noteEdit.title = value;
                  },
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                width: 200,
                height: 50,
                child: TextFormField(
                  validator: (value) => value ?? 'Subtitle cannot be blank',
                  decoration: textFormDecoration('Subtitle'),
                  cursorColor: Colors.teal,
                  onChanged: (value) {
                    _noteEdit.subtitle = value;
                  },
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                onPressed: () {
                  notesController.addNotes(_noteEdit);
                  context.read<BottomNavigationBarController>().setTabIndex(0);
                },
                style:
                    ElevatedButton.styleFrom(backgroundColor: Colors.teal[100]),
                child: const Text(
                  'save',
                  style: TextStyle(color: Colors.teal),
                ),
              ),
            ],
          ),
        ),
      );
    });
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
}
