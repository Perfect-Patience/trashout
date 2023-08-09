import 'package:flutter/material.dart';
import 'agent_registration.dart';
import 'customer_sign_in.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isCustomerSelected = false;
  bool isAgentSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
              color: Colors.black), // Change color to black
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
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
                          setState(() {
                            isCustomerSelected = true;
                            isAgentSelected = false;
                          });
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 200),
                          curve: Curves.easeInOut,
                          decoration: BoxDecoration(
                            color:
                                isCustomerSelected ? Colors.blue : Colors.white,
                            borderRadius: BorderRadius.circular(72),
                            boxShadow: isCustomerSelected
                                ? [
                                    BoxShadow(
                                      color: Colors.blue.withOpacity(0.5),
                                      blurRadius: 15,
                                      offset: Offset(0, 10),
                                    ),
                                  ]
                                : [],
                          ),
                          child: Icon(
                            Icons.person,
                            size: 132,
                            color:
                                isCustomerSelected ? Colors.white : Colors.blue,
                          ),
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
                          setState(() {
                            isCustomerSelected = false;
                            isAgentSelected = true;
                          });
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 200),
                          curve: Curves.easeInOut,
                          decoration: BoxDecoration(
                            color: isAgentSelected ? Colors.blue : Colors.white,
                            borderRadius: BorderRadius.circular(72),
                            boxShadow: isAgentSelected
                                ? [
                                    BoxShadow(
                                      color: Colors.blue.withOpacity(0.5),
                                      blurRadius: 15,
                                      offset: Offset(0, 10),
                                    ),
                                  ]
                                : [],
                          ),
                          child: Icon(
                            Icons.local_shipping,
                            size: 132,
                            color: isAgentSelected ? Colors.white : Colors.blue,
                          ),
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
                  onPressed: (isCustomerSelected || isAgentSelected)
                      ? () {
                          if (isCustomerSelected) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FormPage()));
                          } else if (isAgentSelected) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DriverLicenseForm()));
                          }
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
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
