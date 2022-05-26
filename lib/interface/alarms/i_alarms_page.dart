import 'package:flutter/material.dart';
import 'package:simple_second/data_storage/sh_prefs.dart';

// import '../../SimpleSecond/alarm_sdt.dart';
// import '../../data_storage/sqlite.dart';
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
          body: Expanded(
            child: AlarmList(key: key),
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
  State<StatefulWidget> createState() {
    return _AlarmListState();
  }
}

class _AlarmListState extends State<AlarmList> {
  // SqliteStore store;
  // AlarmListState() : store = SqliteStore() {
  //   store.open();
  // }
  // List<Alarm>? curAlarms;
  late LocalStorage store;
  late Future<List<String>> _curAlarms;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    store = LocalStorage();
    store.init();
    _curAlarms = store.getAlarms();
  }

  @override
  Widget build(BuildContext context) {
    final ScrollController controller = ScrollController();
    return Center(
        child: FutureBuilder<List<String>>(
            future: _curAlarms,
            initialData: ['Waiting'],
            builder:
                (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircularProgressIndicator(),
                    Visibility(
                      visible: snapshot.hasData,
                      child: Text(
                        snapshot.data!.first,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 24),
                      ),
                    )
                  ],
                );
              } else if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  return const Text('Error');
                } else if (snapshot.hasData) {
                  return Text(snapshot.data!.first,
                      style: const TextStyle(color: Colors.teal, fontSize: 36));
                } else {
                  return const Text('Empty data');
                }
              } else {
                return Text('State: ${snapshot.connectionState}');
              }
            }));
    // final ScrollController controller = ScrollController();
    // await curAlarms;
    // store.addAlarm(Alarm(
    //     id: 0, isOn: false, sday: 54, smonth: 0, syear: 2021, stime: 80000));
    // curAlarms = store.alarms();

    // return ListView.builder(
    //   controller: controller,
    //   itemCount: curAlarms.length,
    //   itemBuilder: (context, index) {
    //     return AlarmRow(
    //         displayedAlarm: curAlarms.isEmpty ? "No Alarms" : curAlarms[index]);
    // },
    // : const SliverGridDelegateWithMaxCrossAxisExtent(
    //     maxCrossAxisExtent: 100,
    //     crossAxisSpacing: 100,
    //     mainAxisSpacing: 100,
    //     mainAxisExtent: 100,
    //     childAspectRatio: 500),

    // reverse: true,
    // );
  }
}

class AlarmRow extends StatelessWidget {
  const AlarmRow({Key? key, required this.displayedAlarm}) : super(key: key);
  final String displayedAlarm;
  @override
  Widget build(BuildContext context) {
    return Text(
      displayedAlarm,
      style: const TextStyle(fontFamily: "JetBrainsMono"),
    );
  }
}
