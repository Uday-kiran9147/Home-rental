
import 'package:flutter/material.dart';

class CustomizedTextField extends StatelessWidget {
  CustomizedTextField({
    Key? key,
    required this.controller,
    required this.labelText,
    required this.validator,
    this.onChanged,
  }) : super(key: key);

  final TextEditingController controller;
  final String labelText;
  final String? Function(String?) validator;
  void Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        onChanged: onChanged,
        validator: validator,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide.merge(BorderSide(), BorderSide()),
          ),
          labelText: labelText,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide:
                BorderSide(color: Theme.of(context).colorScheme.secondary),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(color: Colors.red),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(color: Colors.red),
          ),
        ),
      ),
    );
  }
}

class CustomNumericTextField extends StatelessWidget {
  const CustomNumericTextField({
    Key? key,
    required this.controller,
    required this.labelText,
    required this.onChanged,
    required this.validator,
  }) : super(key: key);

  final TextEditingController controller;
  final String labelText;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        onChanged: onChanged,
        validator: validator,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide:
                BorderSide(color: Theme.of(context).colorScheme.secondary),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(color: Colors.red),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(color: Colors.red),
          ),
        ),
      ),
    );
  }
}
