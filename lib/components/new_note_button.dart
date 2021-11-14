import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:note_app/constants/constants.dart';
import 'package:note_app/state/riverpod/notes_provider.dart';

class NewNoteButton extends ConsumerWidget {
  const NewNoteButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notes = ref.watch(notesProvider.notifier);
    return MaterialButton(
      elevation: 0,
      highlightElevation: 0,
      height: 50,
      minWidth: 100,
      color: blue,
      onPressed: () {
        notes.clearNotesTest();
      },
      child: Container(
        width: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            100,
          ),
          border: Border.all(
            width: 2,
            color: Colors.white,
          ),
        ),
        child: const Icon(
          Icons.add,
          color: lightWhite,
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
    );
  }
}
