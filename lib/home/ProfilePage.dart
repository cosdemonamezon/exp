import 'dart:developer';

import 'package:exp/AlertDialogYesNo.dart';
import 'package:exp/login/widgets/inputTxtForm.dart';
import 'package:exp/models/user.dart';
import 'package:exp/services/serviceApi.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final GlobalKey<FormState> editFormKey = GlobalKey<FormState>();
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController tel = TextEditingController();
  User? profile;

  @override
  void initState() {
    super.initState();
    getProfile();
  }

  getProfile() async {
    User? data;
    try {
      data = await ServiceApi.profile();
      setState(() {
        profile = data;
      });
    } on Exception catch (e) {
      if (!mounted) return;
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialogYes(
          title: 'Error:',
          description: '${e}',
          pressYes: () {
            Navigator.pop(context, true);
          },
        ),
      );
    }
  }

  editProfile() async {
    try {
      final message = await ServiceApi.updateProfile(profile!.id.toString(), name.text, email.text, tel.text);
      if (!mounted) return;
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialogYes(
          title: 'Successful',
          description: message,
          pressYes: () {
            Navigator.pop(context, true);
          },
        ),
      );
    } on Exception catch (e) {
      if (!mounted) return;
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialogYes(
          title: 'Error:',
          description: '${e}',
          pressYes: () {
            Navigator.pop(context, true);
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('โปรไฟล์'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: editFormKey,
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.04,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InpuTextForm(
                    controller: name,
                    hintText: profile?.name,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'กรุณากรอกชื่อ';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InpuTextForm(
                    controller: email,
                    hintText: profile?.email,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'กรุณากรอกอีเมล';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InpuTextForm(
                    controller: tel,
                    hintText: profile?.tel,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'กรุณากรอกเบอร์โทร';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: size.height * 0.04,
                ),
                GestureDetector(
                  onTap: () async {
                    if (editFormKey.currentState!.validate()) {
                      try {} on Exception catch (e) {}
                    }
                    //Navigator.push(context, MaterialPageRoute(builder: (context) => FirstPage()));
                  },
                  child: GestureDetector(
                    onTap: () => editProfile(),
                    child: Container(
                      height: size.height * 0.06,
                      width: double.infinity,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.amber),
                      child: Center(
                        child: Text('แก้ใข'),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
