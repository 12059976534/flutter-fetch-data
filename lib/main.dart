import 'package:flutter/material.dart';
import 'package:nomad/mservice.dart';
import 'package:nomad/service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Center(
              child: Text("testing"),
            ),
          ),
          body: FutureBuilder<List<Data>>(
              future: Service.getData(),
              builder: (context, snapshot) {
                var s = snapshot.data;
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data?.length,
                      itemBuilder: (context, index) {
                        return Text(snapshot.data![index].first_name);
                      });
                }
              })),
    );
  }
}
