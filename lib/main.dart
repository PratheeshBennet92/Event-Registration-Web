import 'package:flutter/material.dart';
import 'package:event_registration_web/form.dart';
import 'dart:html' as html;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   // String initialUrl = 'https://example.com/register?eventId=YOUR_EVENT_ID_HERE&eventName=YOUR_EVENT_NAME_HERE';
     String initialUrl = html.window.location.href;
    // Extract the event ID and event name from the URL
    Uri uri = Uri.parse(initialUrl);
    String? eventId = uri.queryParameters['eventId'];
    String? eventName = uri.queryParameters['eventName'];
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: FormWidget(eventName: eventName ?? "")
    );
  }
}
