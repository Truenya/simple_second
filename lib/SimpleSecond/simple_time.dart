const int ssFromMls = 864;
const int mlsInHour = 60 * 60 * 1000;
const int mlsInMinute = 60 * 1000;

class SimpleTime {
  SimpleTime(DateTime dt) {
    int mlsSinceStartOfDay = 0;
    int hour = dt.hour * mlsInHour;
    mlsSinceStartOfDay += hour;
    mlsSinceStartOfDay += dt.minute * mlsInMinute;
    mlsSinceStartOfDay += dt.second * 1000;
    mlsSinceStartOfDay += dt.millisecond;
    simpleSecond = mlsSinceStartOfDay / ssFromMls;
  }

  double simpleSecond = DateTime.now().microsecondsSinceEpoch / ssFromMls;
  @override
  String toString() {
    return simpleSecond.toStringAsFixed(3);
  }
}
