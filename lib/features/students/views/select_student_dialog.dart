import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:student_attendance/features/users/models/user_model.dart';
import 'package:student_attendance/utils/utils.dart';

Future<T?> showSelectStudentDialog<T>({
  required List<UserModel> allStudents,
  required List<UserModel> selectedStudents,
  bool multiSelect = true,
}) async {
  var txtSearch = TextEditingController();
  List<UserModel> listStudents = [...allStudents];

  return await showCupertinoDialog(
    context: Singleton.instance.rootContext!,
    builder: (context) => AlertDialog(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      content: StatefulBuilder(
        builder: (context, setState) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Select Students", style: Style.txt16Bold,),
              divider(),
              const SizedBox(height: 10,),
              textFormField(
                controller: txtSearch,
                hintText: "Search (id, name)",
                onChanged: (v) {
                  if(v.trim().isNotEmpty){
                    listStudents = allStudents.where((e) => e.id!.toString().contains(v.toLowerCase()) || ("${e.fistName} ${e.lastName}").toLowerCase().contains(v.toLowerCase())).toList();
                  } else {
                    listStudents = [...allStudents];
                  }
                  setState(() {});
                }
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
                    const SizedBox(width: 10,),
                    if(multiSelect)
                    Container(
                      width: 50,
                      alignment: Alignment.center,
                      child: Text("Select", style: Style.txt16White,),
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
                child: (){
                  if(listStudents.isEmpty){
                    return notFoundWidget();
                  }
                  return Column(
                    children: List.generate(listStudents.length, (index){
                      var item = listStudents[index];
                      return InkWell(
                        onTap: (){
                          if(multiSelect){
                            if(selectedStudents.indexWhere((e) => e.id == item.id) >= 0){
                              selectedStudents.removeWhere((e) => e.id == item.id);
                            } else {
                              selectedStudents.add(item);
                            }
                            setState(() {});
                          } else {
                            context.pop(selectedStudents.first);
                          }
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          child: Row(
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
                              if(multiSelect)
                              Checkbox(
                                value: selectedStudents.indexWhere((e) => e.id == item.id) >= 0,
                                onChanged: (v){
                                  if(v!){
                                    selectedStudents.add(item);
                                  } else {
                                    selectedStudents.removeWhere((e) => e.id == item.id);
                                  }
                                  setState(() {});
                                },
                                activeColor: Style.primaryColor,
                                checkColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                side: BorderSide(
                                  color: Colors.grey[400]!,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  );
                }(),
              ),
              const SizedBox(height: 20,),
              Row(
                children: [
                  Expanded(
                    child: secondaryTextButton(
                      child: Text("Close", style: Style.txt16PrimaryColor,),
                      onPressed: () => context.pop(),
                    ),
                  ),
                  const SizedBox(width: 10,),
                  Expanded(
                    child: primaryTextButton(
                      child: Text("Done", style: Style.txt16White,),
                      onPressed: () {
                        if(multiSelect){
                          context.pop(selectedStudents);
                        } else {
                          context.pop(selectedStudents.first);
                        }
                      },
                    ),
                  ),
                ],
              ),
            ],
          );
        }
      ),
    ),
  );
}