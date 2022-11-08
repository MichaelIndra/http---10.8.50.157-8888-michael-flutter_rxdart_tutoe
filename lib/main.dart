import 'package:flutter/material.dart';
import 'package:lat_rxdart/models/notepad.dart';
import 'package:lat_rxdart/notepad_dialog_add.dart';
import 'package:lat_rxdart/rx/macamrx.dart';
import 'package:lat_rxdart/rx/notepadrx.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo RX Dart'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

final MacamRx _macamRx = MacamRx();

class _MyHomePageState extends State<MyHomePage> {
  NotepadRx notepadRx = NotepadRx();

  @override
  void dispose() {
    notepadRx.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _macamRx.publishRX();
    _macamRx.behaviorRX();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
          child: StreamBuilder<List<Notepad>>(
        stream: notepadRx.allNotepads,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Notepad> notepads = snapshot.data!;
            return ListView.builder(
                itemCount: notepads.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5,
                    margin: const EdgeInsets.only(bottom: 5),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: ListTile(
                      title: Text(notepads[index].title),
                      subtitle: Text(notepads[index].note),
                    ),
                  );
                });
          }
          return const Center(
            child: Text('Notepad kosong bos'),
          );
        },
      )),
      floatingActionButton: FloatingActionButton(
        // onPressed: showMenuDialogAdd(context),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: ((context) => NotepadDialogAdd(
                    ntpdRx: notepadRx,
                  ))));
          // builder: ((context) => const NotepadDialogAdd())));
        },
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  showMenuDialogAdd(BuildContext context) {
    // Future.delayed(Duration.zero, () {
    //   showDialog(
    //       context: context,
    //       // barrierDismissible: false,
    //       builder: (BuildContext context) {
    //         // return NotepadDialogAdd(ntpdRx: notepadRx);
    //         return const NotepadDialogAdd();
    //       });
    // });
  }
}
