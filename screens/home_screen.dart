import 'dart:async';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const twentyFiveMinutes = 1500;
  int totalSeconds = twentyFiveMinutes;
  bool isRunning = false;
  // late사용: 당장초기화하지 않아도되는 값을 만들기위해
  late Timer timer;
  int goal = 0;

  void onTick(Timer timer) {
    if (totalSeconds == 0) {
      setState(() {
        totalSeconds = twentyFiveMinutes;
        isRunning = false;
        goal += 1;
      });
      timer.cancel();
    } else {
      setState(() {
        totalSeconds = totalSeconds - 1;
      });
    }
  }

  void onStartPressed() {
    // onTick을 지금 실행하지 않을거기때문에 onTick()이렇게 사용하지 않는다
    timer = Timer.periodic(const Duration(seconds: 1), onTick);

    setState(() {
      isRunning = true;
    });
  }

  void onPausePressed() {
    timer.cancel();
    setState(() {
      isRunning = false;
    });
  }

  String format(int seconds) {
    var duration = Duration(seconds: seconds);
    var forMatting = duration.toString().split('.').first.substring(2, 7);
    return forMatting;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Column(
          children: [
            Flexible(
                flex: 1,
                child: Container(
                  decoration: const BoxDecoration(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        format(totalSeconds),
                        style: TextStyle(
                          color: Theme.of(context).cardColor,
                          fontSize: 88,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                )),
            Flexible(
                flex: 2,
                child: Container(
                  decoration: const BoxDecoration(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: isRunning
                            ? const Icon(Icons.pause_circle_outlined)
                            : const Icon(Icons.play_circle_outline),
                        iconSize: 120,
                        onPressed: isRunning ? onPausePressed : onStartPressed,
                        color: Theme.of(context).cardColor,
                      )
                    ],
                  ),
                )),
            Flexible(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(50)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const EndBox(
                            kindName: 'ROUNDED',
                            currentValue: 2,
                            totalValue: 4),
                        EndBox(
                            kindName: 'GOAL',
                            currentValue: goal,
                            totalValue: 4),
                      ],
                    ),
                  ),
                )),
          ],
        ));
  }
}

class EndBox extends StatelessWidget {
  final String kindName;
  final int currentValue, totalValue;

  const EndBox(
      {Key? key,
      required this.kindName,
      required this.currentValue,
      required this.totalValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          kindName,
          style: TextStyle(
            color: Theme.of(context).textTheme.headline1?.color,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '$currentValue',
              style: TextStyle(
                color: Theme.of(context).textTheme.headline1?.color,
                fontSize: 36,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              '/$totalValue',
              style: TextStyle(
                color: Theme.of(context).textTheme.headline1?.color,
                fontSize: 20,
              ),
            ),
          ],
        )
      ],
    );
  }
}
