import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:houserental/widgets/imagepick.dart';
import 'package:houserental/provider/appstate.dart';
import 'package:houserental/utils/snackbar.dart';
import 'package:provider/provider.dart';

import '../../models/property.dart';

class FillHouseDetails extends StatefulWidget {
  const FillHouseDetails({super.key});

  @override
  State<FillHouseDetails> createState() => _FillHouseDetailsState();
}

class _FillHouseDetailsState extends State<FillHouseDetails> {
  final HOUSE_ID = DateTime.now().millisecondsSinceEpoch;
  TimeOfDay checkIndateTime = TimeOfDay.now();
  TimeOfDay checkOutdateTime = TimeOfDay.now();
  final titleController = TextEditingController();
  final countryController = TextEditingController();
  final stateController = TextEditingController();
  final streetController = TextEditingController();
  final zipcodeController = TextEditingController();
  final priceController = TextEditingController();
  final cityController = TextEditingController();
  final cleaningfeeController = TextEditingController();
  final maxguestController = TextEditingController();
  double price = 0;
  int bedcount = 0;
  int maxguests = 2;
  double cleaningFee = 500;
  final List<TextEditingController> _featurescontroller = [];
  final List<TextField> _featureFields = [];
  List<File> photoControllerList = [];
  // final List<TextField> _photoFields = [];
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final Map<String, bool?> _categoryCheckBox = {
    'pool': false,
    'beach': false,
    'Lakefront': false,
    'windmill': false,
    'historical_home': false,
    'private_home': false,
    'National_Park': false,
    'Trending': false,
    'Island': false,
    'Camping': false,
  };
  List<String> categoryList = [];

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<MyAppState>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Your House Details'),
        backgroundColor: Colors.indigo,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.check,
              color: Colors.white,
              size: 24.0,
            ),
            onPressed: () {
              trySubmit(product);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'House ID: $HOUSE_ID',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'House Title'),
                  controller: titleController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Title cannot be empty';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))
                  ],
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Price per Day'),
                  controller: priceController,
                  onChanged: (value) {
                    price = double.parse(priceController.text);
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Price cannot be empty';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Country'),
                  controller: countryController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Country cannot be empty';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'City'),
                  controller: cityController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'City cannot be empty';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'State'),
                  controller: stateController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'State cannot be empty';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Street'),
                  controller: streetController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Street cannot be empty';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))
                  ],
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Zip Code'),
                  controller: zipcodeController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Zip Code cannot be empty';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Max Guests'),
                  controller: maxguestController,
                  onChanged: (value) =>
                      maxguests = int.parse(maxguestController.text),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Max Guests cannot be empty';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Cleaning Fee'),
                  controller: cleaningfeeController,
                  onChanged: (value) =>
                      cleaningFee = double.parse(cleaningfeeController.text),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Cleaning Fee must be in decimal';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        _buildCheckInTimePicker(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.greenAccent,
                        textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      child: const Text('Check-In'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _buildCheckOutTimePicker(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue.shade300,
                        textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      child: const Text('Check-Out'),
                    ),
                  ],
                ),
                const Text(
                  'Number of Bed-rooms',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                dropDownBedCount(),
                _addFeatureTile(),
                _featureListView(),
                const Divider(),
                ImagePick(imageFiles: photoControllerList),
                const SizedBox(height: 20),
                OutlinedButton(
                  onPressed: () {
                    trySubmit(product);
                  },
                  child: const Text(
                    'Next',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.pink,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
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
      hint: const Text("Select Bed rooms"),
      value: bedcount,
      onChanged: (int? newvalue) {
        setState(() {
          bedcount = newvalue!;
        });
      },
      icon: const Icon(
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
            style: const TextStyle(color: Colors.green),
          ),
        );
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
        subtitle: const Text(
          'Add features of your house',
          textAlign: TextAlign.center,
        ),
        title: const Icon(Icons.add),
        onTap: () {
          final controller = TextEditingController();
          final field = TextField(
            controller: controller,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: "Feature-${_featurescontroller.length + 1}",
            ),
          );

          setState(() {
            _featurescontroller.add(controller);
            _featureFields.add(field);
          });
        },
      ),
    );
  }

  Widget _featureListView() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _featureFields.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.all(5),
          child: _featureFields[index],
        );
      },
    );
  }

  void trySubmit(MyAppState product) {
    // final isvalid =
    // if (_formKey.currentState!.validate()) {
    // _formKey.currentState!.save();
    product.addHouse(HouseProperty(
            maxguests: maxguests,
            propertyid: HOUSE_ID.toString(),
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
            ownerId: "uday",
            housetitle: titleController.text,
            photos: photoControllerList.map((e) => e.path.toString()).toList(),
            price: price,
            address: Address(
              city: cityController.text,
              country: countryController.text,
              state: stateController.text,
              zipcode: zipcodeController.text,
              street: streetController.text,
            ),
            checkintime: checkIndateTime.toString(),
            checkouttime: checkOutdateTime.toString(),
            cleaningfee: cleaningFee,
            bedcount: bedcount,
            category: categoryList.map((e) => e.toString()).toList(),
            features: _featurescontroller.map((e) => e.text).toList())
        // maxguests.toDouble(),
        // HOUSE_ID.toString(),
        // titleController.text,
        // photoControllerList.map((e) => e.path.toString()).toList(),
        // price,
        // Address(
        //   city: cityController.text,
        //   country: countryController.text,
        //   state: stateController.text,
        //   zipcode: zipcodeController.text,
        //   street: streetController.text,
        // ),
        // checkIndateTime.toString(),
        // checkOutdateTime.toString(),
        // cleaningFee,
        // bedcount,
        // categoryList.map((e) => e.toString()).toList(),
        // _featurescontroller.map((e) => e.text).toList(),
        );
    showSnackbarCustom(context, "House added Successfully", Colors.green);
    Navigator.of(context).pop();
    // } else {
    // showSnackbarCustom(context, 'Input fields are incorrect', Colors.red);
    // }
  }

  Future _buildCheckOutTimePicker(BuildContext context) async {
    TimeOfDay? newtime = await showTimePicker(
      context: context,
      initialTime: checkOutdateTime,
      initialEntryMode: TimePickerEntryMode.dial,
    );

    if (newtime != null && newtime != checkOutdateTime) {
      setState(() {
        checkOutdateTime = newtime;
      });
    }
  }

  Future _buildCheckInTimePicker(BuildContext context) async {
    TimeOfDay? newtime = await showTimePicker(
      context: context,
      initialTime: checkIndateTime,
      initialEntryMode: TimePickerEntryMode.dial,
    );

    if (newtime != null && newtime != checkIndateTime) {
      setState(() {
        checkIndateTime = newtime;
      });
    }
  }
}
