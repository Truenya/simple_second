import 'dart:async';

import 'package:flutter/material.dart';

import '../SimpleSecond/simple_date.dart';
import '../SimpleSecond/simple_time.dart';
import 'i_shared_details.dart';

class TimePage extends StatefulWidget {
  const TimePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<TimePage> createState() => _TimePageState();
}

const double tick = 0.001;

class _TimePageState extends State<TimePage> {
  double now = 0;
  double prev = 0;
  late Timer timer;
  @override
  void initState() {
    timer = Timer.periodic(const Duration(milliseconds: 86), (timer) {
      setState(() {
        now = SimpleTime(DateTime.now()).simpleSecond;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    prev = now;
    now = SimpleTime(DateTime.now()).simpleSecond;
    var curSimpleTimeW = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          now.toStringAsFixed(3),
          style: Theme.of(context).textTheme.headline4,
        ),
        Text(
          SimpleDate(DateTime.now()).toString(),
          // style: const TextStyle(fontFamily: "JetBrainsMonoBold"),
        )
      ],
    );
    return Scaffold(
      appBar: AppBar(
          title: Text(widget.title),
          centerTitle: true,
          leading: sDTAppMenu(context)),
      body: Center(
        child: curSimpleTimeW,
      ),

      // floatingActionButton: FloatingActionButton(
      //     onPressed: () => {
      //           if (Navigator.canPop(context))
      //             {Navigator.popAndPushNamed(context, '/')}
      //         },
      //     tooltip: 'Increment',
      //     child: const Icon(Icons
      //         .calendar_today)), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
