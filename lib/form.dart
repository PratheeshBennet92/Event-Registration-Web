// ignore_for_file: file_names

import 'package:flutter/material.dart';

class FormWidget extends StatefulWidget {
  const FormWidget({super.key, required this.eventName});
  final String eventName;  
  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Event Registration Form ${widget.eventName}'),
      ),
      body: Center(
          child: SingleChildScrollView(
        child: Container(
          width: 400, // Set a fixed width
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                _buildTextField('Name', _nameValidator),
                _buildTextField('Designation', null),
                _buildTextField('Contact #', null),
                _buildTextField('Email id', _emailValidator),
                _buildTextField('City', null),
                _buildTextField('Institution', null),
                const SizedBox(height: 20.0),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        // Form is valid, submit the data
                      }
                    },
                    child: const Text('Submit'),
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }

  Widget _buildTextField(String labelText, String? Function(String?)? validator) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: TextFormField(
        maxLength: 30,
        decoration: InputDecoration(
            labelText: labelText, border: const OutlineInputBorder()),
        validator: validator,
      ),
    );
  }
}

String? _emailValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter an email';
  } else if (!isValidEmail(value)) {
    return 'Please enter a valid email';
  }
  return null;
}

String? _nameValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter a name';
  }
  return null;
}


bool isValidEmail(String email) {
  // Simple email validation using a regular expression
  final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  return emailRegex.hasMatch(email);
}
