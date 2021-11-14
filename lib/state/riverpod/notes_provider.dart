import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:note_app/models/note_model.dart';

final notesProvider = StateNotifierProvider<NotesNotifier, List<Note>>((ref) {
  return NotesNotifier();
});

class NotesNotifier extends StateNotifier<List<Note>> {
  NotesNotifier() : super(dummyNotes);

  void clearNotesTest() {
    state = [];
  }

  void addNote(Note newNote) {
    state = [...state, newNote];
  }

  void editNote(Note editedNote) {
    for (Note note in state) {
      if (note.id == editedNote.id) {
        Note(note: editedNote.note, date: DateTime.now(), id: editedNote.id);
      } else {
        note;
      }
    }
  }

  void deleteNote(String id) {
    state = state.where((note) => note.id != id).toList();
  }
}
