import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_attendance/utils/utils.dart';

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
  XFile? selectedProfileImg;
  UserType selectedUserType = UserType.teacher;

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
                const SizedBox(height: 20,),
                Text("REGISTER", style: Style.txt25Bold.copyWith(fontSize: 35),),
                const SizedBox(height: 20,),
                Center(
                  child: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () async {
                      var img = await pickImage(context: context);
                      if(img != null){
                        selectedProfileImg = img;
                        setState(() {});
                      }
                    },
                    child: Stack(
                      children: [
                        Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.grey[200]!
                            ),
                          ),
                          child: ClipOval(
                            child: (){
                              if(selectedProfileImg != null){
                                return Image.file(
                                  File(selectedProfileImg!.path),
                                  fit: BoxFit.cover,
                                );
                              }else{
                                return Center(
                                  child: ASIcon.solid(ASIconData.user, size: 70, color: Colors.grey[300]!,),
                                );
                              }
                            }(),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.grey[200]!,
                              ),
                            ),
                            padding: EdgeInsets.all(10),
                            child: ASIcon.solid(ASIconData.camera, size: 25, color: Style.primaryColor,),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
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
                const SizedBox(height: 20,),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Role", style: Style.txt16,),
                ),
                const SizedBox(height: 10,),
                DropdownButtonHideUnderline(
                  child: DropdownButtonFormField<UserType>(
                    value: selectedUserType,
                    dropdownColor: Colors.white,
                    decoration: InputDecoration(
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
                          width: 2,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.red,
                        ),
                      ),
                    ),
                    items: List.generate(UserType.values.length, (index) => DropdownMenuItem(
                      value: UserType.values[index],
                      child: Text(UserType.values[index].name.toCapitalized, style: Style.txt16,),
                    )),
                    onChanged: (v) async {
                      setState((){
                        selectedUserType = v!;
                      });
                    },
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