import '../lib_exp.dart';

void doAfterBuild({
  required Function() callback,
  Duration duration = Duration.zero,
}) =>
    Future.delayed(duration, callback);

// void showToast(String msg) => Fluttertoast.showToast(
//       msg: msg,
//       toastLength: Toast.LENGTH_LONG,
//       gravity: ToastGravity.CENTER,
//       timeInSecForIosWeb: 1,
//       fontSize: 13,
//     );

void showToast(String msg) => fToast.showToast(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 32),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: thirdaryColor.withOpacity(0.1),
        ),
        child: myText(
          msg,
          maxLine: 5,
          color: primaryColor,
        ),
      ),
      gravity: ToastGravity.CENTER,
      toastDuration: const Duration(seconds: 2),
    );
