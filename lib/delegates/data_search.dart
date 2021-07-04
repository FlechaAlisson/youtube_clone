import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DataSearch extends SearchDelegate<String> {
  @override
  //button que ficarão ali do lado
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            //pesquisa da página
            query = '';
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, '');
      },
      icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty)
      return Container();
    else
      return FutureBuilder<List>(
          future: suggestion(query),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(snapshot.data![index]),
                      leading: Icon(
                        Icons.play_arrow,
                      ),
                      onTap: () {
                        close(context, snapshot.data![index]);
                      },
                    );
                  });
            }
          });
  }

  Future<List> suggestion(String search) async {
    http.Response response = await http.get(Uri.parse(
        "http://suggestqueries.google.com/complete/search?hl=en&ds=yt&client=youtube&hjson=t&cp=1&q=$search&format=5&alt=json"));
    if (response.statusCode == 200) {
      return json.decode(response.body)[1].map((e) {
        return e[0];
      }).toList();
    } else {
      throw Exception("Falied to load suggestion");
    }
  }
}
