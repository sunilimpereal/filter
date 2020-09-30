import 'package:filter/pages/home/search/search_result_home.dart';
import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate<String> {
  List<String> names;

  DataSearch(this.names);
  List<String> recentNames = [];
  List<String> items = ['Filter', 'Service', 'Installation'];
  String type = 'Type';
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.cancel),
        onPressed: () {
          query = '';
        },
      ),
      DropdownButtonHideUnderline(
        child: new DropdownButton<String>(
          items: items.map((String val) {
            return new DropdownMenuItem<String>(
              value: val,
              child: new Text(val),
            );
          }).toList(),
          hint: Text(type),
          onChanged: (value) {
            type = value;
          },
        ),
      )
    ];
  }

  addrecent(String name, List<String> recentNames1) {
    recentNames1.add(name);
    if (recentNames1.length > 5) {
      recentNames1.removeAt(0);
    }
    print(recentNames1);
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    addrecent(query, recentNames);
    print('type');
    print(type);
    return SearchResultHome(query, type);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    print('recent $recentNames');
    final suggestionList = query.isEmpty
        ? recentNames
        : names.toSet().toList().where((p) => p.startsWith(query)).toList();
    return ListView.builder(
      itemBuilder: (context, index) => GestureDetector(
        child: ListTile(
          leading: Icon(
            Icons.person,
            size: 35,
            color: Colors.blue,
          ),
          title: RichText(
            text: TextSpan(
                text: suggestionList[index].substring(0, query.length),
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
                children: [
                  TextSpan(
                      text: suggestionList[index].substring(query.length),
                      style: TextStyle(color: Colors.grey)),
                ]),
          ),
          onTap: () {
            query = suggestionList[index];
          },
        ),
      ),
      itemCount: suggestionList.length,
    );
  }
}
