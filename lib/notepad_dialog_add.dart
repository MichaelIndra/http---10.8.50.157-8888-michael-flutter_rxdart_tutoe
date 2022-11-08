import 'package:flutter/material.dart';
import 'package:lat_rxdart/models/notepad.dart';
import 'package:lat_rxdart/rx/notepadrx.dart';

class NotepadDialogAdd extends StatefulWidget {
  final NotepadRx ntpdRx;
  // const NotepadDialogAdd({Key? key}) : super(key: key);
  const NotepadDialogAdd({Key? key, required this.ntpdRx}) : super(key: key);

  @override
  State<NotepadDialogAdd> createState() => _NotepadDialogAddState();
}

class _NotepadDialogAddState extends State<NotepadDialogAdd> {
  @override
  Widget build(BuildContext context) {
    late String title, note;
    return AlertDialog(
      title: const Text('Tambah Notepad'),
      content: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(children: [
          TextField(
            decoration: const InputDecoration(hintText: "Judul"),
            onChanged: (value) {
              title = value;
            },
            // controller: _textFieldController,
          ),
          TextField(
            decoration: const InputDecoration(hintText: "Catatan"),
            keyboardType: TextInputType.multiline,
            maxLines: 4,
            onChanged: (value) {
              note = value;
            },

            // controller: _textFieldController,
          ),
        ]),
      ),
      actions: <Widget>[
        TextButton(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Colors.red),
          ),
          child: const Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop(true);
          },
        ),
        TextButton(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Colors.red),
          ),
          child: const Text('Add'),
          onPressed: () {
            widget.ntpdRx.addNotepad(Notepad(title: title, note: note));

            Navigator.of(context).pop(true);
          },
        ),
      ],
    );
  }
}

// class NotepadDialogAdd extends StatelessWidget {
//   // final NotepadRx ntpdRx;

//   const NotepadDialogAdd({Key? key}) : super(key: key);
//   // const NotepadDialogAdd({Key? key, required this.ntpdRx}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     late String title, note;
//     return AlertDialog(
//       title: const Text('Tambah Notepad'),
//       content: Container(
//         width: MediaQuery.of(context).size.width,
//         height: MediaQuery.of(context).size.height,
//         child: Column(children: [
//           TextField(
//             decoration: const InputDecoration(hintText: "Judul"),
//             onChanged: (value) {
//               title = value;
//             },
//             // controller: _textFieldController,
//           ),
//           TextField(
//             decoration: const InputDecoration(hintText: "Catatan"),
//             onChanged: (value) {
//               note = value;
//             },

//             // controller: _textFieldController,
//           ),
//         ]),
//       ),
//       actions: <Widget>[
//         TextButton(
//           style: ButtonStyle(
//             foregroundColor: MaterialStateProperty.all(Colors.red),
//           ),
//           child: const Text('Cancel'),
//           onPressed: () {
//             Navigator.of(context).pop(true);
//           },
//         ),
//         TextButton(
//           style: ButtonStyle(
//             foregroundColor: MaterialStateProperty.all(Colors.red),
//           ),
//           child: const Text('Add'),
//           onPressed: () {
//             // ntpdRx.addNotepad(Notepad(title: title, note: note));

//             Navigator.of(context).pop(true);
//           },
//         ),
//       ],
//     );
//   }
// }
