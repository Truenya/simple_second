import 'package:flutter/material.dart';
import 'i_calendar_month_view.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    Future<void>.delayed(
        Duration.zero, () => SDMonth.buildComplete(controller, 10000));

    return PageView.builder(
      controller: controller,
      itemBuilder: (context, index) {
        return SDMonth(
          showedMonth: index,
          controller: controller,
        );
      },
      // reverse: true,
    );
  }
}
