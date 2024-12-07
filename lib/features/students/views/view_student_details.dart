import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:student_attendance/features/students/views/edit_student.dart';
import 'package:student_attendance/features/users/models/user_model.dart';
import 'package:student_attendance/utils/utils.dart';

import '../../users/repos/user_repos.dart';

class ViewStudentDetails extends StatefulWidget {
  final UserModel data;

  const ViewStudentDetails({
    super.key,
    required this.data,
  });

  static String routeName = "/view_student_details";

  @override
  State<ViewStudentDetails> createState() => _ViewStudentDetailsState();
}

class _ViewStudentDetailsState extends State<ViewStudentDetails> {
  var scrollCon = ScrollController();
  var pinnedTitle = false;
  late UserModel data = widget.data;

  @override
  void initState() {
    super.initState();
    scrollCon.addListener(() {
      var targetOffset = MediaQuery.sizeOf(context).height > MediaQuery.sizeOf(context).width
          ? MediaQuery.sizeOf(context).width * .5
          : MediaQuery.sizeOf(context).height * .5;
      if(scrollCon.offset >= targetOffset && !pinnedTitle){
        pinnedTitle = true;
        setState(() {});
      } else if(scrollCon.offset < targetOffset && pinnedTitle){
        pinnedTitle = false;
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    scrollCon.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      body: CustomScrollView(
        controller: scrollCon,
        physics: BouncingScrollPhysics(),
        slivers: [
          _buildAppBar,
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildInformation,
                  // const SizedBox(height: 20,),
                  // _buildCourses,
                  const SizedBox(height: 50,),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget get _buildAppBar => SliverAppBar(
    backgroundColor: pinnedTitle ? Colors.white : Colors.transparent,
    surfaceTintColor: pinnedTitle ? Colors.white : Colors.transparent,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
    ),
    stretch: true,
    pinned: true,
    expandedHeight: MediaQuery.sizeOf(context).height > MediaQuery.sizeOf(context).width
        ? MediaQuery.sizeOf(context).width * .7
        : MediaQuery.sizeOf(context).height * .7,
    shape: RoundedRectangleBorder(
      side: BorderSide(
        color: Colors.grey[200]!,
      ),
    ),
    actions: [
      PopupMenuButton(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        onSelected: (v) async {
          if(v == "edit"){
            var re = await context.push(Uri(path: EditStudent.routeName, queryParameters: {"data": jsonEncode(data.toJson())}).toString());
            if(re != null){
              await CachedNetworkImage.evictFromCache(data.profilePath);
              data = re as UserModel;
              setState(() {});
            }
          } else if(v == "delete"){
            var confirm = await showConfirmDialog(
              context: context,
              content: "Are you sure you want to delete this student?",
              isDangerous: true,
            );
            if(!confirm) return;

            showLoading(context);
            var re = await UserRepos().deleteById(data.id!);
            context.pop();
            if(re != null && re){
              context.pop(true);
            } else {
              showMessage(
                context: context,
                content: Singleton.instance.errorMsg,
              );
            }
          }
        },
        itemBuilder: (context) {
          return [
            PopupMenuItem(
              value: "edit",
              child: Row(
                children: [
                  Text(ASIconData.editUser, style: Style.txtFAS(size: 20, color: Style.primaryColor)),
                  const SizedBox(width: 10,),
                  Text("Edit", style: Style.txt16,),
                ],
              ),
            ),
            PopupMenuItem(
              value: "delete",
              child: Row(
                children: [
                  Text(ASIconData.removeUser, style: Style.txtFAS(size: 20, color: Colors.red)),
                  const SizedBox(width: 10,),
                  Text("Delete", style: Style.txt16,),
                ],
              ),
            ),
          ];
        },
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: ASIcon.solid(ASIconData.moreOptions, size: 16,),
        ),
      ),
    ],
    flexibleSpace: FlexibleSpaceBar(
      centerTitle: false,
      title: Text(data.fullName, style: pinnedTitle ? Style.txt18Bold : Style.txt18WhiteBold,),
      background: Stack(
        children: [
          Positioned.fill(
            child: CachedNetworkImage(
              imageUrl: data.profilePath,
              fit: BoxFit.cover,
              errorWidget: (context, _, __) => noProfileWidget(size: MediaQuery.sizeOf(context).width / 3, color: Colors.grey[300]),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                stops: [0, .7, .9],
                colors: [
                  Colors.transparent,
                  Colors.transparent,
                  Colors.black.withOpacity(.3),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ],
      ),
    ),
  );

  Widget get _buildInformation => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text("Information", style: Style.txt18Bold,),
      const SizedBox(height: 20,),
      Row(
        children: [
          SizedBox(
            width: 130,
            child: Text("User ID", style: Style.txt16,),
          ),
          const SizedBox(width: 10,),
          Text(":", style: Style.txt16,),
          const SizedBox(width: 10,),
          Expanded(child: Text(data.id.toString(), style: Style.txt16, textAlign: TextAlign.right,)),
        ],
      ),
      const SizedBox(height: 10,),
      Row(
        children: [
          SizedBox(
            width: 130,
            child: Text("Student ID", style: Style.txt16,),
          ),
          const SizedBox(width: 10,),
          Text(":", style: Style.txt16,),
          const SizedBox(width: 10,),
          Expanded(child: Text(data.stuId == null ? "Not provided" : data.stuId.toString(), style: Style.txt16, textAlign: TextAlign.right,)),
        ],
      ),
      const SizedBox(height: 10,),
      Row(
        children: [
          SizedBox(
            width: 130,
            child: Text("Phone Number", style: Style.txt16,),
          ),
          const SizedBox(width: 10,),
          Text(":", style: Style.txt16,),
          const SizedBox(width: 10,),
          Expanded(child: Text(data.phoneNumber == null ? "Not provided" : data.phoneNumber.toString(), style: Style.txt16, textAlign: TextAlign.right,)),
        ],
      ),
      const SizedBox(height: 10,),
      Row(
        children: [
          SizedBox(
            width: 130,
            child: Text("Email", style: Style.txt16,),
          ),
          const SizedBox(width: 10,),
          Text(":", style: Style.txt16,),
          const SizedBox(width: 10,),
          Expanded(child: Text(data.email.toString(), style: Style.txt16, textAlign: TextAlign.right,)),
        ],
      ),
      const SizedBox(height: 10,),
      Row(
        children: [
          SizedBox(
            width: 130,
            child: Text("Date of Birth", style: Style.txt16,),
          ),
          const SizedBox(width: 10,),
          Text(":", style: Style.txt16,),
          const SizedBox(width: 10,),
          Expanded(child: Text(data.dob == null ? "Not provided" : DateFormat('dd-MM-yyyy hh:mm a').format(data.dob!), style: Style.txt16, textAlign: TextAlign.right,)),
        ],
      ),
      const SizedBox(height: 10,),
      Row(
        children: [
          SizedBox(
            width: 130,
            child: Text("Registered Date", style: Style.txt16,),
          ),
          const SizedBox(width: 10,),
          Text(":", style: Style.txt16,),
          const SizedBox(width: 10,),
          Expanded(child: Text(DateFormat('dd-MM-yyyy hh:mm a').format(data.createdAt!), style: Style.txt16, textAlign: TextAlign.right,)),
        ],
      ),
      const SizedBox(height: 10,),
      Row(
        children: [
          SizedBox(
            width: 130,
            child: Text("Last Active", style: Style.txt16,),
          ),
          const SizedBox(width: 10,),
          Text(":", style: Style.txt16,),
          const SizedBox(width: 10,),
          Expanded(child: Text(DateFormat('dd-MM-yyyy hh:mm a').format(data.lastActive!), style: Style.txt16, textAlign: TextAlign.right,)),
        ],
      ),
    ],
  );

  Widget get _buildCourses => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text("Courses (${data.courses!.length})", style: Style.txt18Bold,),
      const SizedBox(height: 20,),
      (){
        if(data.courses!.isEmpty){
          return notFoundWidget();
        } else {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            padding: const EdgeInsets.only(right: 10),
            child: Row(
              children: List.generate(data.courses!.length, (index) {
                var item = data.courses![index];

                return Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      Style.defaultShadow,
                    ],
                  ),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: CachedNetworkImage(
                          imageUrl: "",
                          width: 150,
                          height: 150,
                          fit: BoxFit.cover,
                          errorWidget: (context, _, __) => noImageWidget(size: 70, color: Colors.grey[200]),
                        ),
                      ),
                      Text(item.subject!, style: Style.txt16,),
                    ],
                  ),
                );
              }),
            ),
          );
        }
      }(),
      const SizedBox(height: 10,),
      Row(
        children: [
          Expanded(
            child: primaryElevatedButton(
              onPressed: (){},
              child: Text("Enroll More Course", style: Style.txt16White,),
            ),
          ),
        ],
      ),
    ],
  );
}