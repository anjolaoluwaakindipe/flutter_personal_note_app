import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jiffy/jiffy.dart';
import 'package:note_app/constants/constants.dart';
import 'package:note_app/state/riverpod/notes_provider.dart';

class NoteCard extends ConsumerWidget {
  final String note;
  final DateTime date;
  final String id;
  const NoteCard(
      {Key? key, this.note = '', required this.date, required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notes = ref.watch(notesProvider.notifier);
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 15,
      ),
      // Card
      child: Card(
        color: lightWhite,
        // Card Padding
        child: Padding(
          padding: const EdgeInsets.only(
            top: 15,
            left: 15,
            bottom: 7,
            right: 8,
          ),
          // Inside Card
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // NOTES
              Text(
                note,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[700],
                  fontWeight: FontWeight.w800,
                  height: 1.5,
                ),
              ),
              const SizedBox(
                height: 1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // DATES
                  Text(
                    Jiffy(date).yMMMMEEEEdjm,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  // EDIT
                  MaterialButton(
                    animationDuration: const Duration(milliseconds: 500),
                    height: 40,
                    minWidth: 40,
                    splashColor: darkWhite,
                    focusElevation: 0,
                    highlightElevation: 0,
                    color: const Color(0xFFFFFFFF),
                    focusColor: lightWhite,
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      // MODAL BOTTOM SHEET
                      showModalBottomSheet(
                        context: context,
                        isDismissible: true,
                        builder: (BuildContext context) {
                          // we set up a container inside which
                          // we create center column and display text
                          return Container(
                            height: 150,
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  // EDIT BUTTON
                                  ListTile(
                                    trailing: const Icon(
                                        Icons.edit_attributes_rounded,
                                        color: blue),
                                    onTap: () {},
                                    title: const Text(
                                      "Edit",
                                      style: TextStyle(
                                        color: blue,
                                        fontWeight: FontWeight.w600,
                                        wordSpacing: 1.2,
                                      ),
                                    ),
                                  ),
                                  const Divider(),
                                  // DELETE BUTTON
                                  ListTile(
                                    trailing: const Icon(
                                      Icons.delete,
                                      color: blue,
                                    ),
                                    onTap: () {
                                      Navigator.of(context).pop();

                                      // DELETE DIALOG BOX
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return Dialog(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                elevation: 0,
                                                backgroundColor:
                                                    Colors.transparent,
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 20,
                                                          right: 15,
                                                          bottom: 15,
                                                          top: 40),
                                                  height: 200,
                                                  width: 200,
                                                  decoration: BoxDecoration(
                                                    color: lightWhite,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      20,
                                                    ),
                                                  ),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: <Widget>[
                                                      Text(
                                                        "Are you sure you want to delete this note?",
                                                        style: TextStyle(
                                                          fontSize: 20,
                                                          height: 1.5,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color:
                                                              Colors.grey[600],
                                                        ),
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: <Widget>[
                                                          TextButton(
                                                            style: TextButton.styleFrom(
                                                                textStyle: const TextStyle(
                                                                    color: Colors
                                                                        .red)),
                                                            onPressed: () {
                                                              notes.deleteNote(
                                                                  id);
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            },
                                                            child: const Text(
                                                              "Delete",
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            width: 8,
                                                          ),
                                                          TextButton(
                                                            onPressed: () {
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            },
                                                            child: const Text(
                                                                "Cancel"),
                                                          )
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ));
                                          });
                                    },
                                    title: const Text(
                                      "Delete",
                                      style: TextStyle(
                                        color: blue,
                                        fontWeight: FontWeight.w600,
                                        wordSpacing: 1.2,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    elevation: 0,
                    child: Icon(
                      Icons.edit,
                      color: Colors.grey[600],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
