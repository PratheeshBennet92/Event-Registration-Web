// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:event_registration_web/formviewmodel.dart';
class FormWidget extends StatefulWidget {
  const FormWidget({super.key, required this.eventName});
  final String eventName;
  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final _formKey = GlobalKey<FormState>();
  final FormViewModel viewModel = FormViewModel();

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
                _buildTextField(
                    'Name', viewModel.validateName, (value) => viewModel.formData.name = value),
                _buildTextField(
                    'Designation', null, (value) => viewModel.formData.designation = value),
                _buildTextField(
                    'Contact #', null, (value) => viewModel.formData.contactNumber = value),
                _buildTextField(
                    'Email id', viewModel.validateEmail, (value) => viewModel.formData.email = value),
                _buildTextField('City', null, (value) => viewModel.formData.city = value),
                _buildTextField(
                    'Institution', null, (value) => viewModel.formData.institution = value),
                const SizedBox(height: 20.0),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        // Form is valid, submit the data
                        viewModel.submitForm();
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

  Widget _buildTextField(String labelText, String? Function(String?)? validator,
      void Function(String?)? onChanged) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: TextFormField(
        maxLength: 30,
        decoration: InputDecoration(
            labelText: labelText, border: const OutlineInputBorder()),
        validator: validator,
        onChanged: onChanged,
      ),
    );
  }
}
