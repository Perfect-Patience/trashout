import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class DriverLicenseForm extends StatefulWidget {
  @override
  _DriverLicenseFormState createState() => _DriverLicenseFormState();
}

class _DriverLicenseFormState extends State<DriverLicenseForm> {
  final _formKey = GlobalKey<FormState>();

  // Form fields variables
  String? firstName;
  String? lastName;
  String? email;
  String gender = 'Male';
  String? dob;
  String? licenseNumber;
  String? licenseExpiryDate;
  String? agentLocation;
  String? agencyLocationName;
  File? driverLicenseImage; // The selected driver's license image

  // Function to submit the form
  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Form is valid, process the data or submit to an API.
      // Access the form field values via the state variables
      // like this: firstName, lastName, email, gender, dob, licenseNumber, licenseExpiryDate, agentLocation, and agencyLocationName.
      // Handle the image upload logic here.
      // For simplicity, we will just print the form values and the image path.
      print('First Name: $firstName');
      print('Last Name: $lastName');
      print('Email: $email');
      print('Gender: $gender');
      print('Date of Birth: $dob');
      print('Driver\'s License Number: $licenseNumber');
      print('License Expiry Date: $licenseExpiryDate');
      print('Location of Agent: $agentLocation');
      print('Agency Location Name: $agencyLocationName');
      if (driverLicenseImage != null) {
        print('Driver\'s License Image Path: ${driverLicenseImage!.path}');
        // Implement the image upload logic here.
        // Use the driverLicenseImage.path to access the image file
        // and upload it to your server or storage.
      } else {
        print('No driver\'s license image selected.');
      }
    }
  }

  // Function to handle image selection from the device gallery or camera
  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        driverLicenseImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Driver License Form'),
        backgroundColor: Color(0xFF00BF63),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'First Name'),
                onChanged: (value) {
                  firstName = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your first name';
                  }
                  return null;
                },
              ),
              // Add Location of Agent TextFormField
              TextFormField(
                decoration: InputDecoration(labelText: 'Location of Agent'),
                onChanged: (value) {
                  agentLocation = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the location of the agent';
                  }
                  return null;
                },
              ),
              // Add Agency Location Name TextFormField
              TextFormField(
                decoration: InputDecoration(labelText: 'Agency Location Name'),
                onChanged: (value) {
                  agencyLocationName = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the agency location name';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Last Name'),
                onChanged: (value) {
                  lastName = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your last name';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                onChanged: (value) {
                  email = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  // You can add more email validation logic if needed.
                  return null;
                },
              ),
              DropdownButtonFormField<String>(
                value: gender,
                decoration: InputDecoration(labelText: 'Gender'),
                items: ['Male', 'Female', 'Others']
                    .map((item) => DropdownMenuItem(
                          value: item,
                          child: Text(item),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    gender = value!;
                  });
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Date of Birth'),
                onChanged: (value) {
                  dob = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your date of birth';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration:
                    InputDecoration(labelText: "Driver's License Number"),
                onChanged: (value) {
                  licenseNumber = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your driver's license number";
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "License Expiry Date"),
                onChanged: (value) {
                  licenseExpiryDate = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your license expiry date';
                  }
                  return null;
                },
              ),
              // ... Add other TextFormField fields here ...

              GestureDetector(
                onTap: () {
                  // Show a dialog to choose image source
                  showDialog(
                    context: context,
                    builder: (context) => Center(
                      child: AlertDialog(
                        title: Text('Select Image Source'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              _pickImage(ImageSource.camera);
                              Navigator.pop(context);
                            },
                            child: Text('Camera'),
                          ),
                          TextButton(
                            onPressed: () {
                              _pickImage(ImageSource.gallery);
                              Navigator.pop(context);
                            },
                            child: Text('Gallery'),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Text(
                    'Upload Driver\'s License',
                    style: TextStyle(
                      color: Color(0xFF00BF63),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              ElevatedButton(
                onPressed: _submitForm,
                child: Text(
                  'Submit',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF00BF63),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
