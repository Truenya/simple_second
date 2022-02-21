class SimpleDate {
  SimpleDate(DateTime dt) {
    int dayInYear = daysUntilYearFromDT(dt);
    int ostatok = dayInYear % 5;
    if (ostatok == 0) {
      holyDay = true;
    } else {
      holyDay = false;
    }
    simpleYear = dt.year - 1;
    simpleMonth = dayInYear ~/ 73;
    simpleWeek = (dayInYear) ~/ 5;
    simpleDay = dayInYear - simpleMonth * 73 - 1;
  }
  int daysUntilYearFromDT(DateTime dt) {
    int days = 0;
    int counter = 1;
    for (int daysinmonth in months) {
      if (counter == dt.month) break;
      days += daysinmonth;
      counter++;
    }
    days += dt.day;
    // return (dt.month - 1) ~/ 2 + 1 + dt.month * 30;
    return days;
  }

  static SimpleDate withOffset(DateTime dt, int monthOffset) {
    SimpleDate sd = SimpleDate(dt);
    sd._setOffsetByMonth(monthOffset);
    return sd;
  }

  void _setOffsetByMonth(int monthOffset) {
    if (monthOffset >= 0) {
      if (simpleMonth + monthOffset >= 0 && simpleMonth + monthOffset < 5) {
        simpleMonth = simpleMonth + monthOffset;
      } else {
        simpleMonth = simpleMonth + monthOffset % 5;
        simpleYear = simpleYear + monthOffset ~/ 5;
      }
    } else {
      if (simpleMonth + monthOffset >= 0 && simpleMonth + monthOffset < 5) {
        simpleMonth = simpleMonth + monthOffset;
      } else {
        simpleMonth = simpleMonth + (monthOffset % 5);
        simpleYear = simpleYear + (monthOffset ~/ 5 - 1);
      }
    }
  }

  late bool holyDay;
  late int simpleDay;
  late int simpleWeek;
  late int simpleMonth;
  late int simpleYear;
  @override
  String toString() {
    return simpleYear.toString() +
        '.' +
        simpleMonth.toString() +
        // '.' +
        // simpleWeek.toString() +
        '.' +
        simpleDay.toString();
  }

  String toStringNoDay() {
    return simpleYear.toString() + '.' + simpleMonth.toString();
    // +'.' +
    // simpleWeek.toString() +
    // '.' +
    // simpleDay.toString();
  }

  String toStringWithDashes() {
    return simpleYear.toString() +
        '-' +
        simpleMonth.toString() +
        // '.' +
        // simpleWeek.toString() +
        '-' +
        simpleDay.toString();
  }

  List<int> months = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
}
