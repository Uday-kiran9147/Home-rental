// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:houserental/pickimage/imagepick.dart';
import 'package:intl/intl.dart';

import '../models/property.dart';

class FillHouseDetails extends StatefulWidget {
  @override
  State<FillHouseDetails> createState() => _FillHouseDetailsState();
}

class _FillHouseDetailsState extends State<FillHouseDetails> {
  HouseProperty houseProperty = new HouseProperty();

  final HOUSE_ID = new DateTime.now().millisecondsSinceEpoch;
  // DateTime dateTime = DateTime.now();
  int? bedcount;
  double? cleaningFee;
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        subtitle: Text(
          'Add rules',
          textAlign: TextAlign.center,
        ),
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
      ),
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
        padding: const EdgeInsets.all(30),
        children: [
          Text(
            "House ID: " + HOUSE_ID.toString(),
            textAlign: TextAlign.center,
          ),
          InputField(
              controller: houseProperty.housetitle.toString(),
              hintText: 'House title'),
          InputField(
              controller: houseProperty.price.toString(),
              hintText: 'House price/nignt'),
          // Row(children: [
          // InputField(
          //     controller:houseProperty. address!.country.toString(),
          //     hintText: 'State'),
          // InputField(
          //     controller: houseProperty. address!.state.toString(),
          //     hintText: 'State'),
          // InputField(
          //     controller: houseProperty. address!.street.toString(),
          //     hintText: 'State'),
          // InputField(
          //     controller: houseProperty. address!.zipcode.toString(),
          //     hintText: 'State'),
          // ],),

          InputField(
              controller: houseProperty.checkintime.toString(),
              hintText: 'Check-in time'),
          InputField(
              controller: houseProperty.checkouttime.toString(),
              hintText: 'Check-out time'),
          InputField(
              controller: houseProperty.cleaningfee.toString(),
              hintText: 'cleaning fee'),
          _checkBox(),
          SizedBox(height: 50, child: dropDownBedCount()),
          _addTile(),
          _listView(),
          ActionChip(
            label: Text('Next'),
            onPressed: () {
              // print(dateTime.day);
              // print('${houseTitle.text}, ${price.text}, ${state.text}');
              // print();
              // for (var i in _controllers) {
              //   print(i.text);
              // }
              // print('bedcount $bedcount');
              // for (int i = 0; i < checkboxtitles.length; i++) {
              //   print("${_categotyCheckBox[i]},--->${checkboxtitles[i]}");
              // }
              print(HOUSE_ID);
            },
          ),
          ImagePick()
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
          houseProperty.bedcount = newvalue!;
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

  // Widget _buildDateAndTimePicker(BuildContext context) {
  //   return Column(
  //     children: <Widget>[
  //       Row(
  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //         children: <Widget>[
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.start,
  //             children: const <Widget>[
  //               Icon(
  //                 CupertinoIcons.clock,
  //                 color: CupertinoColors.lightBackgroundGray,
  //                 size: 28,
  //               ),
  //               SizedBox(width: 6),
  //               Text(
  //                 'Delivery time',
  //                 // style: Styles.deliveryTimeLabel,
  //               ),
  //             ],
  //           ),
  //           Text(
  //             DateFormat.yMMMd().add_jm().format(dateTime),
  //             // style: Styles.deliveryTime,
  //           ),
  //         ],
  //       ),
  //       SizedBox(
  //         height: 250,
  //         child: CupertinoDatePicker(
  //           mode: CupertinoDatePickerMode.dateAndTime,
  //           // initialDateTime: dateTime,
  //           onDateTimeChanged: (newDateTime) {
  //             setState(() {
  //               dateTime = newDateTime;
  //             });
  //           },
  //         ),
  //       ),
  //     ],
  //   );
  // }
}

@immutable
class InputField extends StatelessWidget {
  InputField({
    Key? key,
    required this.controller,
    required this.hintText,
  }) : super(key: key);

  String controller;
  String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) {
        controller = value;
      },
      decoration: InputDecoration(hintText: '${hintText}'),
    );
  }
}

// class HousePropertyForm extends StatefulWidget {
//   @override
//   _HousePropertyFormState createState() => _HousePropertyFormState();
// }

// class _HousePropertyFormState extends State<HousePropertyForm> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   final HouseProperty _houseProperty = HouseProperty();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('House Property Form'),
//         ),
//         body: Padding(
//             padding: EdgeInsets.all(16.0),
//             child: Form(
//                 key: _formKey,
//                 child: SingleChildScrollView(
//                     child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     TextFormField(
//                       decoration: InputDecoration(
//                         labelText: 'Property ID',
//                       ),
//                       onSaved: (value) {
//                         _houseProperty.propertyid = value;
//                       },
//                     ),
//                     TextFormField(
//                       decoration: InputDecoration(
//                         labelText: 'House Title',
//                       ),
//                       onSaved: (value) {
//                         _houseProperty.housetitle = value;
//                       },
//                     ),
//                     TextFormField(
//                       decoration: InputDecoration(
//                         labelText: 'Photos',
//                       ),
//                       onSaved: (value) {
//                         _houseProperty.photos = value!.split(',');
//                       },
//                     ),
//                     TextFormField(
//                       decoration: InputDecoration(
//                         labelText: 'Country',
//                       ),
//                       onSaved: (value) {
//                         _houseProperty.address?.country = value;
//                       },
//                     ),
//                     TextFormField(
//                       decoration: InputDecoration(
//                         labelText: 'State',
//                       ),
//                       onSaved: (value) {
//                         _houseProperty.address?.state = value;
//                       },
//                     ),
//                     TextFormField(
//                       decoration: InputDecoration(
//                         labelText: 'Zipcode',
//                       ),
//                       onSaved: (value) {
//                         _houseProperty.address?.zipcode = value;
//                       },
//                     ),
//                     TextFormField(
//                       decoration: InputDecoration(
//                         labelText: 'Street',
//                       ),
//                       onSaved: (value) {
//                         _houseProperty.address?.street = value;
//                       },
//                     ),
//                     TextFormField(
//                       decoration: InputDecoration(
//                         labelText: 'Check-in Time',
//                       ),
//                       onSaved: (value) {
//                         _houseProperty.checkintime = value;
//                       },
//                     ),
//                     TextFormField(
//                       decoration: InputDecoration(
//                         labelText: 'Check-out Time',
//                       ),
//                       onSaved: (value) {
//                         _houseProperty.checkouttime = value;
//                       },
//                     ),
//                     TextFormField(
//                       decoration: InputDecoration(
//                         labelText: 'Cleaning Fee',
//                       ),
//                       keyboardType: TextInputType.number,
//                       onSaved: (value) {
//                         _houseProperty.cleaningfee = int.parse(value!);
//                       },
//                     ),
//                     TextFormField(
//                       decoration: InputDecoration(
//                         labelText: 'Bed Count',
//                       ),
//                       keyboardType: TextInputType.number,
//                       onSaved: (value) {
//                         _houseProperty.bedcount = int.parse(value!);
//                       },
//                     ),
//                     TextFormField(
//                       decoration: InputDecoration(
//                         labelText: 'Category',
//                       ),
//                       onSaved: (value) {
//                         _houseProperty.category = value!.split(',');
//                       },
//                     ),
//                     TextFormField(
//                       decoration: InputDecoration(
//                         labelText: 'House Rules',
//                       ),
//                       onSaved: (value) {
//                         _houseProperty.houserules = value!.split(',');
//                       },
//                     ),
//                     SizedBox(height: 16.0),
//                     ElevatedButton(
//                         child: Text('submit'),
//                         onPressed: () {
//                           if (_formKey.currentState!.validate()) {
//                             _formKey.currentState!.save();
//                             // Do something with the house property data
//                             // For example, save it to a database or send it to an API
//                           }
//                         })
//                   ],
//                 )))));
//   }
// }
// class HousePropertyForm extends StatefulWidget {
//   @override
//   _HousePropertyFormState createState() => _HousePropertyFormState();
// }

// class _HousePropertyFormState extends State<HousePropertyForm> {
//   final _formKey = GlobalKey<FormState>();

//   HouseProperty houseProperty = HouseProperty();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Add House Property'),
//       ),
//       body: Form(
//         key: _formKey,
//         child: ListView(
//           padding: EdgeInsets.all(16.0),
//           children: [
//             TextFormField(
//               decoration: InputDecoration(labelText: 'Property ID'),
//               onChanged: (value) => houseProperty.propertyid = value,
//             ),
//             TextFormField(
//               decoration: InputDecoration(labelText: 'House Title'),
//               onChanged: (value) => houseProperty.housetitle = value,
//             ),
//             TextFormField(
//               decoration: InputDecoration(labelText: 'Photos'),
//               onChanged: (value) => houseProperty.photos = value.split(','),
//             ),
//             TextFormField(
//               decoration: InputDecoration(labelText: 'Country'),
//               onChanged: (value) =>
//                   houseProperty.address!.country = value,
//             ),
//             TextFormField(
//               decoration: InputDecoration(labelText: 'State'),
//               onChanged: (value) => houseProperty.address!.state = value,
//             ),
//             TextFormField(
//               decoration: InputDecoration(labelText: 'Zip Code'),
//               onChanged: (value) => houseProperty.address!.zipcode = value,
//             ),
//             TextFormField(
//               decoration: InputDecoration(labelText: 'Street'),
//               onChanged: (value) => houseProperty.address!.street = value,
//             ),
//             TextFormField(
//               decoration: InputDecoration(labelText: 'Check-in Time'),
//               onChanged: (value) => houseProperty.checkintime = value,
//             ),
//             TextFormField(
//               decoration: InputDecoration(labelText: 'Check-out Time'),
//               onChanged: (value) => houseProperty.checkouttime = value,
//             ),
//             TextFormField(
//               decoration: InputDecoration(labelText: 'Cleaning Fee'),
//               onChanged: (value) =>
//                   houseProperty.cleaningfee = int.tryParse(value),
//               keyboardType: TextInputType.number,
//             ),
//             TextFormField(
//               decoration: InputDecoration(labelText: 'Bed Count'),
//               onChanged: (value) =>
//                   houseProperty.bedcount = int.tryParse(value),
//               keyboardType: TextInputType.number,
//             ),
//             TextFormField(
//               decoration: InputDecoration(labelText: 'Category'),
//               onChanged: (value) => houseProperty.category = value.split(','),
//             ),
//             TextFormField(
//               decoration: InputDecoration(labelText: 'House Rules'),
//               onChanged: (value) => houseProperty.houserules = value.split(','),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 if (_formKey.currentState!.validate()) {
//                   // Save form data to database or API
//                   print(houseProperty.toJson());
//                 }
//               },
//               child: Text('Submit'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
