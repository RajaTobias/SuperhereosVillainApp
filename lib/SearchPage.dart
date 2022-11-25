import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:superheroes_app/search.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List superheroesData;
  fetchData() async {
    http.Response response =
        await http.get("https://akabab.github.io/superhero-api/api/all.json");
    setState(() {
      superheroesData = jsonDecode(response.body);
    });
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text(
            "Superheroes and Villains App",
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                  iconSize: 120,
                  onPressed: () {
                    showSearch(
                        context: context,
                        delegate: Search(data: superheroesData));
                  },
                  icon: Icon(Icons.search))
            ],
          ),
        ));
  }
}
