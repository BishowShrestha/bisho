import 'dart:convert';
import 'dart:core' as prefix0;
import 'dart:core';

import 'package:category/src/models/item_model.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'dart:convert';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Flutter demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Welcome> _dd = List<Welcome>();
  Future<List<Welcome>> fetchNotes() async {
    final response = await http.get(
        'https://demo3826367.mockable.io/https://gist.github.com/agubha/4ba875b16d463c3167bd6760d4749ed1%3Ffbclid=IwAR3XfUfUv-WDQ0MYxHGSReeMjF24niXcuPNqCRMnttfaD56dpCRbEdkNWLw');

//List<Welcome> welcomeFromJson(response) {
    List<Welcome> dd = new List<Welcome>();
    final jsonResponse = json.decode(response.body);

    dd = List<Welcome>.from(jsonResponse.map((x) => Welcome.fromJson(x)));

    return dd;
  }

  @override
  Widget build(BuildContext context) {
    fetchNotes().then((value) {
      setState(() {
        _dd.addAll(value);
      });
    });

    bool pressed = false;
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter lIstwies with json'),
      ),
      body: Row(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              //  color: Colors.green,
              child: ListView.builder(
                itemCount: _dd.first.name.length,
                itemBuilder: (context, index) {
                  return Column(children: <Widget>[
                    FlatButton(
                      onPressed: () {
                        pressed = true;
                        prefix0.print(_dd.first.name.length);
                        print("Hello world");
                        //String bb= _dd[index].subCategory[index].name;
                      },
                      child: Text(
                        _dd[index].name,
                      ),

                      // child:   Text(_dd[index].name,
                    ),
                  ]);
                },
              ),
            ),
          ),
          pressed == false
              ? Expanded(
                  flex: 7,
                  child: Container(
                      child: Column(
                    children: [
                     // Text(_dd[0].name),
                      Text(_dd[0].subCategory[0].name),
                        Text(_dd[0]
                                  .subCategory[0]
                                  .subCategory[0]
                                  .name),
                              Image.network(_dd[0]
                                  .subCategory[0]
                                  .subCategory[0]
                                  .img)
                    ],
                  )

                      // color: Colors.yellow,
                      ),
                )
              : Expanded(
                  flex: 7,
                  child: Container(
                    child: ListView.builder(
                        itemCount: _dd.first.name.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: <Widget>[
                            //  Text(_dd[index].subCategory[index].name),
                              Text(_dd[index]
                                  .subCategory[index]
                                  .subCategory[index]
                                  .name),
                              Image.network(_dd[index]
                                  .subCategory[index]
                                  .subCategory[index]
                                  .img)
                            ],
                          );
                        }

                        // color: Colors.yellow,
                        ),
                  ),
                ),
        ],

        /* ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 32.0, bottom: 32.0, left: 16.0, right: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ListTile(
                    leading: Text('Url: ${_dd[index].id.toString()}',
                        ),

                    //// Text('albumId: ${_dd[index].albumId.toString()}',
                    //textAlign: TextAlign.left),

                    // Text('Id: ${_dd[index].id.toString()}',
                    //textAlign: TextAlign.left,),

                    title: Text('Title: ${_dd[index].name}',
                        textAlign: TextAlign.left),

                    subtitle: Text('Url: ${_dd[index].name}',
                        textAlign: TextAlign.left),

                    // Image.network(_dd[index].thumbnailUrl),

                    //Text('thumbnailUrl: ${_dd[index].thumbnailUrl}',
                    //textAlign: TextAlign.left),
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: _dd.length,
      ),*/
      ),
    );
  }
}
