// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class FillHouseDetails extends StatefulWidget {
  @override
  State<FillHouseDetails> createState() => _FillHouseDetailsState();
}

class _FillHouseDetailsState extends State<FillHouseDetails> {
  final TextEditingController houseTitle = new TextEditingController();

  final TextEditingController price = new TextEditingController();

  final TextEditingController state = new TextEditingController();

  int? bedcount;
  List<TextEditingController> _controllers = [];
  List<TextField> _fields = [];
  List<bool> _categotyCheckBox = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];
  List<String> checkboxtitles = [
    'pool',
    'beach',
    "Lakefront",
    "windmill",
    "historical_home",
    "private_home",
    "National_Park",
    "Trending",
    "Island",
    "Camping",
  ]; // initial values for checkboxes

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  Widget _addTile() {
    return ListTile(
      subtitle: Text('add rules here'),
      title: Icon(Icons.add),
      onTap: () {
        final controller = TextEditingController();
        final field = TextField(
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: "Rule${_controllers.length + 1}",
          ),
        );

        setState(() {
          _controllers.add(controller);
          _fields.add(field);
        });
      },
    );
  }

  Widget _listView() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: _fields.length,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.all(5),
          child: _fields[index],
        );
      },
    );
  }

  Widget _checkBox() {
    return ListView.builder(
      // scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: _categotyCheckBox.length,
      itemBuilder: (context, index) {
        return CheckboxListTile(
            title: Text(checkboxtitles[index]),
            value: _categotyCheckBox[index],
            onChanged: (bool? val) {
              setState(() {
                _categotyCheckBox[index] = val!;
              });
            });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          TextFormField(
            controller: houseTitle,
            decoration: InputDecoration(hintText: 'House title'),
          ),
          TextFormField(
            controller: price,
            decoration: InputDecoration(hintText: 'House price'),
          ),
          TextFormField(
            controller: state,
            decoration: InputDecoration(hintText: 'House state'),
          ),
          _checkBox(),
          dropDownBedCount(),
          _addTile(),
          _listView(),
          ActionChip(
            label: Text('Next'),
            onPressed: () {
              print('${houseTitle.text}, ${price.text}, ${state.text}');
              // print();
              // for (var i in _controllers) {
              //   print(i.text);
              // }
              print('bedcount $bedcount');
              for (int i = 0; i < checkboxtitles.length; i++) {
                print("${_categotyCheckBox[i]},--->${checkboxtitles[i]}");
              }
            },
          )
        ],
      ),
    );
  }

  DropdownButton<int> dropDownBedCount() {
    return DropdownButton<int>(
      // isExpanded: true,
      iconSize: 50,
      borderRadius: BorderRadius.circular(15),
      hint: Text("Select Bed rooms"),
      value: bedcount,
      onChanged: (int? newvalue) {
        setState(() {
          //  " ! " is a null Saftey
          bedcount = newvalue!;
        });
      },
      icon: Icon(
        Icons.arrow_circle_down_rounded,
        size: 30,
        color: Colors.green,
      ),
      items: <int>[0, 1, 2, 3, 4, 5, 6].map<DropdownMenuItem<int>>((int value) {
        return DropdownMenuItem(
            alignment: Alignment.center,
            value: value,
            child: Text(
              value.toString(),
              style: TextStyle(color: Colors.green),
            ));
      }).toList(),
    );
  }
}
