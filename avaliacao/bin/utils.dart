import 'package:intl/intl.dart';

class Utils {
  // implementar formatação de dataNascimento
  todayDate() {
    var now = new DateTime.now();
    var formatter = new DateFormat('dd-MM-yyyy');
    String formattedTime = DateFormat('kk:mm:a').format(now);
    String formattedDate = formatter.format(now);
    print(formattedTime);
    print(formattedDate);
  }
}
