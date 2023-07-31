import 'package:flutter/material.dart';

import 'agent_registration.dart';
import 'customer_sign_in.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Register As',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      FormPage())); // Perform action for customer selection
                        },
                        child: Icon(
                          Icons.person,
                          size: 120,
                          color: Color(0xff00bf63),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Customer',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 50),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      DriverLicenseForm())); // Perform action for agent selection
                        },
                        child: Icon(
                          Icons.local_shipping,
                          size: 120,
                          color: Color(0xff00bf63),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Agent',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(padding: const EdgeInsets.all(60.0)),
              SizedBox(height: 50),
              SizedBox(
                width: 250,
                child: ElevatedButton(
                  onPressed: () {
                    // Perform action for Next button
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xff00bf63),
                  ),
                  child: Text(
                    'Next',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
