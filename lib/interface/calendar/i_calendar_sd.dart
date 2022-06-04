import 'package:flutter/material.dart';
import '../../SimpleSecond/simple_date.dart';
import 'i_calendar_month_view.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({Key? key}) : super(key: key);

  // @override
  // Widget build(BuildContext context) {
  //   // if platform windows
  //   // column with pageview
  //   // and buttons on bottom in line

  //   final PageController controller = PageController();
  //   Future<void>.delayed(
  //       Duration.zero,
  //       () => SDMonth.buildComplete(
  //           controller, 10000 + SimpleDate(DateTime.now()).simpleMonth));

  //   return PageView.builder(
  //     controller: controller,
  //     itemBuilder: (context, index) {
  //       return SDMonth(
  //           showedMonth: index,
  //           controller: controller,
  //           cur: SimpleDate(DateTime.now()));
  //     },
  //     // reverse: true,
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    // if platform windows
    // column with pageview
    // and buttons on bottom in line

    final PageController controller = PageController();
    Future<void>.delayed(
        Duration.zero,
        () => SDMonth.buildComplete(
            controller, 10000 + SimpleDate(DateTime.now()).simpleMonth));

    void changePage(int index) {
      if (index == 1) {
        controller.nextPage(
            duration: const Duration(milliseconds: 400), curve: Curves.easeIn);
      } else {
        controller.previousPage(
            duration: const Duration(milliseconds: 400), curve: Curves.easeIn);
      }
    }

    return
        // Column(key: key, children: [
        PageView.builder(
      controller: controller,
      itemBuilder: (context, index) {
        return SDMonth(
            showedMonth: index,
            controller: controller,
            cur: SimpleDate(DateTime.now()));
      },
      // reverse: true,
    );
    // Row(
    //   key: key,
    //   children: [
    //     IconButton(
    //         onPressed: () => controller.previousPage(
    //             duration: const Duration(milliseconds: 400),
    //             curve: Curves.easeIn),
    //         icon: const Icon(Icons.arrow_back)),
    //     IconButton(
    //         onPressed: () => controller.nextPage(
    //             duration: const Duration(milliseconds: 400),
    //             curve: Curves.easeIn),
    //         icon: const Icon(Icons.arrow_forward))
    //   ],
    // )
    // ]);
  }
}
