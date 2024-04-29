import 'package:flutter/material.dart';

class MustafaGG extends StatelessWidget {
  final List<Widget> listOne = [
    CircleAvatar(
      child: Text("1"),
    ),
    CircleAvatar(
      child: Text("2"),
    ),
    CircleAvatar(
      child: Text("3"),
    ),
  ];

  final List<Widget> listTwo = [
    CircleAvatar(
      child: Text("A"),
    ),
    CircleAvatar(
      child: Text("B"),
    ),
    CircleAvatar(
      child: Text("C"),
    ),
  ];

  GlobalKey selectedWidgetKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Draw Line between Widgets"),
        ),
        body: Column(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  listOne.length,
                      (index) => SelectableWidget(
                    child: listOne[index],
                    isSelected: index == 0,
                    selectedWidgetKey: selectedWidgetKey,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  listTwo.length,
                      (index) => SelectableWidget(
                    child: listTwo[index],
                    isSelected: false,
                    selectedWidgetKey: selectedWidgetKey,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: DrawLine(
                child: Stack(
                  children: [
                    PositionedWidget(
                      listOne: listOne,
                      listTwo: listTwo,
                      selectedWidgetKey: selectedWidgetKey,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SelectableWidget extends StatefulWidget {
  final Widget child;
  final bool isSelected;
  final GlobalKey selectedWidgetKey;

  SelectableWidget({
    required this.child,
    required this.isSelected,
    required this.selectedWidgetKey,
  });

  @override
  _SelectableWidgetState createState() => _SelectableWidgetState();
}

class _SelectableWidgetState extends State<SelectableWidget> {
  late bool isSelected;
  late GlobalKey selectedWidgetKey;

  @override
  void initState() {
    super.initState();
    isSelected = widget.isSelected;
    selectedWidgetKey = widget.selectedWidgetKey;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
        selectedWidgetKey = widget.selectedWidgetKey;
      },
      child: CircleAvatar(
        key: selectedWidgetKey,
        child: widget.child,
        backgroundColor: isSelected ? Colors.blue : Colors.transparent,
      ),
    );
  }
}

class DrawLine extends StatelessWidget {
  final Widget child;

  DrawLine({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
      ),
    );
  }
}

class PositionedWidget extends StatelessWidget {
  final List<Widget> listOne;
  final List<Widget> listTwo;
  final GlobalKey selectedWidgetKey;

  PositionedWidget({
    required this.listOne,
    required this.listTwo,
    required this.selectedWidgetKey,
  });

  @override
  Widget build(BuildContext context) {
    final selectedListOneIndex =
    listOne.indexWhere((element) => element.key == selectedWidgetKey);

    final selectedListTwoIndex =
    listTwo.indexWhere((element) => element.key == selectedWidgetKey);

    return CustomPaint(
      painter: LinePainter(
        selectedListOneIndex: selectedListOneIndex,
        selectedListTwoIndex: selectedListTwoIndex,
      ),
      child: Container(
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}

class LinePainter extends CustomPainter {
  final int selectedListOneIndex;
  final int selectedListTwoIndex;

  LinePainter({
    required this.selectedListOneIndex,
    required this.selectedListTwoIndex,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final double widgetWidth = size.width / 3;
    final double widgetHeight = size.height / 3;

    final Offset firstOffset = Offset(
      (selectedListOneIndex % 3) * widgetWidth + widgetWidth / 2,
      (selectedListOneIndex ~/ 3) * widgetHeight + widgetHeight / 2,
    );

    final Offset secondOffset = Offset(
      (selectedListTwoIndex % 3) * widgetWidth + widgetWidth / 2,
      (selectedListTwoIndex ~/ 3) * widgetHeight + widgetHeight / 2,
    );

    final paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 2;

    canvas.drawLine(firstOffset, secondOffset, paint);
  }

  @override
  bool shouldRepaint(LinePainter oldDelegate) => true;
}