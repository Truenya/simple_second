import 'simple_date.dart';
import 'simple_time.dart';

class SimpleDateTime {
  late final SimpleDate _date;
  late final SimpleTime _time;
  SimpleDateTime(SimpleDate date, SimpleTime time)
      : _date = date,
        _time = time;
  SimpleDate date() {
    return _date;
  }

  SimpleTime time() {
    return _time;
  }

  static SimpleDateTime fromSDT(int year,
      [int month = 1,
      int day = 1,
      int hour = 0,
      int minute = 0,
      int second = 0,
      int millisecond = 0,
      int microsecond = 0]) {
    SimpleDate sd = SimpleDate(DateTime.now());
    sd.simpleDay = day;
    sd.simpleMonth = month;
    sd.simpleYear = year;
    SimpleTime st = SimpleTime(DateTime.now());
    st.simpleSecond =
        (hour * 60 * 60 + minute * 60 + second + millisecond / 1000) * 0.864;
    return SimpleDateTime(sd, st);
  }

  DateTime toDT() {
    int realYear = _date.simpleYear + 1;
    int realMonth = 1;
    int realDay = 0;
    int daysInYear = _date.simpleDay + _date.simpleMonth * 73;
    for (var daysInMonth in SimpleDate.months) {
      if (daysInYear < daysInMonth) {
        realDay = daysInYear;
        break;
      }
      daysInYear -= daysInMonth;
      realMonth++;
    }
    int secondInDay = (_time.simpleSecond * 0.864).toInt();
    int realHour = secondInDay ~/ (60 * 60);
    int realMin = secondInDay ~/ 60 - realHour * 60;
    int realSec = secondInDay ~/ 60 - realMin * 60 - realHour * 60;
    int realMSec = (((_time.simpleSecond * 0.864) * 1000) % 1000).toInt();

    return DateTime(
        realYear, realMonth, realDay, realHour, realMin, realSec, realMSec);
  }

  @override
  String toString() {
    return _date.toString() + ' ' + _time.toString();
  }
}
