import 'package:student_attendance/configs/data/remote.dart';
import 'package:student_attendance/features/dashboard/models/dashboard_model.dart';
import 'package:student_attendance/utils/singleton.dart';

class DashboardRepos {
  final RemoteDatabase _remote = RemoteDatabase();

  Future<DashboardModel?> get(Map<String, dynamic> where) async {
    await Singleton.instance.useUserToken();

    var res = await _remote.get('dashboard', where: where);
    if(res != null){
      return DashboardModel.fromJson(res);
    }
    return null;
  }
}