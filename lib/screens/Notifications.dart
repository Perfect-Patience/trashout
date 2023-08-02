import 'package:flutter/material.dart';

class Notifications extends StatelessWidget {
  final List<String> dummyNotifications = [
    "Alert: Password Change Required",
    "Success: Pickup Request Completed",
    "Order Completed: Thank you for your order!",
    "Pickup Accepted: Driver en route to your location",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notifications',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: CustomSearchDelegate());
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: dummyNotifications.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Color(0xff00bf63),
              child: Icon(Icons.notifications, color: Colors.white),
            ),
            title: Text(dummyNotifications[index]),
            onTap: () =>
                _showNotificationDialog(context, dummyNotifications[index]),
          );
        },
      ),
    );
  }

  void _showNotificationDialog(BuildContext context, String notification) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Notification'),
          content: Text(notification),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}

class CustomSearchDelegate extends SearchDelegate<String> {
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Implement the search suggestions display here
    return Center(
      child: Text('Search Suggestions for "$query"'),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Implement the search results display here
    return Center(
      child: Text('Search Results for "$query"'),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Notifications(),
  ));
}
