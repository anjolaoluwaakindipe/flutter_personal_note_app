import 'package:uuid/uuid.dart';

var _uuid = const Uuid();

class Note {
  String id;
  final String note;
  final DateTime date;

  Note({required this.note, required this.date, this.id = ''}) {
    if (id == '') {
      id = _uuid.v4();
    }
  }
}

String note1 = '''
Hello,
My name is Anjolaoluwa and I live in nigeria. I think it is a very good country
''';

String note2 = '''
Yooooo, 
David how is it going,
you are looking really good if I say so myself
''';

String note3 = '''
Man I really need to leave this place
I think I have gotten  really bored
''';
String note4 = '''
1. Bathe
2. Eat
3. Sleep
4. Study
5. Watch a movie
6. Repeat
''';

List<Note> dummyNotes = [
  Note(
    note: note1,
    date: DateTime.now(),
  ),
  Note(
    note: note2,
    date: DateTime.now(),
  ),
  Note(
    note: note4,
    date: DateTime.now(),
  ),
  Note(
    note: note2,
    date: DateTime.now(),
  ),
  Note(
    note: note1,
    date: DateTime.now(),
  ),
  Note(
    note: note3,
    date: DateTime.now(),
  ),
  Note(
    note: note1,
    date: DateTime.now(),
  ),
  Note(
    note: note4,
    date: DateTime.now(),
  ),
  Note(
    note: note3,
    date: DateTime.now(),
  ),
  Note(
    note: note4,
    date: DateTime.now(),
  ),
  Note(
    note: note2,
    date: DateTime.now(),
  ),
  Note(
    note: note2,
    date: DateTime.now(),
  ),
  Note(
    note: note1,
    date: DateTime.now(),
  ),
];
