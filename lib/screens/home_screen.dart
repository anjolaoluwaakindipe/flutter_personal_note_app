import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:note_app/components/new_note_button.dart';
import 'package:note_app/components/note_appbar.dart';
import 'package:note_app/components/note_card.dart';
import 'package:note_app/constants/constants.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/state/riverpod/notes_provider.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final List<Note> notes = ref.watch<List<Note>>(notesProvider);

    return Scaffold(
      backgroundColor: darkWhite,
      appBar: noteAppBar,
      body: notes.isNotEmpty
          ? ListView.builder(
              addAutomaticKeepAlives: false,
              itemCount: notes.length,
              itemBuilder: (BuildContext context, int index) {
                return NoteCard(
                  date: notes[index].date,
                  note: notes[index].note,
                  key: ValueKey(notes[index].id),
                  id: notes[index].id,
                );
              })
          : Center(
              widthFactor: double.infinity,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  ''' You don't have any notes :( 
Please click the button below to add a new note.
                ''',
                  style: TextStyle(
                    letterSpacing: 1.1,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    height: 1.2,
                    color: Colors.grey[700],
                  ),
                  textAlign: TextAlign.center,
                  softWrap: true,
                ),
              ),
            ),
      floatingActionButton: const NewNoteButton(),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
    );
  }
}
