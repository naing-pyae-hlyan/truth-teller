import '../../lib_exp.dart';

class Wheel<T> extends StatefulWidget {
  final WheelCtrl<T> controller;
  final List<WheelModel<T>> children;
  final int turnsPerSecond;
  final int rotationTimeLowerBound;
  final int rotationTimeUpperBound;
  const Wheel({
    required this.controller,
    required this.children,
    this.turnsPerSecond = 18,
    this.rotationTimeLowerBound = 2000,
    this.rotationTimeUpperBound = 4000,
    super.key,
  }) : assert(children.length > 1,
            'List with at least two elements must be given');

  @override
  State<Wheel> createState() => _WheelState();
}

class _WheelState extends State<Wheel> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late double size;

  void _initAnimation() {
    _animationController = AnimationController(
      vsync: this,
      lowerBound: 0,
      upperBound: double.infinity,
    );
    _animationController.value = (0.5 / (widget.children.length));

    _animationController.addListener(() {
      widget.controller.setValue(widget.children[
          ((widget.children.length) * (_animationController.value % 1))
              .floor()]);
    });

    if (_animationController.isCompleted) {
      widget.controller.animationFinished();
    }
  }

  void _initiateControllerSubscription() {
    widget.controller.addListener(() {
      if (!widget.controller.shouldStartAnimation ||
          widget.controller.isAnimating) return;
      _startAnimation();
    });
  }

  void _startAnimation() {
    widget.controller.animationStarted();

    int milliseconds = Random().nextInt(widget.rotationTimeLowerBound) +
        (widget.rotationTimeUpperBound - widget.rotationTimeLowerBound);

    double rotateDistance = milliseconds / 1000 * widget.turnsPerSecond;

    _animationController.value = _animationController.value % 1;

    _animationController.duration =
        Duration(milliseconds: milliseconds.toInt());

    _animationController.animateTo(_animationController.value + rotateDistance,
        curve: Curves.easeInOut);
  }

  @override
  void initState() {
    _initAnimation();
    _initiateControllerSubscription();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, BoxConstraints constraints) {
        size = min(constraints.maxHeight, constraints.maxHeight);

        return SizedBox(
          width: size,
          height: size,
          child: Stack(
            children: <Widget>[
              _getSlices(),
              _getCircleOutline(),
              _getIndicator()
            ],
          ),
        );
      },
    );
  }

  Widget _getSlices() {
    double fourthCircleAngle = pi / 2;
    double pieceAngle = pi * 2 / widget.children.length;

    return Stack(
      children: [
        for (int index = 0; index < widget.children.length; index++)
          Transform.rotate(
            angle: (-fourthCircleAngle) - (pieceAngle / 2),
            child: WheelSlice(
              index: index,
              size: size,
              children: widget.children,
            ),
          ),
      ],
    );
  }

  CustomPaint _getCircleOutline() {
    return CustomPaint(
      painter: WheelOutlinePainter(),
      size: Size(size, size),
    );
  }

  WheelResultIndicator _getIndicator() => WheelResultIndicator(
      wheelSize: size,
      animationController: _animationController,
      childCount: widget.children.length);
}
