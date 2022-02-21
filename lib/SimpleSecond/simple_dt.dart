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

  @override
  String toString() {
    return _date.toString() + ' ' + _time.toString();
  }
}
