import 'package:exp/home/ProfilePage.dart';
import 'package:exp/home/containerSetting.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Drawer(
      backgroundColor: Colors.white,
      width: size.width * 0.9,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.02,
              ),
              ClipRRect(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                  child: Image.asset(
                    'assets/icons/Cartoon_Person.png',
                    height: size.height * 0.15,
                    fit: BoxFit.fill,
                  )),
              SizedBox(
                height: size.height * 0.02,
              ),
              CotainerSetting(
                size: size,
                leadingIcon: 'assets/icons/icon_person.png',
                title: 'แก้ใขโปรไฟล์',
                trailingIcon: 'assets/icons/icon_back.png',
                press: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfilePage()));
                },
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              CotainerSetting(
                size: size,
                leadingIcon: 'assets/icons/icon_time.png',
                title: 'ประวัติ',
                trailingIcon: 'assets/icons/icon_back.png',
                press: (){},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
