import 'package:filter/pages/home/search/search_result_home.dart';
import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate<String> {
  List<String> names;
  DataSearch(this.names);
  List<String> recentNames = [];
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.cancel),
        onPressed: () {
          query = '';
        },
      )
    ];
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
    return SearchResultHome(query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? recentNames
        : names.where((p) => p.startsWith(query)).toList();
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
