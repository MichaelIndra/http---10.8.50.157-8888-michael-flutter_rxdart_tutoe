import 'package:lat_rxdart/models/notepad.dart';
import 'package:rxdart/rxdart.dart';

class NotepadRx {
  List<Notepad> notepads = [];
  late BehaviorSubject<List<Notepad>> _subjectNotepad;

  NotepadRx() {
    _subjectNotepad = BehaviorSubject<List<Notepad>>();
  }
  ValueStream<List<Notepad>> get allNotepads {
    return _subjectNotepad.stream;
  }

  void addNotepad(Notepad ntpd) {
    notepads.add(ntpd);
    _subjectNotepad.sink.add(notepads);
  }

  void dispose() {
    _subjectNotepad.close();
  }
}
