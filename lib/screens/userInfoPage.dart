import 'package:flutter/material.dart';

void main() {
  runApp(UserInfoApp());
}

class UserInfoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User Info Page',
      theme: ThemeData(
        primaryColor: Color(0xff00bf63), // Updated primary color
        primarySwatch: Colors.blue,
      ),
      home: UserInfoPage(),
    );
  }
}

class UserInfoPage extends StatefulWidget {
  @override
  _UserInfoPageState createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {
  String userName = "John Doe";
  String email = "johndoe@example.com";
  String phoneNumber = "+1 123-456-7890";

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text = userName;
    emailController.text = email;
    phoneNumberController.text = phoneNumber;
  }

  Future<void> signOutUser() async {
    // Implement your sign out logic here
    Navigator.pushReplacementNamed(
        context, "/login"); // Navigate to sign-in page
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Info'),
        backgroundColor: Color(0xff00bf63), // Updated app bar color
        automaticallyImplyLeading: false, // Remove back button
        actions: [
          IconButton(
            icon: Icon(Icons.logout_rounded),
            onPressed: () {
              showLogoutDialog(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(
                    'assets/profile_image.png'), // Add your image asset here
              ),
            ),
            SizedBox(height: 20),
            ListTile(
              title: Text("Name"),
              subtitle: TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              trailing: ElevatedButton(
                onPressed: () {
                  // Save name change logic here
                  setState(() {
                    userName = nameController.text;
                  });
                },
                child: Text("Save"),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xff00bf63), // Updated button color
                ),
              ),
            ),
            ListTile(
              title: Text("Email"),
              subtitle: TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              trailing: ElevatedButton(
                onPressed: () {
                  // Save email change logic here
                  setState(() {
                    email = emailController.text;
                  });
                },
                child: Text("Save"),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xff00bf63), // Updated button color
                ),
              ),
            ),
            ListTile(
              title: Text("Phone Number"),
              subtitle: TextFormField(
                controller: phoneNumberController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              trailing: ElevatedButton(
                onPressed: () {
                  // Save phone number change logic here
                  setState(() {
                    phoneNumber = phoneNumberController.text;
                  });
                },
                child: Text("Save"),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xff00bf63), // Updated button color
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Logout'),
          content: Text('Are you sure you want to log out?'),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Logout'),
              onPressed: () {
                signOutUser();
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
          ],
        );
      },
    );
  }
}
