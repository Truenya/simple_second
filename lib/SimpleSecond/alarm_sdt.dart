import 'simple_dt.dart';
import 'simple_date.dart';
import 'simple_time.dart';

class SimpleAlarm {
  SimpleAlarm(DateTime dt)
      : _alarmSDT = SimpleDateTime(SimpleDate(dt), SimpleTime(dt));
  final SimpleDateTime _alarmSDT;
  dynamic isOn = true;

  toggle() {
    isOn = !isOn;
  }

  String boolToOnOff() {
    if (isOn) {
      return "On";
    } else {
      return "Off";
    }
  }

  @override
  String toString() {
    return _alarmSDT.toString() + ' ' + boolToOnOff();
  }
}
