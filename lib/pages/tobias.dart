import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Map? mapResponse;
List? listResponse;

class TobiasProfile extends StatefulWidget {
  const TobiasProfile({super.key});

  @override
  State<TobiasProfile> createState() => _MichealProfileState();
}

class _MichealProfileState extends State<TobiasProfile> {

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
        title: Text("Welcome to Tobias's profile"),
      ),
      body: listResponse != null
          ? Center(
        child: Column(
          children: [
            Text('ID: ${listResponse![2]['id']}'),
            Text('Email: ${listResponse![2]['email']}'),
            Text('First Name: ${listResponse![2]['first_name']}'),
            Text('Last Name: ${listResponse![2]['last_name']}'),
          ],
        ),
      )
          : Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

