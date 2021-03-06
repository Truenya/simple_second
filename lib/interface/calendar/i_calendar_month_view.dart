import 'package:flutter/material.dart';
import 'package:simple_second/SimpleSecond/simple_dt.dart';
import 'package:simple_second/interface/i_shared_details.dart';
import 'package:simple_second/shared_details.dart';

import '../../SimpleSecond/simple_date.dart';

class SDMonth extends StatelessWidget {
  const SDMonth(
      {Key? key,
      required this.showedMonth,
      required this.controller,
      required this.cur})
      : super(key: key);
  final int showedMonth;
  final PageController controller;
  final SimpleDate cur;
  static Future<void> buildComplete(controller, initialPage) async {
    controller.jumpToPage(initialPage);
  }

  MaterialColor colorByIndex(int day, int offset) {
    SimpleDate sDate = SimpleDate(DateTime.now());
    int curDay = sDate.simpleDay;
    int curMonth = sDate.simpleMonth;
    if (day == curDay && showedMonth == curMonth + 10000) {
      return Colors.deepPurple;
    }
    if ((4 - ((day + offset) % 5) == 0)) {
      return Colors.red;
    }
    return Colors.amber;
  }

  @override
  Widget build(BuildContext context) {
    SimpleDate sd = SimpleDate.withOffset(
        DateTime.now(), showedMonth - 10000 - cur.simpleMonth);
    return MaterialApp(
        theme: ThemeData(
            primarySwatch: Colors.blue,
            brightness: Brightness.light,
            fontFamily: "JetBrainsMono"),
        darkTheme: ThemeData(
            brightness: Brightness.dark, fontFamily: "JetBrainsMonoBold"),
        themeMode: ThemeMode.system,
        home: Scaffold(
          appBar: AppBar(
            title: Text(sd.toStringNoDay()),
            centerTitle: true,
            leading: sDTAppMenu(context),
          ),
          body: GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 50,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  mainAxisExtent: 50,
                  childAspectRatio: 500),
              itemCount: 73,
              itemBuilder: (BuildContext context, int index) {
                DateTime dt = SimpleDateTime.fromSDT(
                        sd.simpleYear, sd.simpleMonth, index - 1)
                    .toDT();
                return Tooltip(
                  message: dtToString(dt),
                  // child: TextButton(
                  child: Card(
                    color: colorByIndex(
                        index,
                        getOffset(showedMonth +
                            SimpleDate(DateTime.now()).simpleMonth)),
                    child: Center(child: Text('$index')),
                    // shape: const RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.all(Radius.zero)),
                  ),
                  // ?????? ?????????? ???????????????????? ???????? ?? ?????????????????????? ??????????????
                  // onPressed: () {},
                  // ),
                  decoration: const BoxDecoration(color: Colors.blue),
                );
              }),
          persistentFooterButtons: [
            IconButton(
                onPressed: () => controller.previousPage(
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeIn),
                icon: const Icon(Icons.arrow_back)),
            IconButton(
                onPressed: () => controller.nextPage(
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeIn),
                icon: const Icon(Icons.arrow_forward))
          ],
        ),
        debugShowCheckedModeBanner: false);
  }

  void changePage(int index) {
    if (index == 1) {
      controller.animateToPage(showedMonth + 1,
          duration: const Duration(milliseconds: 400), curve: Curves.easeIn);
    } else {
      controller.animateToPage(showedMonth - 1,
          duration: const Duration(milliseconds: 400), curve: Curves.easeIn);
    }
  }
}
