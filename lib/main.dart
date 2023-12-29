import 'dart:convert';
import 'package:api_integration_example/pages/byron.dart';
import 'package:api_integration_example/pages/george.dart';
import 'package:api_integration_example/pages/lindsay.dart';
import 'package:api_integration_example/pages/micheal.dart';
import 'package:api_integration_example/pages/rachel.dart';
import 'package:api_integration_example/pages/tobias.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

Map? mapResponse;
List? listResponse;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future apiCall() async {
    http.Response response;
    response = await http.get(Uri.parse('https://reqres.in/api/users?page=2'));
    if (response.statusCode == 200) {
      setState(() {
        mapResponse = json.decode(response.body);
        listResponse = mapResponse?['data'];
      });
    }
  }

  @override
  void initState() {
    apiCall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("API Integration"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MichealProfile()));
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(60),
                        child: Image.network(listResponse![0]['avatar']),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LindsayProfile()));
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(60),
                        child: Image.network(listResponse![1]['avatar']),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TobiasProfile()));
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(60),
                        child: Image.network(listResponse![2]['avatar']),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ByronProfile()));
                      },
                      child: Image.network(listResponse![3]['avatar']),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GeorgeProfile()));
                      },
                      child: Image.network(listResponse![4]['avatar']),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RachelProfile()));
                      },
                      child: Image.network(listResponse![5]['avatar']),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: listResponse == null ? 0 : 1,
      ),
    );
  }
}
