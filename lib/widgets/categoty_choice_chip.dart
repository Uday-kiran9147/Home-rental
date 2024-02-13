import 'package:flutter/material.dart';
import 'package:houserental/screens/navScreens/account_screen.dart';

// ignore: must_be_immutable
class ChoiceChipsExample extends StatefulWidget {
  Map<String, bool?> choicesref;

  ChoiceChipsExample({Key? key, required this.choicesref}) : super(key: key);

  @override
  _ChoiceChipsExampleState createState() => _ChoiceChipsExampleState();
}

class _ChoiceChipsExampleState extends State<ChoiceChipsExample> {
  List<String> choices = ["no choices"];

  @override
  initState() {
    super.initState();
    choices = widget.choicesref.entries.map((element) {
      return element.key;
    }).toList();
  }

  Set<String> selectedChoices = Set();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProfileHeadLine(title: 'Category'),
        Wrap(
          children: choices.map((String choice) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              child: ChoiceChip(
                label: Text(choice),
                selected: selectedChoices.contains(choice),
                onSelected: (bool selected) {
                  setState(() {
                    selectedChoices.contains(choice)
                        ? selectedChoices.remove(choice)
                        : selectedChoices.add(choice);
                    // print('before' + widget.choicesref[choice].toString()) ;
                    widget.choicesref[choice] = selected;
                    // print('After' + widget.choicesref[choice].toString()) ;
                  });
                },
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
