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
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: body,
            ),
          ],
        ),
      ),
    );

Widget roundedBorder({
  required Widget child,
  double borderRadius = 128,
  Color borderColor = primaryColor,
  double padding = 4,
}) =>
    Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor,
        ),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      padding: EdgeInsets.all(padding),
      child: child,
    );
