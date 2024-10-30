import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:student_attendance/utils/style.dart';
import 'package:student_attendance/utils/widgets/buttons.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  static String routeName = "/register";

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var txtFirstName = TextEditingController();
  var txtLastName = TextEditingController();
  var txtPassword = TextEditingController();
  var txtConPassword = TextEditingController();
  var txtEmail = TextEditingController();
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
                Text("REGISTER", style: Style.txt25Bold.copyWith(fontSize: 35),),
                const SizedBox(height: 50,),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text("First Name", style: Style.txt16,),
                          ),
                          const SizedBox(height: 10,),
                          TextField(
                            controller: txtFirstName,
                            decoration: InputDecoration(
                              hintText: 'Enter first name',
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
                        ],
                      ),
                    ),
                    const SizedBox(width: 20,),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Last Name", style: Style.txt16,),
                          ),
                          const SizedBox(height: 10,),
                          TextField(
                            controller: txtLastName,
                            decoration: InputDecoration(
                              hintText: 'Enter last name',
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
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20,),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("New Password", style: Style.txt16,),
                ),
                const SizedBox(height: 10,),
                TextField(
                  controller: txtPassword,
                  obscureText: hidePass,
                  decoration: InputDecoration(
                    hintText: 'Enter a new password',
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
                const SizedBox(height: 20,),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Confirm Password", style: Style.txt16,),
                ),
                const SizedBox(height: 10,),
                TextField(
                  controller: txtConPassword,
                  obscureText: hidePass,
                  decoration: InputDecoration(
                    hintText: 'Enter new password again',
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
                const SizedBox(height: 20,),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Email", style: Style.txt16,),
                ),
                const SizedBox(height: 10,),
                TextField(
                  controller: txtEmail,
                  decoration: InputDecoration(
                    hintText: 'Enter email',
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
                const SizedBox(height: 50,),
                Row(
                  children: [
                    Expanded(
                      child: primaryElevatedButton(
                        onPressed: () async {

                        },
                        child: Text("REGISTER", style: Style.txt16WhiteBold,),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30,),
                RichText(
                  text: TextSpan(
                    text: "Already have an account? ",
                    style: Style.txt14Grey,
                    children: [
                      TextSpan(
                        text: "LOGIN",
                        style: Style.txt14PrimaryColor.copyWith(fontWeight: FontWeight.bold),
                        mouseCursor: SystemMouseCursors.click,
                        recognizer: TapGestureRecognizer()..onTap = () {
                          context.pop();
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