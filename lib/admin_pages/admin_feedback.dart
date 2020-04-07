import 'package:flutter/material.dart';
import 'package:studio_application/admin_pages/feedback_list.dart';

class AdminFeedbackPage extends StatefulWidget {
  @override
  _AdminFeedbackPageState createState() => _AdminFeedbackPageState();
}

class _AdminFeedbackPageState extends State<AdminFeedbackPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FeedbackList(),
    );
  }
}
