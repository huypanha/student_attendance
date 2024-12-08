import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:student_attendance/features/users/models/user_model.dart';
import 'package:student_attendance/features/users/repos/user_repos.dart';
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
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.dark,
          ),
          title: Text("Edit Student", style: Style.txt20Bold,),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: formKey,
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
                                    imageUrl: widget.data.profilePath,
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
                  textFormField(
                    controller: txtStuId,
                    hintText: 'Enter student ID',
                    validator: (v){
                      if(v.isEmpty){
                        return "Required";
                      }
                      return null;
                    },
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
                            textFormField(
                              controller: txtFirstName,
                              hintText: 'Enter first name',
                              validator: (v){
                                if(v.isEmpty){
                                  return "Required";
                                }
                                return null;
                              },
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
                            textFormField(
                              controller: txtLastName,
                              hintText: 'Enter last name',
                              validator: (v){
                                if(v.isEmpty){
                                  return "Required";
                                }
                                return null;
                              },
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
                  textFormField(
                    controller: txtPassword,
                    obscureText: hidePass,
                    hintText: 'Enter a new password',
                    suffixIcon: InkWell(
                      onTap: (){
                        setState(() {
                          hidePass = !hidePass;
                        });
                      },
                      child: Icon(hidePass ? CupertinoIcons.eye_slash_fill : CupertinoIcons.eye_fill, color: Style.primaryColor,),
                    ),
                      validator: (v){
                        if(v.isNotEmpty && txtConPassword.text.isEmpty){
                          return "Please enter confirm password";
                        } else if(v.isNotEmpty && v != txtConPassword.text){
                          return "Both password does not match";
                        }
                        return null;
                      }
                  ),
                  const SizedBox(height: 20,),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Confirm Password", style: Style.txt16,),
                  ),
                  const SizedBox(height: 10,),
                  textFormField(
                    controller: txtConPassword,
                    obscureText: hidePass,
                    hintText: 'Enter new password again',
                    suffixIcon: InkWell(
                      onTap: (){
                        setState(() {
                          hidePass = !hidePass;
                        });
                      },
                      child: Icon(hidePass ? CupertinoIcons.eye_slash_fill : CupertinoIcons.eye_fill, color: Style.primaryColor,),
                    ),
                      validator: (v){
                        if(v.isNotEmpty && txtPassword.text.isEmpty){
                          return "Please enter a new password";
                        } else if(v.isNotEmpty && v != txtPassword.text){
                          return "Both password does not match";
                        }
                        return null;
                      }
                  ),
                  const SizedBox(height: 20,),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Phone Number", style: Style.txt16,),
                  ),
                  const SizedBox(height: 10,),
                  textFormField(
                    controller: txtPhone,
                    hintText: 'Enter phone number',
                    validator: (v){
                      if(v.isEmpty){
                        return "Required";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20,),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Email", style: Style.txt16,),
                  ),
                  const SizedBox(height: 10,),
                  textFormField(
                    controller: txtEmail,
                    hintText: 'Enter email',
                    validator: (v){
                      if(v.isEmpty){
                        return "Required";
                      }
                      return null;
                    },
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
                            if(!formKey.currentState!.validate()) return;

                            if(dob == null){
                              showMessage(
                                context: context,
                                content: "Please select date of birth",
                                status: 2,
                              );
                              return;
                            }

                            var confirm = await showConfirmDialog(context: context);
                            if(!confirm) return;

                            var data = widget.data.copyWith(
                              stuId: txtStuId.text.trim(),
                              firstName: txtFirstName.text.trim(),
                              lastName: txtLastName.text.trim(),
                              password: txtPassword.text.trim().isNotEmpty ? txtPassword.text.trim() : null,
                              phoneNumber: txtPhone.text.trim(),
                              email: txtEmail.text.trim(),
                              dob: dob,
                              updatedAt: DateTime.now(),
                              updatedByModel: Singleton.instance.token,
                            );

                            showProgress(context);
                            var re = await UserRepos().update(data.toJson(), selectedProfileImg != null ? File(selectedProfileImg!.path) : null);
                            context.pop();
                            if(re != null){
                              context.pop(data);
                            } else {
                              showMessage(
                                context: context,
                                content: Singleton.instance.errorMsg,
                                status: 0,
                              );
                            }
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
      ),
    );
  }
}