// import 'dart:io' show Platform;

import 'package:flutter/material.dart';

import '../SimpleSecond/alarm_sdt.dart';
import '../data_storage/sqlite.dart';
import 'i_add_alarm_dialog.dart';
import 'i_shared_details.dart';

class AlarmPage extends StatelessWidget {
  const AlarmPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: {
          '/add_alarm': (context) {
            return DialogAddAlarm(key: key);
          }
        },
        theme: ThemeData(
            primarySwatch: Colors.blue,
            brightness: Brightness.light,
            fontFamily: "JetBrainsMono"),
        darkTheme: ThemeData(
            brightness: Brightness.dark, fontFamily: "JetBrainsMonoBold"),
        themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
              title: const Text("Будильники"),
              centerTitle: true,
              leading: sDTAppMenu(context)),
          body: Center(
            child: AlarmList(key: key),
          ),

          floatingActionButton: FloatingActionButton(
              onPressed: () => {
                    MaterialPageRoute(
                        builder: (context) => const DialogAddAlarm()),
                  },
              tooltip: 'AddAlarm',
              child: const Icon(Icons
                  .calendar_today)), // This trailing comma makes auto-formatting nicer for build methods.
        ));
  }
}

class AlarmList extends StatefulWidget {
  const AlarmList({Key? key}) : super(key: key);
  @override
  // ignore: no_logic_in_create_state
  AlarmListState createState() => AlarmListState();
}

class AlarmListState extends State {
  late SqliteStore store;
  AlarmListState() {
    store.open();
  }
  List<Alarm>? curAlarms;
  @override
  Widget build(BuildContext context) {
    final ScrollController controller = ScrollController();
    curAlarms = store.alarms();
    return ListView.builder(
      controller: controller,
      itemBuilder: (context, index) {
        return AlarmRow(
            displayedAlarm: curAlarms!.isEmpty
                ? Alarm(
                    id: index,
                    isOn: true,
                    stime: 50000.124 + index,
                    sday: 25,
                    smonth: 2,
                    syear: 2021)
                : curAlarms!.elementAt(index));
      },

      // reverse: true,
    );
  }
}

class AlarmRow extends StatelessWidget {
  const AlarmRow({Key? key, required this.displayedAlarm}) : super(key: key);
  final Alarm displayedAlarm;
  @override
  Widget build(BuildContext context) {
    return Text(
      displayedAlarm.toString(),
      style: const TextStyle(fontFamily: "JetBrainsMono"),
    );
  }
}
