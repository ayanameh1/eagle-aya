import 'package:eagle/constants/colors.dart';
import 'package:http/http.dart' as http;

Future<http.Response?> logout() async {
  http.Response? logoutresponse;
  print("Bearer $responsedataToken");
  try{
  final logoutresponse = await http.post(
    Uri.parse('http://192.168.108.51:8000/api/logout'),
    headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $responsedataToken",
      "Accept": "application/json",
      'Charset': 'utf-8',
    },
  );
  if (logoutresponse.statusCode == 200 || logoutresponse.statusCode == 201) {
    print('done');
    return logoutresponse;
  }}
  catch (e) {
    print(e.toString());
  }
  return logoutresponse;
}