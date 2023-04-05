// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:houserental/models/property.dart';
import 'package:houserental/pickimage/imagepick.dart';
import 'package:houserental/provider/appstate.dart';
import 'package:houserental/utils/snackbar.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';

class FillHouseDetails extends StatefulWidget {
  @override
  State<FillHouseDetails> createState() => _FillHouseDetailsState();
}

class _FillHouseDetailsState extends State<FillHouseDetails> {
  final HOUSE_ID = new DateTime.now().millisecondsSinceEpoch;
  TimeOfDay checkIndateTime = TimeOfDay.now();
  TimeOfDay checkOutdateTime = TimeOfDay.now();

  final titleController = new TextEditingController();
  final countryController = new TextEditingController();
  final stateController = new TextEditingController();
  final streetController = new TextEditingController();
  final zipcodeController = new TextEditingController();
  double priceController = 1000;
  int bedcount = 0;
  double cleaningFee = 500;
  List<TextEditingController> _rulecontroller = [];
  List<TextField> _rulefields = [];
  final _formKey = GlobalKey<FormState>();

  List<TextEditingController> _photocontroller = [];
  List<TextField> _photofield = [];
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
    for (final controller in _rulecontroller) {
      controller.dispose();
    }
    super.dispose();
  }

  Widget _addRuleTile() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        subtitle: Text(
          'Add Rules',
          textAlign: TextAlign.center,
        ),
        title: Icon(Icons.add),
        onTap: () {
          final controller = TextEditingController();
          final field = TextField(
            controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Rule${_rulecontroller.length + 1}",
            ),
          );

          setState(() {
            _rulecontroller.add(controller);
            _rulefields.add(field);
          });
        },
      ),
    );
  }

  Widget _RulelistView() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: _rulefields.length,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.all(5),
          child: _rulefields[index],
        );
      },
    );
  }

  Widget _addPhotoTile() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        subtitle: Text(
          'Add photo\'s',
          textAlign: TextAlign.center,
        ),
        title: Icon(Icons.add),
        onTap: () {
          final photocontroller = TextEditingController();
          final photofield = TextField(
            controller: photocontroller,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "photo ${_photocontroller.length + 1}",
            ),
          );

          setState(() {
            _photocontroller.add(photocontroller);
            _photofield.add(photofield);
          });
        },
      ),
    );
  }

  Widget _photoView() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: _photofield.length,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.all(5),
          child: _photofield[index],
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

  void trySubmit(MyAppState product) {
    final isvalid = _formKey.currentState!.validate();
    if (isvalid) {
      print(HOUSE_ID);
      // Text in each of textfields it is necessary else the information in textfields will not be saved and stored..
      _formKey.currentState!
          .save(); //if not saved showSubmit() (function) will not print.
      product.addHouse(
        HOUSE_ID.toString(),
        titleController.text,
        _photocontroller.map((e) => e.text).toList(),
        priceController,
        Address(
            country: countryController.text,
            state: stateController.text,
            zipcode: zipcodeController.text,
            street: streetController.text),
        checkIndateTime.toString(),
        checkOutdateTime.toString(),
        cleaningFee,
        bedcount,
        _categotyCheckBox.toList(),
        _rulecontroller.map((e) => e.text).toList(),
      );
      print(titleController.text);

      Navigator.of(context).pop();
      showSnackbarCustom(
          context, 'Congratulations!!, House added Successfully', Colors.green);
    } else {
      print("Error");
      showSnackbarCustom(context, 'Input fields are incorrect', Colors.red);
    }
  }

  Future _buildCheckOutTimePicker(
    BuildContext context,
  ) async {
    TimeOfDay? newtime = await showTimePicker(
      context: context,
      initialTime: checkOutdateTime,
      initialEntryMode: TimePickerEntryMode.dial,
    );

    if (newtime != null && newtime != checkOutdateTime) {
      setState(() {
        checkOutdateTime = newtime;
      });
    } else {
      print(checkOutdateTime);
    }
  }

  Future _buildCheckInTimePicker(
    BuildContext context,
  ) async {
    TimeOfDay? newtime = await showTimePicker(
      context: context,
      initialTime: checkIndateTime,
      initialEntryMode: TimePickerEntryMode.dial,
    );

    if (newtime != null && newtime != checkIndateTime) {
      setState(() {
        checkIndateTime = newtime;
      });
    } else {
      print(checkIndateTime);
    }
  }

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<MyAppState>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(
              Icons.add_circle_outline_outlined,
              color: Colors.pink,
              size: 24.0,
              semanticLabel: 'Text to announce in accessibility modes',
            ),
            onPressed: () {
              trySubmit(product);
            },
          )
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(30),
          children: [
            Text(
              "House ID: " + HOUSE_ID.toString(),
              textAlign: TextAlign.center,
            ),
            TextFormField(
              decoration: InputDecoration(hintText: 'House title'),
              controller: titleController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'title be empty';
                }
                return null;
              },
            ),
            TextFormField(
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))
              ],
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(hintText: 'price for 1day (24hrs) '),
              // controller: priceController,
              onChanged: (value) => priceController = double.parse(value),
              validator: (value) {
                if (!(double.tryParse(value!) is double)) {
                  return 'price must be in numbers';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: InputDecoration(hintText: 'country'),
              controller: countryController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'countrycannot  be empty';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: InputDecoration(hintText: 'state'),
              controller: stateController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'state cannot be empty';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: InputDecoration(hintText: 'street'),
              controller: streetController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'street cannot be empty';
                }
                return null;
              },
            ),
            TextFormField(
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))
              ],
              keyboardType: TextInputType.number,
              decoration: InputDecoration(hintText: 'zip-code'),
              controller: zipcodeController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'zip-code can\'t be empty';
                }
                return null;
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: () => _buildCheckInTimePicker(context),
                    child: Text('check-in')),
                ElevatedButton(
                    onPressed: () => _buildCheckOutTimePicker(
                          context,
                        ),
                    child: Text('check-out')),
              ],
            ),
            TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(hintText: 'cleaning fee'),
                validator: (value) {
                  if (!(double.parse(value!) is double)) {
                    return 'Cleaning fee must be in numbers format';
                  }
                  return null;
                },
                // controller:
                onChanged: (value) => cleaningFee = double.parse(value)),
            _checkBox(),
            Text(
              'Number of Bed-room\'s',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 70, child: dropDownBedCount()),
            _addRuleTile(),
            _RulelistView(),
            Divider(),
            _addPhotoTile(),
            _photoView(),
            ActionChip(
              label: Text('Next'),
              onPressed: () {
                trySubmit(product);
                // print(dateTime.day);
                // print('${houseTitle.text}, ${price.text}, ${state.text}');
                // print();
                // for (var i in _controllers) {
                //   print(i.text);
                // }
                print('bedcount $bedcount');
                for (int i = 0; i < checkboxtitles.length; i++) {
                  print("${_categotyCheckBox[i]},--->${checkboxtitles[i]}");
                }
              },
            ),
            ImagePick()
          ],
        ),
      ),
    );
  }

  DropdownButton<int> dropDownBedCount() {
    return DropdownButton<int>(
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
