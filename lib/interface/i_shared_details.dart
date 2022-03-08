import 'package:flutter/material.dart';
import 'package:simple_second/interface/alarms/i_alarms_page.dart';

import 'time/i_time_st.dart';
import 'calendar/i_calendar_sd.dart';

int getOffset(int month) {
  int offSetByMonth = 0;
  int showedMonthInYear = (month - 10000) % 5;
  if (showedMonthInYear == 1) {
    offSetByMonth = -2;
  }
  if (showedMonthInYear == 2) {
    offSetByMonth = 1;
  }
  if (showedMonthInYear == 3) {
    offSetByMonth = -1;
  }
  if (showedMonthInYear == 4) {
    offSetByMonth = 2;
  }
  return offSetByMonth;
}

sDTAppMenu(context) {
  return
      // [
      PopupMenuButton(
          onSelected: (value) {
            var path = ModalRoute.of(context)?.settings.name;
            if (value == 0) {
              Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
            }
            if (value == 1) {
              if (Navigator.canPop(context) && path != '/calendar') {
                Navigator.popAndPushNamed(context, '/calendar');
              } else {
                Navigator.pushNamed(context, '/calendar');
              }
            }
            if (value == 2) {
              if (Navigator.canPop(context) && path != '/alarms') {
                Navigator.popAndPushNamed(context, '/alarms');
              } else {
                Navigator.pushNamed(context, '/alarms');
              }
            }
          },
          icon: const Icon(Icons.menu),
          color: Colors.blue[300],
          shape: const RoundedRectangleBorder(side: BorderSide(width: 0.5)),
          itemBuilder: (context) => [
                const PopupMenuItem(child: Text("Время"), value: 0),
                const PopupMenuItem(
                  child: Text("Календарь"),
                  value: 1,
                ),
                const PopupMenuItem(
                  child: Text("Будильники"),
                  value: 2,
                )
              ]);
  // ,
  //   CloseButton(
  //     onPressed: () => exit(0),
  //     // tooltip: 'Close app',
  //     // child: new Icon(Icons.close),
  //   ),
  // ];
}

appBarForPlatforms(context, isSmartphones, key) {
  if (isSmartphones) {
    return MaterialApp(
      title: 'Простое время',
      initialRoute: '/',
      routes: commonRoutes(key),
      theme: ThemeData(
          primarySwatch: Colors.blue,
          brightness: Brightness.light,
          fontFamily: "JetBrainsMono"),
      darkTheme: ThemeData(
          brightness: Brightness.dark, fontFamily: "JetBrainsMonoBold"),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
    );
  }
  return MaterialApp(
    title: 'Простое время',
    initialRoute: '/',
    routes: commonRoutes(key),
    theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
        fontFamily: "JetBrainsMono"),
    darkTheme:
        ThemeData(brightness: Brightness.dark, fontFamily: "JetBrainsMonoBold"),
    themeMode: ThemeMode.system,
    debugShowCheckedModeBanner: false,
  );
}

Future<String> getAlarm(context) async {
  TextEditingController _textFieldController = TextEditingController();
  String curValue = "";
  showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: const Text('TextField in Dialog'),
            content: TextField(
              onChanged: (value) {
                curValue = value;
              },
              controller: _textFieldController,
              decoration:
                  const InputDecoration(hintText: "Text Field in Dialog"),
            ),
          ));
  return curValue;
}

commonRoutes(key) => {
      // When navigating to the "/" route, build the FirstScreen widget.
      '/': (context) => const TimePage(title: "Простое время"),
      // When navigating to the "/second" route, build the SecondScreen widget.
      '/calendar': (context) => const CalendarPage(),
      '/alarms': (context) => const AlarmPage()
    };
