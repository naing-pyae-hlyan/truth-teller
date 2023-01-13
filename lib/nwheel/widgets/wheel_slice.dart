import '../../lib_exp.dart';

class WheelSlice extends StatelessWidget {
  final int index;
  final double size;
  final List<WheelModel> children;
  const WheelSlice({
    required this.index,
    required this.size,
    required this.children,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    int childCount = children.length;
    double pieceAngle = (index / childCount * pi * 2);
    double pieceWidth =
        childCount == 2 ? size : sin(pi / childCount) * size / 2;
    double pieceHeight = size / 2;

    return Stack(
      children: <Widget>[
        _getSliceBackground(pieceAngle, childCount),
        _getSliceForeground(pieceAngle, pieceWidth, pieceHeight)
      ],
    );
  }

  Widget _getSliceForeground(
      double pieceAngle, double pieceWidth, double pieceHeight) {
    double centerOffset = (pi / children.length);
    double leftRotationOffset = (-pi / 2);

    return Transform.rotate(
      angle: leftRotationOffset + pieceAngle + centerOffset,
      alignment: Alignment.center,
      child: Stack(
        children: [
          Positioned(
              top: size / 2,
              left: size / 2 - pieceWidth / 2,
              child: Container(
                padding: EdgeInsets.all(size / children.length / 4),
                height: pieceHeight,
                width: pieceWidth,
                child: FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.center,
                    child: Transform.rotate(
                        angle: -pieceAngle - leftRotationOffset * 2,
                        child: children[index].foreground)),
              )),
        ],
      ),
    );
  }

  Transform _getSliceBackground(double pieceAngle, int childCount) {
    return Transform.rotate(
      angle: pieceAngle,
      alignment: Alignment.center,
      child: Stack(
        children: [
          Container(
            width: size,
            height: size,
            child: CustomPaint(
              painter: WheelSlicePainter(
                divider: childCount,
                number: index,
                color: children[index].backgroundColor,
              ),
              size: Size(size, size),
            ),
          ),
        ],
      ),
    );
  }
}
