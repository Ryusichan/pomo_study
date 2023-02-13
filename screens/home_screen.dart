import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                        '45:00',
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
                        icon: const Icon(Icons.play_circle_outline),
                        iconSize: 120,
                        onPressed: () => {},
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
                      children: const [
                        EndBox(
                            kindName: 'ROUNDED',
                            currentValue: 2,
                            totalValue: 4),
                        EndBox(
                            kindName: 'GOAL', currentValue: 1, totalValue: 4),
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