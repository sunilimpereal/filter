import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final searchController = TextEditingController();
  final searchFocusNode = FocusNode();
  bool cnl = true;
  @override
  Widget build(BuildContext context) {
    return this.keyboardDismisser(
      context: context,
      child: Row(
        children: [
          Container(
            width: 320,
            margin: EdgeInsets.only(top: 10, left: 10),
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.blue.withAlpha(210),
              borderRadius: BorderRadius.all(
                Radius.circular(40),
              ),
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    autofocus: true,
                    decoration: InputDecoration(
                      hintText: "Search",
                      hintStyle: TextStyle(
                        color: Colors.white.withAlpha(120),
                      ),
                      border: InputBorder.none,
                    ),
                    onTap: () {},
                    onChanged: (String keyword) {
                      setState(() {
                        cnl = false;
                      });
                    },
                    onSubmitted: (String search) {}, // clear content,
                  ),
                ),
                (() {
                  if (cnl) {
                    return Icon(
                      Icons.search,
                      color: Colors.black.withAlpha(120),
                    );
                  } else {
                    return IconButton(
                      icon: Icon(
                        Icons.cancel,
                        color: Colors.black.withAlpha(120),
                      ),
                      onPressed: () {
                        this.searchFocusNode.unfocus();
                        FocusScope.of(context).requestFocus(new FocusNode());
                        SystemChannels.textInput.invokeMethod('TextInput.hide');
                        searchController.clear();
                        setState(() {
                          cnl = true;
                        });
                      },
                    );
                  }
                }())
              ],
            ),
          ),
          Icon(
            Icons.more_vert,
            size: 28,
          )
        ],
      ),
    );
  }

  Widget keyboardDismisser({BuildContext context, Widget child}) {
    final gesture = GestureDetector(
      onTap: () {
        this.searchFocusNode.unfocus();
        FocusScope.of(context).requestFocus(new FocusNode());
        SystemChannels.textInput.invokeMethod('TextInput.hide');
      },
      child: child,
    );
    return gesture;
  }
}

class SeachBar extends StatelessWidget {
  final searchController = TextEditingController();
  final searchFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    bool cnl = true;
    return this.keyboardDismisser(
      context: context,
      child: Row(
        children: [
          Container(
            width: 320,
            margin: EdgeInsets.only(top: 10, left: 10),
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.black38.withAlpha(10),
              borderRadius: BorderRadius.all(
                Radius.circular(40),
              ),
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    autofocus: false,
                    decoration: InputDecoration(
                      hintText: "Search",
                      hintStyle: TextStyle(
                        color: Colors.black.withAlpha(120),
                      ),
                      border: InputBorder.none,
                    ),
                    onTap: () {},
                    onChanged: (String keyword) {
                      cnl = false;
                    },
                    onSubmitted: (String search) {}, // clear content,
                  ),
                ),
                (() {
                  if (cnl) {
                    return Icon(
                      Icons.search,
                      color: Colors.black.withAlpha(120),
                    );
                  } else {
                    return IconButton(
                      icon: Icon(
                        Icons.cancel,
                        color: Colors.black.withAlpha(120),
                      ),
                      onPressed: () {
                        this.searchFocusNode.unfocus();
                        FocusScope.of(context).requestFocus(new FocusNode());
                        SystemChannels.textInput.invokeMethod('TextInput.hide');
                        cnl = true;
                      },
                    );
                  }
                }())
              ],
            ),
          ),
          Icon(
            Icons.more_vert,
            size: 28,
          )
        ],
      ),
    );
  }

  icon(bool cnl) {
    if (cnl) {
      return Icon(
        Icons.search,
        color: Colors.black.withAlpha(120),
      );
    } else {
      return Icon(
        Icons.cancel,
        color: Colors.black.withAlpha(120),
      );
    }
  }

  Widget keyboardDismisser({BuildContext context, Widget child}) {
    final gesture = GestureDetector(
      onTap: () {
        this.searchFocusNode.unfocus();
        FocusScope.of(context).requestFocus(new FocusNode());
        SystemChannels.textInput.invokeMethod('TextInput.hide');
      },
      child: child,
    );
    return gesture;
  }
}
