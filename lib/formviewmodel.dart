import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// Model class representing the data fields of the form
class FormData {
  String? name;
  String? designation;
  String? contactNumber;
  String? email;
  String? city;
  String? institution;
}

// ViewModel class responsible for form logic and data manipulation
class FormViewModel extends ChangeNotifier {
  final _formData = FormData();

  // Getters for accessing form data
  FormData get formData => _formData;

  // Form validation methods
  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a name';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email';
    } else if (!_isValidEmail(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  bool _isValidEmail(String email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }
  
  // Submit form method
  Future<void> submitForm() async {
    // Perform any additional logic here
    print('Form name ${_formData.name}');
    print('Form designation ${_formData.designation}');
    print('Form email ${_formData.email}');
    print('Form contactNumber ${_formData.contactNumber}');
    print('Form city ${_formData.city}');
    print('Form institution ${_formData.institution}');


    // Prepare the form data to send to the API
    Map<String, dynamic> requestBody = {
      'name': _formData.name,
      'email': _formData.email,
      // Add other form fields as needed
    };

    // Make the API request
    final url = Uri.parse('your_api_endpoint');
    final response = await http.post(
      url,
      body: json.encode(requestBody),
      headers: {'Content-Type': 'application/json'},
    );

    // Check the response status
    if (response.statusCode == 200) {
      print('Form data submitted successfully');
    } else {
      print('Failed to submit form data: ${response.reasonPhrase}');
    }
  }
}