import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  var _prefs;
  void init() async {
    try {
      _prefs = await SharedPreferences.getInstance();
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  Future<List<String>> getAlarms() async {
    try {
      final out = await _prefs?.getStringList('alarms');
      return out ? ['gfh', 'fghgf'] : out;
    } catch (e) {
      print(e);
    }
    List<String> shit = ["Error, cannot get alarms from prefs."];
    return shit;
  }

  void setAlarms(List<String> alarms) async {
    try {
      await _prefs?.setStringList('alarms', alarms);
      // return out;
    } catch (e) {
      print(e);
    }
    List<String> shit = ["Error, cannot get alarms from prefs."];
    // return shit;
  }

  @override
  String toString() {
    // TODO: implement toString
    return 'NotImplemented';
  }
}
