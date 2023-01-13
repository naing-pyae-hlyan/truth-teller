import '../../lib_exp.dart';

Widget get emptyUI => const SizedBox.shrink();

const horizontalWidth4 = SizedBox(width: 4);
const horizontalWidth8 = SizedBox(width: 8);
const horizontalWidth12 = SizedBox(width: 12);
const horizontalWidth16 = SizedBox(width: 16);
const horizontalWidth24 = SizedBox(width: 24);
const horizontalWidth28 = SizedBox(width: 28);
const horizontalWidth32 = SizedBox(width: 32);
const horizontalWidth48 = SizedBox(width: 48);
const horizontalWidth64 = SizedBox(width: 64);

const verticalHeight4 = SizedBox(height: 4);
const verticalHeight8 = SizedBox(height: 8);
const verticalHeight12 = SizedBox(height: 12);
const verticalHeight16 = SizedBox(height: 16);
const verticalHeight24 = SizedBox(height: 24);
const verticalHeight28 = SizedBox(height: 28);
const verticalHeight32 = SizedBox(height: 32);
const verticalHeight48 = SizedBox(height: 48);
const verticalHeight64 = SizedBox(height: 64);

// ignore: non_constant_identifier_names
Widget MyImageScaffold({
  AppBar? appBar,
  required Widget body,
  bool extendBodyBehindAppBar = false,
  String bgAssetImage = 'assets/images/bg_image.png',
}) =>
    SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: extendBodyBehindAppBar,
        appBar: appBar,
        body: Stack(
          children: <Widget>[
            Image.asset(
              bgAssetImage,
              color: secondaryColor,
              fit: BoxFit.cover,
              width: double.maxFinite,
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: body,
            ),
          ],
        ),
      ),
    );

AppBar myAppBar(
  BuildContext context, {
  String? title,
  bool automaticallyImplyLeading = false,
  bool centerTitle = false,
  Color backgroundColor = Colors.transparent,
  double elevation = 0.0,
  Color arrowColor = primaryColor,
  Function()? onBackPress,
  List<Widget>? actions,
  bool addCloseButton = false,
  dynamic result,
}) =>
    AppBar(
      automaticallyImplyLeading: automaticallyImplyLeading,
      centerTitle: centerTitle,
      leading: automaticallyImplyLeading
          ? IconButton(
              icon: Icon(
                Icons.close,
                color: arrowColor,
              ),
              onPressed: onBackPress ?? () => context.pop(result: result),
            )
          : emptyUI,
      title: title == null
          ? emptyUI
          : myText(
              title,
              fontSize: 16,
              fontWeight: FontWeight.w900,
            ),
      actions: actions ??
          [
            addCloseButton
                ? IconButton(
                    onPressed: () => context.pop(result: result),
                    icon: const Icon(
                      Icons.close,
                      color: primaryColor,
                    ),
                  )
                : emptyUI,
          ],
      backgroundColor: backgroundColor,
      elevation: elevation,
    );

Widget backToHomeButton(
  BuildContext context, {
  Function()? onTap,
  dynamic result,
}) =>
    MyButton(
      onTap: onTap ?? () => context.pop(result: result),
      label: 'Back To Home',
      leading: const Icon(
        Icons.arrow_back_ios,
        color: Colors.white,
        size: 18,
      ),
      width: context.screenWidth * 0.7 - 24,
      borderRadius: BorderRadius.circular(8),
      padding: const EdgeInsets.all(16),
    );
