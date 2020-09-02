import 'package:filter/models/filter.dart';
import 'package:filter/pages/home/filter/filter_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FilterList extends StatefulWidget {
  @override
  _FilterListState createState() => _FilterListState();
}

class _FilterListState extends State<FilterList> {
  @override
  Widget build(BuildContext context) {
    final filters = Provider.of<List<Filter>>(context) ?? [];
    filters.sort((a, b) => b.date.compareTo(a.date));

    print(filters);
    return ListView.builder(
      itemCount: filters.length,
      itemBuilder: (context, index) {
        return FilterTile(filter: filters[index]);
      },
    );
  }
}
