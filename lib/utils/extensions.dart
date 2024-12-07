import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:student_attendance/features/schedules/models/schedule.dart';

import '../configs/data/domain.dart';
import '../features/users/models/user_model.dart';
import 'utils.dart';

extension UserModelExtension on UserModel {
  Widget avatar({
    double size = 50,
  }) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        border: Border.all(
          color: Colors.grey[200]!,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(size),
        child: CachedNetworkImage(
          imageUrl: profilePath,
          fit: BoxFit.cover,
          errorWidget: (_,__,___) => noProfileWidget(size: size / 2),
        ),
      ),
    );
  }

  String get fullName => "$firstName $lastName";

  String get profilePath => "${Domain.fileUrl}/users/profile/$id.png";
}

extension TimeOfDayExt on TimeOfDay {
  String get tohhmm {
    return DateFormat("hh:mm").format(DateTime(0, 0, 0, hour, minute));
  }

  String get tohhmma {
    return DateFormat("hh:mm a").format(DateTime(0, 0, 0, hour, minute));
  }

  /// 1: it is after other
  /// 0: equal
  /// -1: it is before other
  int compareTo(TimeOfDay other) {
    if (hour < other.hour) {
      return -1;
    } else if (hour > other.hour) {
      return 1;
    } else {
      // If hours are the same, compare minutes
      if (minute < other.minute) {
        return -1;
      } else if (minute > other.minute) {
        return 1;
      } else {
        return 0;
      }
    }
  }
}

extension StringExt on String {
  TimeOfDay toTimeOfDay() {
    final parts = split(':');
    final hour = int.parse(parts[0]);
    final minute = int.parse(parts[1]);
    return TimeOfDay(hour: hour, minute: minute);
  }

  String get toCapitalized => substring(0,1).toString().toUpperCase() + substring(1);
}

extension ScheduleExt on ScheduleModel {
}