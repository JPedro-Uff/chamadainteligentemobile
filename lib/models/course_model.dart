import 'package:http/http.dart' as http;
import '../services/chamadainteligente_api.dart';

class CourseModel {
  late int id;
  late String teacherId;
  late String subjectId;
  late String semester;
  String? subjectName;
  late String courseId;



  getTeacherName()async{
    String teacherName;
    var res = await http.get(
      Uri(
          scheme: ChamadaInteligenteAPI.scheme,
          host: ChamadaInteligenteAPI.host,
          path: '${ChamadaInteligenteAPI.path}/teacher/$teacherId',
          port: ChamadaInteligenteAPI.port
      ),
      headers: {'Content-Type': 'application/json'}
    );
    teacherName = res.body;
    return teacherName;
  }

  getCourseName() async {
    var res = await http.get(
        Uri(
            scheme: ChamadaInteligenteAPI.scheme,
            host: ChamadaInteligenteAPI.host,
            path: '${ChamadaInteligenteAPI.path}/subjects/$subjectId',
            port: ChamadaInteligenteAPI.port
        ),
        headers: {'Content-Type': 'application/json'}
    );
    subjectName = res.body;
  }

  CourseModel(Map<String, dynamic> json) {
    id = json["id"];
    teacherId = json["teacher_id"];
    subjectId = json["subject_id"];
    semester = json["semester"];
    courseId = json["course_id"];
  }
}