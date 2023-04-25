import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:houserental/pickimage/imagepick.dart';
import 'package:houserental/provider/appstate.dart';
import 'package:houserental/utils/snackbar.dart';
import 'package:provider/provider.dart';

import '../../models/property.dart';

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
  final priceController = TextEditingController();
  final cityController = TextEditingController();
  final cleaningfeeController = TextEditingController();
  final maxguestController = TextEditingController();
  double price = 0;
  int bedcount = 0;
  int maxguests = 2;
  double cleaningFee = 500;
  List<TextEditingController> _featurescontroller = [];
  List<TextField> _feature_fields = [];
  final _formKey = GlobalKey<FormState>();

  List<TextEditingController> photocontrollerList = [];
  List<TextField> _photofield = [];
  Map<String, bool?> _categotyCheckBox = {
    'pool': false,
    'beach': false,
    "Lakefront": false,
    "windmill": false,
    "historical_home": false,
    "private_home": false,
    "National_Park": false,
    "Trending": false,
    "Island": false,
    "Camping": false,
  };
  List<String> categoryList = []; // initial values for checkboxes

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<MyAppState>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('add your house details'),
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
              decoration: InputDecoration(label: Text('House title')),
              controller: titleController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'title be empty';
                }
                return null;
              },
            ),
            TextField(
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))
              ],
              keyboardType: TextInputType.number,
              decoration: InputDecoration(label: Text('price per day')),
              // initialValue: '0',
              controller: priceController,
              onChanged: (value) {
                price = double.parse(priceController.text);
              },
              // validator: (value) {
              //   if (!(double.tryParse(value.toString()) is double)) {
              //     return 'price must be in numbers';
              //   }
              //   return null;
              // },
            ),
            TextFormField(
              decoration: InputDecoration(label: Text('country')),
              controller: countryController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'country cannot  be empty';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: InputDecoration(label: Text('city')),
              controller: cityController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'city cannot  be empty';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: InputDecoration(label: Text('state')),
              controller: stateController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'state cannot be empty';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: InputDecoration(label: Text('street')),
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
              decoration: InputDecoration(label: Text('zip-code')),
              controller: zipcodeController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'zip-code can\'t be empty';
                }
                return null;
              },
            ),
            TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(label: Text('max guests')),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'max guests cannot be empty';
                  }
                  return null;
                },
                controller: maxguestController,
                onChanged: (value) =>
                    maxguests = int.parse(maxguestController.text)),
            TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(label: Text('cleaning fee')),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Cleaning fee must be in decimal';
                  }
                  return null;
                },
                controller: cleaningfeeController,
                onChanged: (value) =>
                    cleaningFee = double.parse(cleaningfeeController.text)),
            const SizedBox(
              height: 10,
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
            ListView(
              shrinkWrap: true,
              children: _categotyCheckBox.keys.map((key) {
                return CheckboxListTile(
                  title: Text(key),
                  value: _categotyCheckBox[key],
                  onChanged: (value) {
                    setState(() {
                      _categotyCheckBox[key] = value;
                      categoryList = getKeysWithTrueValues(_categotyCheckBox);
                    });
                  },
                );
              }).toList(),
            ),
            Text(
              'Number of Bed-room\'s',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 70, child: dropDownBedCount()),
            _addFeatureTile(),
            _featurelistView(),
            Divider(),
            _addPhotoTile(),
            _photoView(),
            OutlinedButton(
              child: Text('Next'),
              onPressed: () {
                trySubmit(product);
                // print(categoryList);
              },
            ),
            ImagePick() //
          ],
        ),
      ),
    );
  }

  List<String> getKeysWithTrueValues(Map<String, bool?> myMap) {
    List<String> result = [];
    for (var entry in myMap.entries) {
      if (entry.value == true) {
        result.add(entry.key);
      }
    }
    return result;
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

  @override
  void dispose() {
    titleController.dispose();

    for (final controller in _featurescontroller) {
      controller.dispose();
    }
    super.dispose();
  }

  Widget _addFeatureTile() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        subtitle: Text(
          'Add features of your house',
          textAlign: TextAlign.center,
        ),
        title: Icon(Icons.add),
        onTap: () {
          final controller = TextEditingController();
          final field = TextField(
            controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "feature-${_featurescontroller.length + 1}",
            ),
          );

          setState(() {
            _featurescontroller.add(controller);
            _feature_fields.add(field);
          });
        },
      ),
    );
  }

  Widget _featurelistView() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: _feature_fields.length,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.all(5),
          child: _feature_fields[index],
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
              labelText: "photo ${photocontrollerList.length + 1}",
            ),
          );

          setState(() {
            photocontrollerList.add(photocontroller);
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

  void trySubmit(MyAppState product) {
    final isvalid = _formKey.currentState!.validate();
    if (isvalid) {
      // print(HOUSE_ID);
      // Text in each of textfields it is necessary else the information in textfields will not be saved and stored..
      _formKey.currentState!
          .save(); //if not saved showSubmit() (function) will not print.
      product.addHouse(
        maxguests,
        HOUSE_ID.toString(),
        titleController.text,
        photocontrollerList.map((e) => e.text.toString()).toList(),
        price,
        Address(
            city: cityController.text,
            country: countryController.text,
            state: stateController.text,
            zipcode: zipcodeController.text,
            street: streetController.text),
        checkIndateTime.toString(),
        checkOutdateTime.toString(),
        cleaningFee,
        bedcount,
        categoryList.map((e) => e.toString()).toList(),
        _featurescontroller.map((e) => e.text).toList(),
      );
      // print(titleController.text);
      // Navigator.of(context).pop();
    } else {
      // print("Error");
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
}
