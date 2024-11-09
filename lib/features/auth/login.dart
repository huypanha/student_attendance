import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:student_attendance/features/auth/register.dart';
import 'package:student_attendance/features/dashboard/dashboard.dart';
import 'package:student_attendance/features/users/models/user_model.dart';
import 'package:student_attendance/utils/singleton.dart';
import 'package:student_attendance/utils/style.dart';
import 'package:student_attendance/utils/widgets/buttons.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static String routeName = "/login";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var txtUsername = TextEditingController();
  var txtPassword = TextEditingController();
  bool hidePass = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/logo.png", width: 200,),
                const SizedBox(height: 20,),
                Text("LOGIN", style: Style.txt25Bold.copyWith(fontSize: 35),),
                const SizedBox(height: 50,),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Username", style: Style.txt16,),
                ),
                const SizedBox(height: 10,),
                TextField(
                  controller: txtUsername,
                  decoration: InputDecoration(
                    hintText: 'Enter your username',
                    border: InputBorder.none,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.grey[300]!,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Style.primaryColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Password", style: Style.txt16,),
                ),
                const SizedBox(height: 10,),
                TextField(
                  controller: txtPassword,
                  obscureText: hidePass,
                  decoration: InputDecoration(
                    hintText: 'Enter your password',
                    border: InputBorder.none,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.grey[300]!,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Style.primaryColor,
                      ),
                    ),
                    suffixIcon: InkWell(
                      onTap: (){
                        setState(() {
                          hidePass = !hidePass;
                        });
                      },
                      child: Icon(hidePass ? CupertinoIcons.eye_slash_fill : CupertinoIcons.eye_fill, color: Style.primaryColor,),
                    ),
                  ),
                ),
                const SizedBox(height: 50,),
                Row(
                  children: [
                    Expanded(
                      child: primaryElevatedButton(
                        onPressed: () async {
//                           if(RegExp(r"^\d{1,3}(,\d{3})*\.\d{2}$").hasMatch(txtUsername.text)){
//                             print(true)
// ;                          } else {
//                             print(false);
//                           }
                          Singleton.instance.user = UserModel(
                            id: 1,
                            fistName: "Huy",
                            lastName: "Panha",
                            type: "T",
                          );
                          context.go(Dashboard.routeName);
                        },
                        child: Text("LOGIN", style: Style.txt16WhiteBold,),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30,),
                RichText(
                  text: TextSpan(
                    text: "Don't have an account? ",
                    style: Style.txt14Grey,
                    children: [
                      TextSpan(
                        text: "REGISTER",
                        style: Style.txt14PrimaryColor.copyWith(fontWeight: FontWeight.bold),
                        mouseCursor: SystemMouseCursors.click,
                        recognizer: TapGestureRecognizer()..onTap = () {
                          context.push(Register.routeName);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}