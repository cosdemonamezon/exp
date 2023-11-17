import 'package:exp/constants.dart';
import 'package:flutter/material.dart';

class NotiPage extends StatefulWidget {
  const NotiPage({super.key});

  @override
  State<NotiPage> createState() => _NotiPageState();
}

class _NotiPageState extends State<NotiPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.10,
            ),
            Column(
              children: List.generate(
                  notifications.length,
                  (index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                          margin: EdgeInsets.zero,
                          elevation: 0,
                          color: Colors.red,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: const Color.fromARGB(255, 223, 213, 213),
                              width: 2.0,
                            ),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: ListTile(
                              leading: Image.asset(notifications[index]['image']),
                              title: Text('หมายเลข: ${notifications[index]['no']}'),
                              subtitle: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('ข้อความ: ${notifications[index]['title']}'),
                                  Text('สถานะ: ${notifications[index]['description']}'),
                                  Text('วันที่: ${notifications[index]['date']}')
                                ],
                              ),
                              trailing: IconButton(onPressed: () {}, icon: Icon(Icons.drive_file_rename_outline_outlined)),
                            ),
                          ),
                        ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
