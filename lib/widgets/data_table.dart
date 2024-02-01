
import 'package:flutter/material.dart';

import '../data/data.dart';

class dataTable extends StatelessWidget {
  const dataTable({
    super.key,
    required this.selectedHouse,
  });

  final HouseProperty selectedHouse;

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: const <DataColumn>[
        DataColumn(
          label: Expanded(
            child: Text(
              "Check-In",
              style: TextStyle(
                  fontStyle: FontStyle.italic),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'Check-out',
              style: TextStyle(
                  fontStyle: FontStyle.italic),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'safety',
              style: TextStyle(
                  fontStyle: FontStyle.italic),
            ),
          ),
        ),
      ],
      rows: <DataRow>[
        DataRow(
          cells: <DataCell>[
            DataCell(Text(
                selectedHouse.checkintime)),
            DataCell(Text(
                selectedHouse.checkouttime)),
            const DataCell(Text(
              'Security camera & recording device',
              overflow: TextOverflow.fade,
            )),
          ],
        ),
      ],
    );
  }
}
