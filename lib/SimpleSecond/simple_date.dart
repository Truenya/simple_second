// Простые даты лучше обычных
// Ведь в них каждый год недели и месяцы находятся на одних и тех же местах
class SimpleDate {
  SimpleDate(DateTime dt) {
    // Для вычисления простой даты воспользуемся текущим днем в году
    int dayInYear = daysUntilYearFromDT(dt);
    // Тут простым образом находится, является ли день выходным
    int ostatok = dayInYear % 5;
    if (ostatok == 0) {
      holyDay = true;
    } else {
      holyDay = false;
    }
    // Года начинаются с 0 как и все остальное
    simpleYear = dt.year - 1;
    dayInYear -= 1;
    // В году 5 месяцев с 0 по 4
    simpleMonth = dayInYear ~/ 73;
    simpleWeek = dayInYear ~/ 5;
    // В месяце 73 дня, с 0 по 72
    simpleDay = dayInYear - simpleMonth * 73;
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
    int month = simpleMonth + monthOffset;
    simpleMonth = month % 5;
    int yearOffset = month ~/ 5;
    if (month < 0 && simpleMonth != 0) yearOffset -= 1;
    simpleYear += yearOffset;
  }

  late bool holyDay;
  late int simpleDay;
  late int simpleWeek;
  late int simpleMonth;
  late int simpleYear;
  static const List<int> months = [
    31,
    28,
    31,
    30,
    31,
    30,
    31,
    31,
    30,
    31,
    30,
    31
  ];
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
}
