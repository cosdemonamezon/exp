import 'package:exp/AlertDialogYesNo.dart';
import 'package:exp/home/firstPage.dart';
import 'package:exp/home/homePage.dart';
import 'package:exp/login/widgets/inputTxtForm.dart';
import 'package:exp/register/registerPage.dart';
import 'package:exp/services/serviceApi.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 121, 241, 241),
      body: SingleChildScrollView(
        child: Form(
          key: loginFormKey,
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.10,
              ),
              Center(
                child: SizedBox(
                    width: size.width * 0.50,
                    height: size.height * 0.20,
                    child: Image.asset(
                      'assets/images/banner1.png',
                      fit: BoxFit.fill,
                    )),
              ),
              SizedBox(
                height: size.height * 0.10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InpuTextForm(
                  controller: username,
                  hintText: 'อีเมล',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'กรุณากรอกอีเมล';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: InpuTextForm(
                  controller: password,
                  isPassword: true,
                  hintText: 'รหัสผ่าน',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'กรุณากรอกรหัสผ่าน';
                    }
                    // if (value.length < 8) {
                    //   return 'พาสเวิร์ต้องมีความยาว 8 อักษรขึ้นไป';
                    // }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              GestureDetector(
                onTap: () async {
                  if (loginFormKey.currentState!.validate()) {
                    try {
                      final _login = await ServiceApi.login(username: username.text, password: password.text);
                      if (_login != null) {

                        if (!mounted) return;
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => FirstPage()), (route) => false);
                        
                      } else {}
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
                              ));
                    }
                  }
                  //Navigator.push(context, MaterialPageRoute(builder: (context) => FirstPage()));
                },
                child: Container(
                  height: size.height * 0.06,
                  width: double.infinity,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.amber),
                  child: Center(
                    child: Text('Login'),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage()));
                },
                child: Container(
                  height: size.height * 0.06,
                  width: double.infinity,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.blue),
                  child: Center(
                    child: Text('ลงทะเบียน'),
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
