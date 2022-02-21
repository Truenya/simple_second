import 'package:flutter/material.dart';
import 'package:simple_second/interface/i_shared_details.dart';

import '../SimpleSecond/simple_date.dart';

class SDMonth extends StatelessWidget {
  const SDMonth({Key? key, required this.showedMonth, required this.controller})
      : super(key: key);
  final int showedMonth;
  final PageController controller;

  static Future<void> buildComplete(controller, initialPage) async {
    controller.jumpToPage(initialPage);
  }

  MaterialColor colorByIndex(int index) {
    SimpleDate sDate = SimpleDate(DateTime.now());
    int curDay = sDate.simpleDay;
    int curMonth = sDate.simpleMonth;
    if (index == curDay && showedMonth == curMonth + 10000) {
      return Colors.deepPurple;
    }
    if ((4 - ((index) % 5) == 0)) return Colors.red;
    return Colors.amber;
  }

  @override
  Widget build(BuildContext context) {
    SimpleDate sd = SimpleDate.withOffset(DateTime.now(), showedMonth - 10000);
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
            title: Text(sd.toString()),
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
                return Card(
                  color: colorByIndex(index + getOffset(showedMonth)),
                  child: Center(child: Text('$index')),
                );
              }),
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
