
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:parsingcomplexjson/personModel.dart';

class ParsingView extends StatefulWidget {
  @override
  _ParsingViewState createState() => _ParsingViewState();
}

class _ParsingViewState extends State<ParsingView> {

  @override
  void initState() {
    super.initState();
    loadPerson();
  }

  Future<String> loadJsonFile() async{
    return await rootBundle.loadString('json/person.json');
  }

  Future loadPerson() async {
    String jsonString = await loadJsonFile();
    final response = jsonDecode(jsonString);
    PersonModel person = PersonModel.fromJson(response);
    print("name : ${person.name}");
    print("places : ${person.places}");
    print("Images : ${person.images[0].name}");
    print("street : ${person.address.streetNumber}");
    print("house no : ${person.address.details.houseNumber}");
    print("town : ${person.address.details.town}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("Parsing Complex Json"),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("All Results shown in Console View"),
              Text("Star this Project on GitHub"),
              Text("Ahmed Reda | ahmedredasa3eed@gmail.com"),
            ],
          ),
        ),
      ),
    );
  }
}
