import 'package:filter/models/filter.dart';
import 'package:filter/pages/home/filter/filter_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FilterList extends StatefulWidget {
  final DateTime startDate;
  final DateTime endDate;
  FilterList({this.startDate, this.endDate});
  @override
  _FilterListState createState() => _FilterListState();
}

class _FilterListState extends State<FilterList> {
  @override
  Widget build(BuildContext context) {
    final filters = Provider.of<List<Filter>>(context) ?? [];
    filters.sort((a, b) => b.date.compareTo(a.date));
    List<Filter> newFilters = [];
    for (var i = 0; i < filters.length; i++) {
      DateTime ndate = DateTime.parse(filters[i].date);
      if (ndate.isAfter(widget.startDate.subtract(Duration(days: 1))) &&
          ndate.isBefore(widget.endDate.subtract(Duration(days: 1)))) {
        newFilters.add(filters[i]);
      }
    }

    print(filters);
    return ListView.builder(
      itemCount: newFilters.length,
      itemBuilder: (context, index) {
        return FilterTile(filter: newFilters[index]);
      },
    );
  }
}
