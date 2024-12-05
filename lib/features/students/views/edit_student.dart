import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:student_attendance/features/users/models/user_model.dart';
import 'package:student_attendance/utils/utils.dart';

class EditStudent extends StatefulWidget {
  final UserModel data;

  const EditStudent({
    super.key,
    required this.data,
  });

  static String routeName = "/edit_student";

  @override
  State<EditStudent> createState() => _EditStudentState();
}

class _EditStudentState extends State<EditStudent> {
  var txtStuId = TextEditingController();
  var txtFirstName = TextEditingController();
  var txtLastName = TextEditingController();
  var txtPassword = TextEditingController();
  var txtConPassword = TextEditingController();
  var txtEmail = TextEditingController();
  var txtPhone = TextEditingController();
  bool hidePass = true;
  XFile? selectedProfileImg;
  DateTime? dob;

  @override
  void initState() {
    super.initState();
    txtStuId.text = widget.data.stuId ?? "";
    txtFirstName.text = widget.data.firstName ?? "";
    txtLastName.text = widget.data.lastName ?? "";
    txtEmail.text = widget.data.email ?? "";
    txtPhone.text = widget.data.phoneNumber ?? "";
    dob = widget.data.dob;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.dark,
          ),
          title: Text("Edit Student", style: Style.txt20Bold,),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                                return CachedNetworkImage(
                                  imageUrl: "",
                                  fit: BoxFit.cover,
                                  errorWidget: (_, __, ___) => noProfileWidget(size: 70,),
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
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Student ID", style: Style.txt16,),
                ),
                const SizedBox(height: 10,),
                TextField(
                  controller: txtStuId,
                  decoration: InputDecoration(
                    hintText: 'Enter student ID',
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
                  child: Text("Phone Number", style: Style.txt16,),
                ),
                const SizedBox(height: 10,),
                TextField(
                  controller: txtPhone,
                  decoration: InputDecoration(
                    hintText: 'Enter phone number',
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
                  child: Text("Date of Birth", style: Style.txt16,),
                ),
                const SizedBox(height: 10,),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () async {
                          var newDob = await showDatePicker(
                            context: context,
                            firstDate: DateTime(1800),
                            lastDate: DateTime.now(),
                            initialDate: dob ?? DateTime.now(),
                          );
                          if(newDob != null){
                            dob = newDob;
                            setState(() {});
                          }
                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                dob == null ? "Select Date of Birth" : DateFormat("dd-MM-yyyy").format(dob!),
                                style: Style.txt16,
                              ),
                              const SizedBox(width: 10,),
                              Icon(CupertinoIcons.calendar, color: Style.primaryColor,)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50,),
                Row(
                  children: [
                    Expanded(
                      child: primaryElevatedButton(
                        onPressed: () async {

                        },
                        child: Text("Save", style: Style.txt16WhiteBold,),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}