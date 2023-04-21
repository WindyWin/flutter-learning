import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import 'components/table_basic_example.dart';
import 'components/table_event_example.dart';
import 'components/table_multi_example.dart';
import 'components/table_range_example.dart';
import 'components/table_complex_example.dart';

class TableView extends StatefulWidget {
  const TableView({Key? key}) : super(key: key);

  @override
  _TableViewState createState() => _TableViewState();
}

class _TableViewState extends State<TableView> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 20.0),
          ElevatedButton(
            child: Text('Basics'),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => TableBasicsExample()),
            ),
          ),
          const SizedBox(height: 12.0),
          ElevatedButton(
            child: Text('Range Selection'),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => TableRangeExample()),
            ),
          ),
          const SizedBox(height: 12.0),
          ElevatedButton(
            child: Text('Events'),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => TableEventsExample()),
            ),
          ),
          const SizedBox(height: 12.0),
          ElevatedButton(
            child: Text('Multiple Selection'),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => TableMultiExample()),
            ),
          ),
          const SizedBox(height: 12.0),
          ElevatedButton(
            child: Text('Complex'),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => TableComplexExample()),
            ),
          ),
          const SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
