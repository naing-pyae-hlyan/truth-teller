import '../../lib_exp.dart';

class MyListTile extends StatelessWidget {
  final EdgeInsetsGeometry? margin;
  final DataModel? dataModel;
  final UserModel? userModel;
  final Color? titleColor;
  final Widget? subTitle;
  final Widget? trailing;
  final Color? backgroundColor;
  final Function() onRemove;
  final Widget? leading;
  const MyListTile({
    this.margin,
    this.dataModel,
    this.userModel,
    this.titleColor,
    this.subTitle,
    this.leading,
    this.trailing,
    this.backgroundColor,
    required this.onRemove,
    super.key,
  });

  String get _getTitle {
    if (userModel != null) {
      return userModel!.playerName;
    } else if (dataModel != null) {
      return dataModel!.text;
    } else {
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? const EdgeInsets.only(top: 8),
      child: ListTile(
        title: myText(
          _getTitle,
          color: titleColor ?? primaryColor,
          fontSize: 14,
          maxLine: 10,
        ),
        leading: leading,
        subtitle: subTitle ?? _dareOrTruthSubtitle(),
        trailing: trailing ?? _traling(),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        tileColor: (backgroundColor ?? secondaryColor).withOpacity(0.1),
      ),
    );
  }

  Widget? _dareOrTruthSubtitle() {
    if (dataModel == null) return null;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(
        dataModel!.modes.length,
        (index) => Container(
          width: 8,
          height: 8,
          margin: const EdgeInsets.only(top: 16, right: 4),
          child: CircleAvatar(
            backgroundColor: parsePlayModeToColor(dataModel!.modes[index]),
          ),
        ),
      ),
    );
  }

  Widget _traling() => Clickable(
        onTap: onRemove,
        child: const Icon(
          Icons.close,
          size: 18,
          color: primaryColor,
        ),
      );
}
