import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Map? mapResponse;
List? listResponse;

class GeorgeProfile extends StatefulWidget {
  const GeorgeProfile({super.key});

  @override
  State<GeorgeProfile> createState() => _MichealProfileState();
}

class _MichealProfileState extends State<GeorgeProfile> {

  Future apiCall() async {
    http.Response response;
    response = await http.get(Uri.parse('https://reqres.in/api/users?page=2'));
    if (response.statusCode == 200) {
      setState(() {
        // stringResponse = response.body;
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
        title: Text("Welcome to Georges's profile"),
      ),
      body: listResponse != null
          ? Center(
        child: Column(
          children: [
            Text('ID: ${listResponse![4]['id']}'),
            Text('Email: ${listResponse![4]['email']}'),
            Text('First Name: ${listResponse![4]['first_name']}'),
            Text('Last Name: ${listResponse![4]['last_name']}'),
          ],
        ),
      )
          : Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

