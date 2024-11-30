import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:iglu_color_picker_flutter/iglu_color_picker_flutter.dart';
import 'package:intl/intl.dart';
import 'package:student_attendance/features/schedules/models/schedule.dart';
import 'package:student_attendance/utils/utils.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../courses/models/course_model.dart';
import '../../users/models/user_model.dart';
import '../src/schedule_datasource.dart';

class ScheduleView extends StatefulWidget {
  const ScheduleView({super.key});

  static String routeName = "/schedules";

  @override
  State<ScheduleView> createState() => _ScheduleViewState();
}

class _ScheduleViewState extends State<ScheduleView> {
  List<ScheduleModel> schedules = [];
  List<CourseModel> courses = [
    CourseModel(
      id: 1,
      courseName: "Flutter",
      img: "https://w7.pngwing.com/pngs/67/315/png-transparent-flutter-hd-logo-thumbnail.png",
    ),
    CourseModel(
      id: 1,
      courseName: "Python",
      img: "https://banner2.cleanpng.com/20190623/yp/kisspng-python-computer-icons-programming-language-executa-1713885634631.webp",
    ),
  ];

  @override
  void initState() {
    super.initState();
  }

  Widget get _buildCourses => SfCalendar(
    view: CalendarView.week,
    dataSource: ScheduleDataSource(schedules),
    onTap: onScheduleClicked,
  );

  Future onScheduleClicked(CalendarTapDetails d) async {
    bool isUpdate = d.appointments != null;
    var data = isUpdate ? (d.appointments!.first as ScheduleModel) : null;

    CourseModel? selectedCourse;
    DateTime? selectedStartTime, selectedEndTime;
    Color selectedColor = Colors.blue;
    CalendarRepeatType selectedRepeatType = CalendarRepeatType.none;
    DateTime repeatUntilDate = DateTime.now().add(const Duration(days: 365));
    List<int> selectedRepeatWeekDays = [];
    Map<String, String> weekDays = {
      "Monday": "M", // 1
      "Tuesday": "T", // 2
      "Wednesday": "W", // 3
      "Thursday": "T", // 4
      "Friday": "F", // 5
      "Saturday": "S", // 6
      "Sunday": "S", // 7
    };

    if(isUpdate) {
      selectedCourse = data!.course;
      selectedStartTime = data.startTime;
      selectedEndTime = data.endTime;
      selectedColor = Color(data.colorCode!);
    } else {
      selectedStartTime = d.date;
      selectedEndTime = d.date!.add(const Duration(hours: 1));
    }

    showCupertinoDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) {
          return LayoutBuilder(
            builder: (context, constraints) {
              return AlertDialog(
                scrollable: true,
                backgroundColor: Colors.white,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(isUpdate ? data!.course!.courseName.toString() : "Create Schedule", style: Style.txt20Bold,),
                    const SizedBox(width: 10,),
                    if(isUpdate)
                    IconButton(
                      onPressed: (){
                        if(selectedRepeatType == CalendarRepeatType.daily){
                          schedules.removeWhere((e) => e.startTime!.difference(data!.startTime!).inDays >= 0 &&
                          e.course!.id == data.course!.id &&
                          DateFormat("hh:mm a").format(e.startTime!) == DateFormat("hh:mm a").format(data.startTime!) &&
                          DateFormat("hh:mm a").format(e.endTime!) == DateFormat("hh:mm a").format(data.endTime!));
                        } else if(selectedRepeatType == CalendarRepeatType.weekly){
                          var toDelete = [...schedules.where((e) => e.startTime!.difference(data!.startTime!).inDays >= 0 &&
                          e.course!.id == data.course!.id &&
                          DateFormat("hh:mm a").format(e.startTime!) == DateFormat("hh:mm a").format(data.startTime!) &&
                          DateFormat("hh:mm a").format(e.endTime!) == DateFormat("hh:mm a").format(data.endTime!))];
                          for(var i in toDelete){
                            if(selectedRepeatWeekDays.contains(i.startTime!.weekday)){
                              schedules.removeWhere((e) => e.id == i.id);
                            }
                          }
                        } else {
                          schedules.removeWhere((e) => e.id == data!.id);
                        }
                        setState(() {});
                        context.pop();
                      },
                      icon: ASIcon.solid(ASIconData.trashXMark, color: Colors.red,),
                    ),
                  ],
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Course", style: Style.txt16,),
                    const SizedBox(height: 10,),
                    DropdownButtonHideUnderline(
                      child: DropdownButtonFormField<CourseModel>(
                        value: selectedCourse,
                        validator: (v){
                          if(selectedCourse == null){
                            return "msg.Required";
                          }
                          return null;
                        },
                        hint: Text("Select a course", style: Style.txt16Grey,),
                        selectedItemBuilder: (context) => List.generate(courses.length, (index) => DropdownMenuItem(
                          value: courses[index],
                          child: Text(courses[index].courseName.toString(), style: Style.txt16,),
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
                        items: List.generate(courses.length, (index) => DropdownMenuItem(
                          value: courses[index],
                          child: Row(
                            children: [
                              ClipOval(
                                child: CachedNetworkImage(
                                  imageUrl: courses[index].img!,
                                  width: 50,
                                  height: 50,
                                ),
                              ),
                              const SizedBox(width: 10,),
                              Text(courses[index].courseName.toString(), style: Style.txt16,),
                            ],
                          ),
                        )),
                        onChanged: (v) async {
                          setDialogState((){
                            selectedCourse = v;
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Start Time", style: Style.txt16,),
                              const SizedBox(height: 10,),
                              Row(
                                children: [
                                  Expanded(
                                    child: GestureDetector(
                                      behavior: HitTestBehavior.translucent,
                                      onTap: () async {
                                        selectedStartTime ??= DateTime.now();
                                        var newDate = await showDatePicker(
                                          context: context,
                                          firstDate: DateTime(2024),
                                          lastDate: DateTime(2500),
                                          initialDate: selectedStartTime,
                                        );
                                        if(newDate != null){
                                          selectedStartTime = selectedStartTime!.copyWith(
                                            year: newDate.year,
                                            month: newDate.month,
                                            day: newDate.day,
                                          );
                                          var time = await showTimePicker(
                                            context: context,
                                            initialTime: TimeOfDay(hour: selectedStartTime!.hour, minute: selectedStartTime!.minute),
                                          );
                                          if(time != null){
                                            selectedStartTime = selectedStartTime!.copyWith(
                                              hour: time.hour,
                                              minute: time.minute
                                            );
                                          }
                                        }
                                        setDialogState((){});
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.grey[200]!,
                                          borderRadius: BorderRadius.circular(10),
                                          border: Border.all(
                                            color: Colors.grey[100]!,
                                          ),
                                        ),
                                        padding: EdgeInsets.all(10),
                                        child: Text(selectedStartTime != null ? DateFormat("dd-MM-yyyy hh:mm a").format(selectedStartTime!) : "Select Start Time", style: Style.txt16,),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10,),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("End Time", style: Style.txt16,),
                              const SizedBox(height: 10,),
                              Row(
                                children: [
                                  Expanded(
                                    child: GestureDetector(
                                      behavior: HitTestBehavior.translucent,
                                      onTap: () async {
                                        selectedEndTime ??= DateTime.now();
                                        var newDate = await showDatePicker(
                                          context: context,
                                          firstDate: DateTime(2024),
                                          lastDate: DateTime(2500),
                                          initialDate: selectedEndTime,
                                        );

                                        if(newDate != null){
                                          selectedEndTime = selectedEndTime!.copyWith(
                                            year: newDate.year,
                                            month: newDate.month,
                                            day: newDate.day,
                                          );

                                          var time = await showTimePicker(
                                            context: context,
                                            initialTime: TimeOfDay(hour: selectedEndTime!.hour, minute: selectedEndTime!.minute),
                                          );
                                          if(time != null){
                                            selectedEndTime = selectedEndTime!.copyWith(
                                              hour: time.hour,
                                              minute: time.minute
                                            );
                                          }
                                        }
                                        setDialogState((){});
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.grey[200]!,
                                          borderRadius: BorderRadius.circular(10),
                                          border: Border.all(
                                            color: Colors.grey[100]!,
                                          ),
                                        ),
                                        padding: EdgeInsets.all(10),
                                        child: Text(selectedEndTime != null ? DateFormat("dd-MM-yyyy hh:mm a").format(selectedEndTime!) : "Select End Time", style: Style.txt16,),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20,),
                    Text("Repeat", style: Style.txt16,),
                    const SizedBox(height: 10,),
                    DropdownButtonHideUnderline(
                      child: DropdownButtonFormField<CalendarRepeatType>(
                        value: selectedRepeatType,
                        selectedItemBuilder: (context) => List.generate(CalendarRepeatType.values.length, (index) => DropdownMenuItem(
                          value: CalendarRepeatType.values[index],
                          child: Text(CalendarRepeatType.values[index].name[0].toUpperCase() + CalendarRepeatType.values[index].name.substring(1).toLowerCase(), style: Style.txt16,),
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
                        items: List.generate(CalendarRepeatType.values.length, (index) => DropdownMenuItem(
                          value: CalendarRepeatType.values[index],
                          child: Text(CalendarRepeatType.values[index].name[0].toUpperCase() + CalendarRepeatType.values[index].name.substring(1).toLowerCase(), style: Style.txt16,),
                        )),
                        onChanged: (v) async {
                          setDialogState((){
                            selectedRepeatType = v!;
                          });
                        },
                      ),
                    ),
                    if(selectedRepeatType == CalendarRepeatType.weekly)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20,),
                          Text("Repeat On", style: Style.txt16,),
                          const SizedBox(height: 10,),
                          Wrap(
                            children: List.generate(weekDays.length, (index) => ChoiceChip(
                              label: Text(weekDays.values.toList()[index], style: selectedRepeatWeekDays.contains(index + 1) ? Style.txt14White : Style.txt14Black,),
                              tooltip: weekDays.keys.toList()[index],
                              selected: selectedRepeatWeekDays.contains(index + 1),
                              side: BorderSide(
                                color: Colors.grey[200]!,
                              ),
                              showCheckmark: false,
                              backgroundColor: Colors.grey[200],
                              selectedColor: Style.primaryColor,
                              onSelected: (v){
                                if(v){
                                  selectedRepeatWeekDays.add(index + 1);
                                } else {
                                  selectedRepeatWeekDays.remove(index + 1);
                                }
                                setDialogState((){});
                              },
                            )),
                          ),
                        ],
                      ),
                    if(selectedRepeatType != CalendarRepeatType.none)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20,),
                          Text("Repeat Until", style: Style.txt16,),
                          const SizedBox(height: 10,),
                          Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  behavior: HitTestBehavior.translucent,
                                  onTap: () async {
                                    var date = await showDatePicker(
                                      context: context,
                                      firstDate: DateTime(2024),
                                      lastDate: DateTime(2500),
                                      initialDate: repeatUntilDate,
                                    );
                                    if(date != null){
                                      repeatUntilDate = date;
                                    }
                                    setDialogState((){});
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200]!,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: Colors.grey[100]!,
                                      ),
                                    ),
                                    padding: EdgeInsets.all(10),
                                    alignment: Alignment.center,
                                    child: Text(DateFormat("dd-MM-yyyy").format(repeatUntilDate), style: Style.txt16,),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    const SizedBox(height: 20,),
                    Text("Color", style: Style.txt16,),
                    const SizedBox(height: 10,),
                    SizedBox(
                      height: 210,
                      width: constraints.maxWidth,
                      child: IGSlidePicker(
                        currentColor: selectedColor,
                        showColorIndicator: true,
                        enableAlpha: false,
                        showSliderParams: false,
                        onColorChanged: (v) {
                          selectedColor = v;
                        },
                        colorDetailsLabelTypes: [],
                        colorDetailsWidget: (_, __, ___, ____) => const SizedBox(),
                        colorIndicatorHeight: 50,
                        colorIndicatorBorderColor: Colors.grey[200],
                        sliderBorderWidth: 1,
                        sliderBorderColor: Colors.grey[200],
                      ),
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () => context.pop(),
                    child: Text("Cancel"),
                  ),
                  primaryTextButton(
                    onPressed: () {
                      if(isUpdate){
                        var toUpdateItems = [...schedules.where((e) => e.course!.id == data!.course!.id &&
                            DateFormat("HH:mm").format(e.startTime!) == DateFormat("HH:mm").format(data.startTime!) &&
                            DateFormat("HH:mm").format(e.endTime!) == DateFormat("HH:mm").format(data.endTime!) &&
                            e.startTime!.difference(data.startTime!).inDays >= 0
                        )];

                        for(int i = 0; i < toUpdateItems.length; i++){
                          schedules[schedules.indexWhere((e) => e.id == toUpdateItems[i].id)] = toUpdateItems[i].copyWith(
                            course: selectedCourse,
                            startTime: selectedStartTime!.add(Duration(days: i)),
                            endTime: selectedEndTime!.add(Duration(days: i)),
                            colorCode: int.parse("0x${selectedColor.toHexString()}"),
                            createdDate: DateTime.now(),
                            createdBy: UserModel(),
                          );
                        }

                        setState(() {});
                        context.pop();

                        return;
                      }

                      // create
                      var newSchedule = ScheduleModel(
                        id: schedules.length + 1,
                        startTime: selectedStartTime,
                        endTime: selectedEndTime,
                        course: selectedCourse,
                        colorCode: int.parse("0x${selectedColor.toHexString()}"),
                        createdBy: UserModel(),
                        createdDate: DateTime.now(),
                      );
                      schedules.add(newSchedule);

                      // repeat
                      if(selectedRepeatType == CalendarRepeatType.daily){
                        for(var i = 0; i <= repeatUntilDate.difference(selectedStartTime!).inDays; i++){
                          schedules.add(newSchedule.copyWith(
                            id: schedules.length + 1,
                            startTime: selectedStartTime!.add(Duration(days: i + 1)),
                            endTime: selectedEndTime!.add(Duration(days: i + 1)),
                          ));
                        }
                      } else if(selectedRepeatType == CalendarRepeatType.weekly){
                        for(var i = 0; i <= repeatUntilDate.difference(selectedStartTime!).inDays; i++){
                          if(selectedRepeatWeekDays.contains(selectedStartTime!.add(Duration(days: i + 1)).weekday)){
                            schedules.add(newSchedule.copyWith(
                              id: schedules.length + 1,
                              startTime: selectedStartTime!.add(Duration(days: i + 1)),
                              endTime: selectedEndTime!.add(Duration(days: i + 1)),
                            ));
                          }
                        }
                      }
                      setState(() {});
                      context.pop();
                    },
                    child: Text(isUpdate ? "Update" : "Create"),
                  ),
                ],
              );
            }
          );
        }
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
        ),
        title: Text("Schedule", style: Style.txt20Bold,),
      ),
      body: _buildCourses,
    );
  }
}