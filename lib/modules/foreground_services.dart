// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:flutter_foreground_plugin/flutter_foreground_plugin.dart';
//
// class MyHomePageS extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePageS> {
//   bool isServiceRunning = false;
//
//   Future<void> startForegroundService() async {
//     await FlutterForegroundPlugin.startForegroundService(iconName: 'd', title: 'wasd'
//     );
//     setState(() {
//       isServiceRunning = true;
//     });
//   }
//
//   Future<void> stopForegroundService() async {
//     await FlutterForegroundPlugin.stopForegroundService();
//     setState(() {
//       isServiceRunning = false;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Flutter Foreground Service'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             if (isServiceRunning)
//               Text('Foreground service is running')
//             else
//               Text('Foreground service is not running'),
//             SizedBox(height: 20),
//             if (isServiceRunning)
//               ElevatedButton(
//                 onPressed: stopForegroundService,
//                 child: Text('Stop Foreground Service'),
//               )
//             else
//               ElevatedButton(
//                 onPressed: startForegroundService,
//                 child: Text('Start Foreground Service'),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }