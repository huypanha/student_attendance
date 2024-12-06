import 'dart:developer';

import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:student_attendance/features/auth/repos/auth_repos.dart';
import 'package:student_attendance/features/dashboard/dashboard.dart';
import 'package:student_attendance/features/users/models/user_model.dart';
import 'package:student_attendance/utils/utils.dart';

import 'register.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static String routeName = "/login";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var txtEmailId = TextEditingController();
  var txtPassword = TextEditingController();
  bool hidePass = true;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/logo.png", width: 200,),
                  const SizedBox(height: 20,),
                  Text("LOGIN", style: Style.txt25Bold.copyWith(fontSize: 35),),
                  const SizedBox(height: 50,),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Email", style: Style.txt16,),
                  ),
                  const SizedBox(height: 10,),
                  textFormField(
                    controller: txtEmailId,
                    hintText: 'Enter your email',
                    validator: (v){
                      if(v.isEmpty){
                        return "Required";
                      }
                      return null;
                    }
                  ),
                  const SizedBox(height: 20,),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Password", style: Style.txt16,),
                  ),
                  const SizedBox(height: 10,),
                  textFormField(
                    controller: txtPassword,
                    obscureText: hidePass,
                    hintText: 'Enter your password',
                    validator: (v){
                      if(v.isEmpty){
                        return "Required";
                      }
                      return null;
                    },
                    suffixIcon: InkWell(
                      onTap: (){
                        setState(() {
                          hidePass = !hidePass;
                        });
                      },
                      child: Icon(hidePass ? CupertinoIcons.eye_slash_fill : CupertinoIcons.eye_fill, color: Style.primaryColor,),
                    ),
                  ),
                  const SizedBox(height: 50,),
                  Row(
                    children: [
                      Expanded(
                        child: primaryElevatedButton(
                          onPressed: () async {
                            if(!formKey.currentState!.validate()) return;

                            showLoading(context);
                            var re = await AuthRepos().login({
                              "id": txtEmailId.text.trim(),
                              "password": txtPassword.text.trim(),
                            });
                            context.pop();
                            if(re != null){
                              log(re.toString());
                              Singleton.instance.token = UserModel.fromJson(JWT.verify(re, Singleton.instance.jwtSecret).payload);
                              context.go(Dashboard.routeName);
                            } else {
                              showMessage(
                                context: context,
                                content: Singleton.instance.errorMsg,
                                status: 0,
                              );
                            }
                          },
                          child: Text("LOGIN", style: Style.txt16WhiteBold,),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30,),
                  RichText(
                    text: TextSpan(
                      text: "Don't have account yet? ",
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
      ),
    );
  }
}