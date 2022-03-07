String dayToString(int day) {
  switch (day) {
    case 1:
      return "Понедельник";
    case 2:
      return "Вторник";
    case 3:
      return "Среда";
    case 4:
      return "Четверг";
    case 5:
      return "Пятница";
    case 6:
      return "Суббота";
    case 7:
      return "Воскресенье";
    default:
      return "Ошибка";
  }
}

String monthToString(int month) {
  switch (month) {
    case 1:
      return "Января";
    case 2:
      return "Февраля";
    case 3:
      return "Марта";
    case 4:
      return "Апреля";
    case 5:
      return "Мая";
    case 6:
      return "Июня";
    case 7:
      return "Июля";
    case 8:
      return "Августа";
    case 9:
      return "Сентября";
    case 10:
      return "Октября";
    case 11:
      return "Ноября";
    case 12:
      return "Декабря";
    default:
      return "Ошибка";
  }
}

String dtToString(DateTime dt) {
  return dayToString(dt.weekday) +
      " " +
      dt.day.toString() +
      ' ' +
      monthToString(dt.month) +
      ' ' +
      dt.year.toString() +
      'года.';
}
