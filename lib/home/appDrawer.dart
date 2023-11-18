import 'package:exp/AlertDialogYesNo.dart';
import 'package:exp/home/ProfilePage.dart';
import 'package:exp/home/containerSetting.dart';
import 'package:exp/login/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
                press: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
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
                press: () {},
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              CotainerSetting(
                size: size,
                leadingIcon: 'assets/icons/icon_logout.png',
                title: 'ออกจากระบบ',
                trailingIcon: 'assets/icons/icon_back.png',
                press: () async {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialogYesNo(
                            title: 'คุณแน่ใจไหมที่จะออกจะระบบ',
                            description: 'ระบบจะพาคุณไปหน้าล็อกอินหลังจากที่กดตกลง',
                            pressYes: () async {
                              final SharedPreferences prefs = await SharedPreferences.getInstance();
                              prefs.clear();

                              if (mounted) {
                                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginPage()), (route) => false);
                              }
                            },
                            pressNo: () {
                              Navigator.pop(context);
                            });
                      });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
