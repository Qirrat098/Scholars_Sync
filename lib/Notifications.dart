import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'GetX.dart';
import 'NotificationModel.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}
class _NotificationsState extends State<Notifications> {
  List<NotificationItem> _notifications = [];
  final UserController userController = Get.find();

  @override
  void initState() {
    super.initState();
    _fetchNotifications();  // Fetch notifications when the screen loads
  }

  Future<void> _fetchNotifications() async {
    // Simulate an API call
    await Future.delayed(Duration(seconds: 2));

    setState(() {
      _notifications = [
        NotificationItem(
          title: 'Session Request Accepted',
          message: 'Your session request for SubjectName 1 on 1 has been accepted',
          time: '5 mins ago',
        ),
        // Add more notifications as needed
      ];
    });
  }

  void _clearNotifications() {
    setState(() {
      _notifications.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFCFFD4),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back Button
              SizedBox(height: 16),
              IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Get.back();
                },
              ),
              SizedBox(height: 20), // Added SizedBox for spacing
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "  Notifications",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.nunito(
                      fontSize: 27,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  TextButton(
                    onPressed: _clearNotifications,
                    child: Text(
                      "Clear All",
                      style: GoogleFonts.nunito(
                        fontSize: 16,
                        color: Colors.deepPurpleAccent,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
              // Display notifications
              ..._notifications.map((notification) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 0.96 * MediaQuery.of(context).size.width,
                    height: 107,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        // Handle notification tap
                      },
                      child: Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.notifications, color: Color(0xFF7A1909)),
                            onPressed: () {},
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    notification.title,
                                    style: GoogleFonts.nunito(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(width: 22),
                                  Text(notification.time),
                                ],
                              ),
                              Text(
                                notification.message,
                                style: GoogleFonts.nunito(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}


/*Future<void> _fetchNotifications() async {
  try {
    // Example of an API call
    final response = await http.get('YOUR_API_URL');

    if (response.statusCode == 200) {
      // Parse the response and update _notifications list
      final data = json.decode(response.body);
      setState(() {
        _notifications = data.map<NotificationItem>((item) => NotificationItem(
          title: item['title'],
          message: item['message'],
          time: item['time'],
        )).toList();
      });
    } else {
      // Handle error
    }
  } catch (e) {
    // Handle exception
  }
}*/
