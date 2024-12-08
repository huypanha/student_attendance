import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_attendance/features/courses/models/course_model.dart';
import 'package:student_attendance/features/courses/repos/course_repos.dart';
import 'package:student_attendance/features/students/views/select_student_dialog.dart';
import 'package:student_attendance/features/users/models/user_model.dart';
import 'package:student_attendance/features/users/repos/user_repos.dart';
import 'package:student_attendance/utils/utils.dart';

class CreateEditCourse extends StatefulWidget {
  final CourseModel? data;

  const CreateEditCourse({
    super.key,
    this.data,
  });

  static String routeName = "/create_edit_course";

  @override
  State<CreateEditCourse> createState() => _CreateEditCourseState();
}

class _CreateEditCourseState extends State<CreateEditCourse> {
  TextEditingController txtSubject = TextEditingController();
  TextEditingController txtDesc = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  UserModel? selectedTeacher;
  List<UserModel> allTeachers = [];
  List<UserModel> allStudents = [];
  List<UserModel> selectedStudents = [];
  XFile? selectedImg;
  bool isGettingData = true;

  @override
  void initState() {
    super.initState();
    getData();

    if(widget.data != null){
      txtSubject.text = widget.data!.subject ?? "";
      txtDesc.text = widget.data!.description ?? "";
      selectedStudents = [...widget.data!.students ?? []];
      selectedTeacher = widget.data!.teacherModel;
    }
  }

  Future getData() async {
    isGettingData = true;
    setState(() {});

    var t = await UserRepos().get({
      "type": 0,
      "status": 'A'
    });
    if(t != null){
      allTeachers = UserModel.fromJsonArray(t);
    }
    var s = await UserRepos().get({
      "type": 1,
      "status": 'A'
    });
    if(s != null){
      allStudents = UserModel.fromJsonArray(s);
    }

    isGettingData = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarBrightness: Brightness.light,
          ),
          title: Text("Create Course", style: Style.txt20Bold,),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 10,),
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () async {
                  var img = await pickImage(context: context);
                  if(img != null){
                    selectedImg = img;
                    setState(() {});
                  }
                },
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.grey[200]!,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: (){
                          if(selectedImg != null){
                            return Image.file(File(selectedImg!.path), fit: BoxFit.cover,);
                          } else {
                            if(widget.data != null){
                              return CachedNetworkImage(
                                imageUrl: widget.data!.imgUrl,
                                fit: BoxFit.cover,
                                errorWidget: (_, __, ___) => noImageWidget(size: 70, color: Colors.grey[200],),
                              );
                            }
                            return noImageWidget(size: 70, color: Colors.grey[200]);
                          }
                        }(),
                      ),
                    ),
                    Positioned(
                      right: -5,
                      bottom: -5,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        padding: EdgeInsets.all(5),
                        child: Icon(Icons.camera_alt, color: Style.primaryColor,),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30,),
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Subject", style: Style.txt16,),
                    const SizedBox(height: 10,),
                    textFormField(
                      controller: txtSubject,
                      hintText: "Subject",
                      validator: (v){
                        if(v.trim().isEmpty){
                          return "Required";
                        }
                        return null;
                      }
                    ),
                    const SizedBox(height: 20,),
                    Text("Teacher", style: Style.txt16,),
                    const SizedBox(height: 10,),
                    DropdownButtonHideUnderline(
                      child: DropdownButtonFormField<UserModel>(
                        value: selectedTeacher,
                        validator: (v){
                          if(selectedTeacher == null){
                            return "msg.Required";
                          }
                          return null;
                        },
                        hint: Text(isGettingData ? "Loading..." : "Choose a teacher", style: Style.txt16Grey,),
                        selectedItemBuilder: (context) => List.generate(allTeachers.length, (index) => DropdownMenuItem(
                          value: allTeachers[index],
                          child: Text("${allTeachers[index].firstName} ${allTeachers[index].lastName}", style: Style.txt16,),
                        )),
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
                        items: List.generate(allTeachers.length, (index) => DropdownMenuItem(
                          value: allTeachers[index],
                          child: Row(
                            children: [
                              allTeachers[index].avatar(size: 40),
                              const SizedBox(width: 10,),
                              Text("${allTeachers[index].firstName} ${allTeachers[index].lastName}", style: Style.txt16,),
                            ],
                          ),
                        )),
                        onChanged: (v) async {
                          setState((){
                            selectedTeacher = v;
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Students", style: Style.txt16,),
                        const SizedBox(width: 10,),
                        IgnorePointer(
                          ignoring: isGettingData,
                          child: IconButton(
                            onPressed: () async {
                              var re = await showSelectStudentDialog<List<UserModel>>(
                                allStudents: allStudents,
                                selectedStudents: selectedStudents,
                              );
                              if(re != null){
                                selectedStudents = re;
                                setState(() {});
                              }
                            },
                            icon: ASIcon.solid(ASIconData.circlePlus, color: Style.primaryColor,),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    Container(
                      decoration: BoxDecoration(
                        color: Style.primaryColor,
                        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                        border: Border.all(
                          color: Style.primaryColor,
                        ),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text("Student", style: Style.txt16White,),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
                        border: Border.all(
                          color: Style.primaryColor,
                        ),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      child: (){
                        FocusScope.of(context).requestFocus(FocusNode());

                        if(isGettingData){
                          return loadingWidget();
                        }

                        if(selectedStudents.isEmpty){
                          return notFoundWidget();
                        }
                        return ListView.builder(
                          itemCount: selectedStudents.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          itemBuilder: (context, index) {
                            var item = selectedStudents[index];
                            return Row(
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      item.avatar(size: 40),
                                      const SizedBox(width: 10,),
                                      Text("${item.firstName} ${item.lastName}", style: Style.txt16,),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 10,),
                                IconButton(
                                  onPressed: () async {
                                    bool confirm = await showConfirmDialog(
                                      context: context,
                                      content: "Are you sure you want to delete this student?",
                                      isDangerous: true,
                                    );
                                    if(!confirm) return;

                                    selectedStudents.removeAt(index);
                                    setState(() {});
                                  },
                                  icon: ASIcon.solid(ASIconData.xMark, color: Colors.red,),
                                ),
                              ],
                            );
                          },
                        );
                      }(),
                    ),
                    const SizedBox(height: 20,),
                    Text("Description", style: Style.txt16,),
                    const SizedBox(height: 10,),
                    textFormField(
                      controller: txtDesc,
                      maxLines: 5,
                      keyboardType: TextInputType.multiline,
                      hintText: "Description (Optional)",
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30,),
              Row(
                children: [
                  Expanded(
                    child: primaryElevatedButton(
                      onPressed: () async {
                       if(!formKey.currentState!.validate()) return;

                       if(selectedTeacher == null) {
                         showMessage(
                           context: context,
                           content: "Please select a teacher",
                           status: 2,
                         );
                         return;
                       }
                       // if(selectedStudents.isEmpty) {
                       //   showMessage(
                       //     context: context,
                       //     content: "Please select at least one student",
                       //     status: 2,
                       //   );
                       //   return;
                       // }

                       var confirm = await showConfirmDialog(
                         context: context,
                       );
                       if(!confirm) return;

                       if(widget.data == null){
                         var data = CourseModel(
                           subject: txtSubject.text,
                           description: txtDesc.text,
                           teacherId: selectedTeacher!.id,
                           studentIds: selectedStudents.map((e) => e.id!).toList(),
                         ).toJson();

                         showLoading(context);
                         var re = await CourseRepos().create(data, selectedImg?.path);
                         context.pop();
                         if(re != null){
                           context.pop(CourseModel.fromJson(re));
                         } else {
                           showMessage(
                             context: context,
                             content: Singleton.instance.errorMsg,
                             status: 0,
                           );
                         }
                       } else {
                         var data = widget.data!.copyWith(
                           subject: txtSubject.text,
                           description: txtDesc.text,
                           teacherId: selectedTeacher!.id,
                           studentIds: selectedStudents.map((e) => e.id!).toList(),
                           updatedBy: Singleton.instance.token.id,
                           updatedAt: DateTime.now(),
                         ).toJson();

                         showLoading(context);
                         var re = await CourseRepos().update(data, selectedImg?.path);
                         context.pop();
                         if(re != null){
                           context.pop(CourseModel.fromJson(re));
                         } else {
                           showMessage(
                             context: context,
                             content: Singleton.instance.errorMsg,
                             status: 0,
                           );
                         }
                       }
                      },
                      child: Text(widget.data != null ? "Save" : "Create", style: Style.txt16White,),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50,),
            ],
          ),
        ),
      ),
    );
  }
}