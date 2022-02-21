class Alarm {
  Alarm(
      {required this.id,
      required this.isOn,
      required this.stime,
      required this.sday,
      required this.smonth,
      required this.syear});

  @override
  String toString() {
    return syear.toString() +
        '-' +
        smonth.toString() +
        '-' +
        sday.toString() +
        '-' +
        stime.toString() +
        '  ' +
        isOnToString();
  }

  String isOnToString() {
    return isOn ? "On." : "Off.";
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'isOn': isOn,
      'simpleYear': syear,
      'simpleMonth': smonth,
      'simpleDay': sday,
      'simpleTime': stime
    };
  }

  // Annotate with @Id() if name isn't "id" (case insensitive).
  final int id;
  bool isOn;
  int syear;
  int smonth;
  int sday;
  double stime;
}
