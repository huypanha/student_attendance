import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:student_attendance/features/courses/models/course_model.dart';
import 'package:student_attendance/utils/utils.dart';

class ViewCourseDetails extends StatefulWidget {
  final CourseModel data;

  const ViewCourseDetails({
    super.key,
    required this.data,
  });

  static String routeName = "/view_course_details";

  @override
  State<ViewCourseDetails> createState() => _ViewCourseDetailsState();
}

class _ViewCourseDetailsState extends State<ViewCourseDetails> {
  var scrollCon = ScrollController();
  var pinnedTitle = false;

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
      body: CustomScrollView(
        controller: scrollCon,
        slivers: [
          SliverAppBar(
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
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: false,
              title: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.data.courseName ?? "", style: pinnedTitle ? Style.txt18Bold : Style.txt18WhiteBold,),
                  Text("${widget.data.teacher!.fistName} ${widget.data.teacher!.lastName}", style: pinnedTitle ? Style.txt12 : Style.txt12White,),
                ],
              ),
              background: Stack(
                children: [
                  Positioned.fill(
                    child: CachedNetworkImage(
                      imageUrl: widget.data.img ?? "",
                      fit: BoxFit.cover,
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
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.data.description ?? "", style: Style.txt16, textAlign: TextAlign.justify,),
                  // const SizedBox(height: 20,),
                  // Text("Schedule", style: Style.txt16Bold,),
                  const SizedBox(height: 20,),
                  Text("Enrolled Students", style: Style.txt16Bold,),
                  const SizedBox(height: 10,),
                  (){
                    if(widget.data.students == null || widget.data.students!.isEmpty){
                      return notFoundWidget();
                    }
                    return ListView.builder(
                      itemCount: widget.data.students!.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        var item = widget.data.students![index];
                        return Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Row(
                            children: [
                              item.avatar(size: 50),
                              const SizedBox(width: 10,),
                              Text("${item.fistName} ${item.lastName}", style: Style.txt16,),
                            ],
                          ),
                        );
                      },
                    );
                  }(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}