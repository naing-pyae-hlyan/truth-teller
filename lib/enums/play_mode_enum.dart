import '../lib_exp.dart';

enum PlayMode {
  alcholic, // ဗရုတ်သုခ
  friends, // ဗရုတ်သုခ
  flirt, // ရည်းစားဖြစ်အောင်လုပ်ပေးရမယ်
  couple, // ရန်သတ်/ပြတ်
}

String parsePlayModeLabel(PlayMode mode) {
  switch (mode) {
    case PlayMode.alcholic:
      return 'အရက်သမားများ';
    case PlayMode.friends:
      return 'ဘော်ဒါများ';
    case PlayMode.flirt:
      return 'အီစီကလီ';
    case PlayMode.couple:
      return 'စောင်အတွဲ';
  }
}

Color parsePlayModeToColor(dynamic index) {
  Color color = Colors.transparent;
  if (index == PlayMode.alcholic.index || index == PlayMode.alcholic) {
    color = primaryColor;
  }
  if (index == PlayMode.friends.index || index == PlayMode.friends) {
    color = Colors.indigo;
  }
  if (index == PlayMode.flirt.index || index == PlayMode.flirt) {
    color = Colors.purple;
  }
  if (index == PlayMode.couple.index || index == PlayMode.couple) {
    color = Colors.pink;
  }
  return color;
}

class PlayModeModel {
  PlayMode mode;
  bool selected;
  PlayModeModel({required this.mode, required this.selected});
}
