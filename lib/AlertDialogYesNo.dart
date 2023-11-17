import 'package:flutter/material.dart';

class AlertDialogYesNo extends StatelessWidget {
  AlertDialogYesNo(
      {Key? key,
      required this.description,
      required this.pressYes,
      required this.title,
      required this.pressNo})
      : super(key: key);
  final String title, description;
  final VoidCallback pressYes;
  final VoidCallback pressNo;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(description),
      actions: [
        TextButton(
          //textColor: Color(0xFF6200EE),
          onPressed: pressNo,
          child: Text('ยกเลิก'),
        ),
        TextButton(
          //textColor: Color(0xFF6200EE),
          onPressed: pressYes,
          child: Text('ตกลง'),
        ),
      ],
    );
  }
}

class AlertDialogYes extends StatelessWidget {
  AlertDialogYes(
      {Key? key,
      required this.description,
      required this.pressYes,
      required this.title})
      : super(key: key);
  final String title, description;
  final VoidCallback pressYes;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
          child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
        ),
      )),
      content: Text(
        description,
        style: TextStyle(
          fontSize: 18,
        ),
      ),
      actions: [
        Center(
          child: TextButton(
            //textColor: Color(0xFF6200EE),
            onPressed: pressYes,
            child: Text(
              'ตกลง',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.amber),
            ),
          ),
        ),
      ],
    );
  }
}
