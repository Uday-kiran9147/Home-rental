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
  const FillHouseDetails({Key? key}) : super(key: key);

  @override
  State<FillHouseDetails> createState() => _FillHouseDetailsState();
}

class _FillHouseDetailsState extends State<FillHouseDetails> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final PageController _pageController = PageController();
  final HOUSE_ID = DateTime.now().millisecondsSinceEpoch;
  TimeOfDay checkIndateTime = TimeOfDay.now();
  TimeOfDay checkOutdateTime = TimeOfDay.now();
  TextEditingController titleController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController zipcodeController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController cleaningfeeController = TextEditingController();
  TextEditingController maxguestController = TextEditingController();
  TextEditingController bedCountController = TextEditingController(text: 0.toString());
  double price = 0;
  int maxguests = 2;
  double cleaningFee = 500;
  final List<TextEditingController> _featurescontroller = [];
  final List<TextField> _featureFields = [];
  List<String> photoUrlList = [];
  List<File> photoFileList = [];
  final Map<String, bool?> _categoryCheckBox = {
    'Pool': false,
    'Beach': false,
    'Lakefront': false,
    'Windmill': false,
    'Historical_home': false,
    'Private_home': false,
    'National_Park': false,
    'Trending': false,
    'Island': false,
    'Camping': false,
  };
  Set<String> categoryList = {};
  int _currentPageIndex = 0;
  var beds = [0,1,2,3,4,5,6];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final product = Provider.of<MyAppState>(context, listen: false);
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
            onPressed: trySubmit,
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: PageView(
          controller: _pageController,
          onPageChanged: onPageChanged,
          children: _buildPages(),
        ),
      ),
    );
  }

  List<Widget> _buildPages() {
    return [
      _buildTitle(),
      _buildAddress(),
      _maxGuests(),
      _buildChecking(),
      _buildRemaining(),
    ];
  }

  Widget _buildRemaining() {
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
                backgroundColor: Color.fromARGB(255, 91, 205, 46),
              ),
              onPressed: () {
                var appState = Provider.of<MyAppState>(context, listen: false);
                categoryList = getKeysWithTrueValues(_categoryCheckBox);
                print(categoryList);
                trySubmit();
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

  Widget _maxGuests() {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 20).copyWith(top: 20),
      children: [
        CustomNumericTextField(
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

  Widget _buildChecking() {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 20).copyWith(top: 20),
      children: [
        Align(
          alignment: Alignment.center,
          child: Row(
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
        ),
        const SizedBox(height: 20),
        const Text(
          'Number of Bed rooms',
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          child: dropDownBedCount(),
        ),
        const SizedBox(height: 20),
        _addFeatureTile(),
        _featureListView(),
        _nextButton(pageController: _pageController),
      ],
    );
  }

  Widget _buildAddress() {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 20).copyWith(top: 20),
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
      padding: EdgeInsets.symmetric(horizontal: 20).copyWith(top: 20),
      children: [
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

  Set<String> getKeysWithTrueValues(Map<String, bool?> myMap) {
    Set<String> result = {};
    for (var entry in myMap.entries) {
      if (entry.value == true) {
        result.add(entry.key);
      }
    }
    return result;
  }

  Widget dropDownBedCount() {
    return DropdownMenu(
      label: Text('select'),
      controller: bedCountController,
      enableFilter: true,
      enableSearch: true,
      leadingIcon: Icon(Icons.bed),
      requestFocusOnTap: true,
      inputDecorationTheme: const InputDecorationTheme(
        filled: true,
        contentPadding: EdgeInsets.symmetric(vertical: 5.0),
      ),
      dropdownMenuEntries: beds
          .map((e) => DropdownMenuEntry(
                value: bedCountController,
                label: e.toString(),
              ))
          .toList(),
      onSelected: (value) {
        setState(() {
          bedCountController = value!;
        });
      },
    );
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

  void trySubmit() {
    var appState = Provider.of<MyAppState>(context, listen: false);
    print(appState.allhouseGetter);
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      appState.addHouse(HouseProperty(
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
        bedcount: int.parse(bedCountController.text),
        category: categoryList.map((e) => e.toString()).toList(),
        features: _featurescontroller.map((e) => e.text).toList(),
      ));
      showSnackbarCustom(context, "House added Successfully", Colors.green);
      Navigator.of(context).pop();
    } else {
      showSnackbarCustom(context, 'Input fields are incorrect', Colors.red);
    }
  }

  void onPageChanged(int index) {
    setState(() {
      _currentPageIndex = index;
    });
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

  Widget _nextButton({required PageController pageController}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.bottomRight,
        child: ElevatedButton(
          onPressed: () {
            pageController.nextPage(
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
