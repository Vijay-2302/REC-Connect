import 'package:flutter/material.dart';

class Transport extends StatefulWidget {
  const Transport({Key? key}) : super(key: key);
  static const String id = 'transport_screen';

  @override
  State<Transport> createState() => _TransportState();
}

class _TransportState extends State<Transport> {
  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.lightBlueAccent);
  }
}

// ListView(
// padding: const EdgeInsets.all(16),
// children: [
// PaginatedDataTable(
// header: Text('Header Text'),
// rowsPerPage: 4,
// columns: [
// DataColumn(label: Text('Header A')),
// DataColumn(label: Text('Header B')),
// DataColumn(label: Text('Header C')),
// DataColumn(label: Text('Header D')),
// ],
// source: ,
// ),
// ],
// );

