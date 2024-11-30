import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:student_attendance/features/students/views/select_student_dialog.dart';
import 'package:student_attendance/features/users/models/user_model.dart';
import 'package:student_attendance/utils/dialogs.dart';
import 'package:student_attendance/utils/utils.dart';

class CreateEditCourse extends StatefulWidget {
  const CreateEditCourse({super.key});

  static String routeName = "/create_edit_course";

  @override
  State<CreateEditCourse> createState() => _CreateEditCourseState();
}

class _CreateEditCourseState extends State<CreateEditCourse> {
  TextEditingController txtSubject = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  UserModel? selectedUser;
  List<UserModel> users = [
    UserModel(
      id: 1,
      fistName: "Huy",
      lastName: "Panha",
    ),
    UserModel(
      id: 2,
      fistName: "Huy",
      lastName: "Samrech",
    ),
    UserModel(
      id: 3,
      fistName: "Om",
      lastName: "Chanpiseth",
    ),
  ];
  List<UserModel> allStudents = [
    UserModel(
      id: 1,
      fistName: "Huy",
      lastName: "Panha",
    ),
    UserModel(
      id: 2,
      fistName: "Huy",
      lastName: "Samrech",
    ),
    UserModel(
      id: 3,
      fistName: "Om",
      lastName: "Chanpiseth",
    ),
  ];
  List<UserModel> selectedStudents = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            Stack(
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
                    child: Image.asset("assets/images/sample_profile.jpeg", fit: BoxFit.cover,),
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
                      value: selectedUser,
                      validator: (v){
                        if(selectedUser == null){
                          return "msg.Required";
                        }
                        return null;
                      },
                      hint: Text("Choose a teacher", style: Style.txt16Grey,),
                      selectedItemBuilder: (context) => List.generate(users.length, (index) => DropdownMenuItem(
                        value: users[index],
                        child: Text("${users[index].fistName} ${users[index].lastName}", style: Style.txt16,),
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
                      items: List.generate(users.length, (index) => DropdownMenuItem(
                        value: users[index],
                        child: Row(
                          children: [
                            users[index].avatar(size: 40),
                            const SizedBox(width: 10,),
                            Text("${users[index].fistName} ${users[index].lastName}", style: Style.txt16,),
                          ],
                        ),
                      )),
                      onChanged: (v) async {
                        setState((){
                          selectedUser = v;
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
                      IconButton(
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
                                    Text("${item.fistName} ${item.lastName}", style: Style.txt16,),
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
                    controller: txtSubject,
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
                    onPressed: (){
                      formKey.currentState?.validate();
                    },
                    child: Text("Create", style: Style.txt16White,),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50,),
          ],
        ),
      ),
    );
  }
}