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
  bool _isLoading = false;
  bool _isSucsess = false;
  bool get isLoading => _isLoading;
  bool get isSuccess => _isSucsess;
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
    _isLoading = true; // Set isLoading to true before making the API request
    notifyListeners(); // Notify listeners immediately
    // Perform any additional logic here
    print('Form name ${_formData.name}');
    print('Foremailm designation ${_formData.designation}');
    print('Form email ${_formData.email}');
    print('Form contactNumber ${_formData.contactNumber}');
    print('Form city ${_formData.city}');
    print('Form institution ${_formData.institution}');

    Map<String, dynamic> participants = {
      "participantName": "_formData.name",
      "eventId": "30012024234548438",
      "designation": "_formData.designation",
      "contact": "_formData.contactNumber",
      "city": "_formData.city",
      "institution": "_formData.institution",
      "participantId": "132",
      "participantEmail": "pb33_db@example.com",
      "status": "registered"
      // Add other form fields as needed
    };

    Map<String, dynamic> requestBody = {
      "parentDeviceId": "B287B760-8695-44E4-A4E9-4E55D8DC7A6",
      "eventId": "12032024215641780",
      "name": "Test Event 1",
      "date": "25-07-2024",
      "participants": [participants]
    };
    print({requestBody, _isLoading});
    // Make the API request
    final url = Uri.parse(
        'https://zjk4kiwx8h.execute-api.us-east-1.amazonaws.com/dev/item/');
    final response = await http.put(
      url,
      body: json.encode(requestBody),
      headers: {'Content-Type': 'application/json'},
    );
    // After the request is complete, set isLoading to false
    _isLoading = false;
    notifyListeners();
    // Check the response status
    if (response.statusCode == 200) {
      _isSucsess = true;
      notifyListeners();
      print('Form data submitted successfully');
    } else {
       _isSucsess = false;
      notifyListeners();
      print('Failed to submit form data: ${response.body}');
    }
  }

  void setLoading(bool bool) {
    _isLoading = bool;
    notifyListeners();
  }
}
