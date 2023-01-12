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

Color parsePlayModeToColor(int index) {
  if (index == PlayMode.alcholic.index) {
    return primaryColor;
  } else if (index == PlayMode.friends.index) {
    return Colors.indigo;
  } else if (index == PlayMode.flirt.index) {
    return Colors.purple;
  } else if (index == PlayMode.couple.index) {
    return Colors.pink;
  } else {
    return Colors.transparent;
  }
}

class PlayModeModel {
  PlayMode mode;
  bool selected;
  PlayModeModel({required this.mode, required this.selected});
}
