// // import 'package:objectbox/objectbox.dart';
// import 'dart:io';

// import '../SimpleSecond/simple_dt.dart';
// import '../objectbox.g.dart';

// class ObjBox {
//   ObjBox(Directory dir)
//       : _store = Store(getObjectBoxModel(), directory: dir.path + '/objectbox')
//   // directory:
//   //     'C://Users/true/flutter/SimpleSecond/simple_second/data')
//   {
//     _alarmBox = _store.box<Alarm>();
//     isOpen = true;
//   }
//   // ignore: prefer_typing_uninitialized_variables
//   final Store _store;
//   late final Box<Alarm> _alarmBox;
//   void close() {
//     _store.close();
//   }

//   bool isOpen = false;
//   bool opened() => isOpen;
//   void addAlarm(SimpleDateTime sdt) {
//     final alrm = Alarm.fromData(true, sdt.time().simpleSecond,
//         sdt.date().simpleDay, sdt.date().simpleMonth, sdt.date().simpleYear);
//     _alarmBox.put(alrm);
//   }

//   List<Alarm> getAlarms() {
//     return _alarmBox.getAll();
//   }
// }

// @Entity()
// class Alarm {
//   static Alarm fromData(_isOn, _stime, _sday, _smonth, _syear) {
//     Alarm alrm = Alarm();
//     alrm.isOn = _isOn;
//     alrm.stime = _stime;
//     alrm.sday = _sday;
//     alrm.smonth = _smonth;
//     alrm.syear = _syear;
//     return alrm;
//   }

//   @override
//   String toString() {
//     return syear.toString() +
//         '-' +
//         smonth.toString() +
//         '-' +
//         sday.toString() +
//         '-' +
//         stime.toString();
//   }

//   // Annotate with @Id() if name isn't "id" (case insensitive).
//   int id = 0;
//   bool? isOn;
//   int? syear;
//   int? smonth;
//   int? sday;
//   double? stime;
// }
