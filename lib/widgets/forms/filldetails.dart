import 'dart:io';

import 'package:flutter/material.dart';
import 'package:houserental/widgets/categoty_choice_chip.dart';
import 'package:houserental/widgets/imagepick.dart';
import 'package:houserental/provider/appstate.dart';
import 'package:houserental/utils/snackbar.dart';
import 'package:provider/provider.dart';

import '../../data/data.dart';
import '../custom_textfield.dart';

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
  List<String> photoUrlList = [];
  List<File> photoFileList = [];
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
  int _currentPageIndex = 0;

  final _formKey = GlobalKey<FormState>();

  PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final product = Provider.of<MyAppState>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Your House Details'),
        backgroundColor: Theme.of(context).primaryColor,
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
      body: Form(
        key: _formKey,
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _currentPageIndex = index;
            });
          },
          children: [
            _buildTitle(),
            _buildAddress(),
            _maxGuests(),
            _buildChecking(context),
            _buildRemaining(product),
          ],
        ),
      ),
    );
  }

  Widget _buildRemaining(MyAppState product) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ChoiceChipsExample(choicesref: _categoryCheckBox),
          ImagePick(
            imageFiles: photoFileList,
            photoUrlList: photoUrlList,
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.90,
            height: 50,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  side: const BorderSide(style: BorderStyle.none),
                  elevation: 5,
                  shadowColor: Colors.grey.shade300,
                  backgroundColor: Color.fromARGB(255, 91, 205, 46)),
              onPressed: () {
                categoryList = getKeysWithTrueValues(_categoryCheckBox);
                print(categoryList);
                trySubmit(product);
              },
              child: const Text(
                'Next',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  ListView _buildChecking(BuildContext context) {
    return ListView(
      children: [
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
        _nextButton(pageController: _pageController),
      ],
    );
  }

  Widget _maxGuests() {
    return ListView(
      children: [
        CustomNumericTextField(
          // keyboardType: TextInputType.number,
          labelText: 'Max Guests',
          controller: maxguestController,
          onChanged: (value) => maxguests = int.parse(maxguestController.text),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Max Guests cannot be empty';
            }
            return null;
          },
        ),
        CustomNumericTextField(
          labelText: 'Cleaning Fee',
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
        _nextButton(pageController: _pageController),
      ],
    );
  }

  Widget _buildAddress() {
    return ListView(
      children: [
        CustomizedTextField(
          controller: countryController,
          labelText: 'Country',
          validator: (value) {
            if (value!.isEmpty) {
              return 'Country cannot be empty';
            }
            return null;
          },
        ),
        CustomizedTextField(
          controller: cityController,
          labelText: 'City',
          validator: (value) {
            if (value!.isEmpty) {
              return 'City cannot be empty';
            }
            return null;
          },
        ),
        CustomizedTextField(
          controller: stateController,
          labelText: 'State',
          validator: (value) {
            if (value!.isEmpty) {
              return 'State cannot be empty';
            }
            return null;
          },
        ),
        CustomizedTextField(
          controller: streetController,
          labelText: 'Street',
          validator: (value) {
            if (value!.isEmpty) {
              return 'Street cannot be empty';
            }
            return null;
          },
        ),
        CustomizedTextField(
          controller: zipcodeController,
          labelText: 'Zip Code',
          validator: (value) {
            if (value!.isEmpty) {
              return 'Zip Code cannot be empty';
            }
            return null;
          },
        ),
        _nextButton(pageController: _pageController),
      ],
    );
  }

  Widget _buildTitle() {
    return ListView(
      // crossAxisAlignment: CrossAxisAlignment.center,
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
        CustomizedTextField(
          controller: titleController,
          labelText: 'House Title',
          validator: (value) {
            if (value!.isEmpty) {
              return 'Title cannot be empty';
            }
            return null;
          },
        ),
        CustomizedTextField(
          controller: priceController,
          labelText: 'Price per Day',
          validator: (value) {
            if (value!.isEmpty) {
              return 'Price cannot be empty';
            }
            return null;
          },
          onChanged: (value) {
            price = double.parse(priceController.text);
          },
        ),
        _nextButton(pageController: _pageController),
      ],
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
    // dispose all the reamining controllers
    priceController.dispose();
    countryController.dispose();
    stateController.dispose();
    streetController.dispose();
    zipcodeController.dispose();
    cityController.dispose();
    cleaningfeeController.dispose();
    maxguestController.dispose();

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
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      product.addHouse(HouseProperty(
          maxguests: maxguests,
          propertyid: HOUSE_ID.toString(),
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          ownerId: "uday",
          housetitle: titleController.text,
          photos: photoUrlList.map((e) => e).toList(),
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
          features: _featurescontroller.map((e) => e.text).toList()));
      showSnackbarCustom(context, "House added Successfully", Colors.green);
      Navigator.of(context).pop();
    } else {
      showSnackbarCustom(context, 'Input fields are incorrect', Colors.red);
    }
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

class _nextButton extends StatelessWidget {
  const _nextButton({
    required PageController pageController,
  }) : _pageController = pageController;

  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.bottomRight,
        child: ElevatedButton(
          onPressed: () {
            _pageController.nextPage(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Next'),
              const Icon(Icons.arrow_forward),
            ],
          ),
        ),
      ),
    );
  }
}
