import 'package:shared_preferences/shared_preferences.dart';
import 'session.dart';
import 'dart:convert';

class SPHelper {
  static late SharedPreferences preferences;

  Future init() async {
    preferences = await SharedPreferences.getInstance();
  }

  Future writeSession(Session session) async {
    preferences.setString(session.id.toString(), json.encode(session.toJson()));
  }

  List<Session> getSessions() {
    List<Session> sessions = [];
    Set<String> keys = preferences.getKeys();
    for (var key in keys) {
      if (key != 'counter') {
        Session session =
            Session.fromJson(json.decode(preferences.getString(key) ?? ''));
        sessions.add(session);
      }
    }
    return sessions;
  }

  Future setCounter() async {
    int counter = preferences.getInt('counter') ?? 0;
    counter++;
    await preferences.setInt('counter', counter);
  }

  int getCounter() {
    return preferences.getInt('counter') ?? 0;
  }

  Future deleteSession(int id) async {
    preferences.remove(id.toString());
  }
}
