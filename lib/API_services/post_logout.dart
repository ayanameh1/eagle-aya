import 'package:eagle/constants/colors.dart';
import 'package:http/http.dart' as http;

Future logout() async {
  final logoutresponse = await http.post(
    Uri.parse('http://localhost:8000/api/logout'),
    headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $responsedataToken",
      "Accept": "application/json",
      'Charset': 'utf-8',
    },
  );}