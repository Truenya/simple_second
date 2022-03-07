import 'package:flutter/material.dart';

import '../../SimpleSecond/alarm_sdt.dart';
import '../../data_storage/sqlite.dart';
import '../i_shared_details.dart';
// import 'i_custom_date_picker.dart';

class AlarmPage extends StatelessWidget {
  const AlarmPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
            child: Expanded(child: AlarmList(key: key)),
          ),

          floatingActionButton: FloatingActionButton(
              onPressed: () {
                // showSDatePicker(context,
                //     firstDate: DateTime(1800),
                //     initialDate: DateTime.now(),
                //     lastDate: DateTime(2220));
              },
              tooltip: 'AddAlarm',
              child: const Icon(Icons
                  .alarm)), // This trailing comma makes auto-formatting nicer for build methods.
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
  SqliteStore store;
  AlarmListState() : store = SqliteStore() {
    store.open();
  }
  List<Alarm>? curAlarms;
  @override
  Widget build(BuildContext context) {
    final ScrollController controller = ScrollController();
    store.addAlarm(Alarm(
        id: 0, isOn: false, sday: 54, smonth: 0, syear: 2021, stime: 80000));
    curAlarms = store.alarms();

    return GridView.builder(
      controller: controller,
      itemCount: curAlarms?.length,
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
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 50,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          mainAxisExtent: 50,
          childAspectRatio: 500),

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
