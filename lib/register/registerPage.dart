import 'package:exp/AlertDialogYesNo.dart';
import 'package:exp/login/loginPage.dart';
import 'package:exp/login/widgets/inputTxtForm.dart';
import 'package:exp/services/serviceApi.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController tel = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController nikname = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ลงทะเบียน',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red, fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: registerFormKey,
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
                      'assets/icons/Cartoon_Person.png',
                      fit: BoxFit.fill,
                    )),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InpuTextForm(
                  controller: username,
                  hintText: 'กรอกชื่อ',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'กรุณากรอกอีเมล';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InpuTextForm(
                  controller: password,
                  hintText: 'รหัสผ่าน',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'กรุณากรอกอีเมล';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InpuTextForm(
                  controller: tel,
                  hintText: 'เบอร์โทร',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'กรุณากรอกอีเมล';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InpuTextForm(
                  controller: email,
                  hintText: 'อีเมล',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'กรุณากรอกอีเมล';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InpuTextForm(
                  controller: nikname,
                  hintText: 'ชือเล่น',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'กรุณากรอกอีเมล';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: GestureDetector(
                  onTap: () async{
                    if (registerFormKey.currentState!.validate()) {
                      final _register = await ServiceApi.register(
                        username: username.text, 
                        password: password.text, 
                        name: nikname.text, 
                        tel: tel.text, 
                        email: email.text);

                        if (_register != null) {
                          if(!mounted)return;
                          final ok = await showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (context) => AlertDialogYes(
                              title: 'สำเร็จ',
                              description: 'บันทึกข้อมูลสำเร็จ',
                              pressYes: (){
                                Navigator.pop(context, true);
                              },
                            )
                          );
                          if (ok == true) {
                            if(!mounted)return;
                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginPage()), (route) => false);
                          }
                        } else {
                          
                        }
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: size.height * 0.06,
                      width: double.infinity,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.blue),
                      child: Center(
                        child: Text('ลงทะเบียน'),
                      ),
                    ),
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
