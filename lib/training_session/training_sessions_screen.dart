import 'package:flutter/material.dart';
import 'package:globo_fitness/shared/menu_bottom.dart';
import '../components/constants.dart' as constants;
import '../data/session.dart';
import '../data/sp_helper.dart';

class SessionsScreen extends StatefulWidget {
  const SessionsScreen({Key? key}) : super(key: key);

  @override
  _SessionsScreenState createState() => _SessionsScreenState();
}

class _SessionsScreenState extends State<SessionsScreen> {
  List<Session> sessions = [];
  final TextEditingController textDescritption = TextEditingController();
  final TextEditingController textDuration = TextEditingController();
  final SPHelper helper = SPHelper();

  @override
  void initState() {
    helper.init().then((value) {
      updateScreen();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const MenuBottom(),
      appBar: AppBar(
        title: const Text(constants.trainingSessionAppBarName),
      ),
      body: ListView(
        children: getContent(),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showSessionDialog(context);
        },
      ),
    );
  }

  Future<dynamic> showSessionDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(constants.alertDialogText),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  TextField(
                    controller: textDescritption,
                    decoration: InputDecoration(
                      hintText: constants.sessionData[0],
                    ),
                  ),
                  TextField(
                    controller: textDuration,
                    decoration: InputDecoration(
                      hintText: constants.sessionData[1],
                    ),
                  )
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  textDescritption.text = '';
                  textDuration.text = '';
                },
                child: Text(constants.sessionButtonsText[0]),
              ),
              ElevatedButton(
                onPressed: saveSession,
                child: Text(constants.sessionButtonsText[1]),
              )
            ],
          );
        });
  }

  Future saveSession() async {
    DateTime now = DateTime.now();
    String today = '${now.year}-${now.month}-${now.day}';
    int id = helper.getCounter() + 1;
    Session newSession = Session(
        id, today, textDescritption.text, int.tryParse(textDuration.text) ?? 0);
    helper.writeSession(newSession).then((_) {
      updateScreen();
      helper.setCounter();
    });
    textDescritption.text = '';
    textDuration.text = '';
    Navigator.of(context, rootNavigator: true).pop(context);
  }

  List<Widget> getContent() {
    List<Widget> tiles = [];
    for (var session in sessions) {
      tiles.add(Dismissible(
        key: UniqueKey(),
        onDismissed: (_) {
          helper.deleteSession(session.id).then((value) => updateScreen());
        },
        child: ListTile(
          title: Text(session.description),
          subtitle: Text('${session.date} - duration: ${session.duration} min'),
        ),
      ));
    }
    return tiles;
  }

  void updateScreen() {
    sessions = helper.getSessions();
    setState(() {});
  }
}
