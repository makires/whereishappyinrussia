import 'package:flutter/material.dart';

class NoCitiesWidget extends StatelessWidget {
  const NoCitiesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                  text:
                      'Такого города нет. Возможно это поселок или что-то другое. ',
                  style: TextStyle(fontSize: 18),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Мы работаем только с городами.',
                      style: TextStyle(fontSize: 18),
                    )
                  ])),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                  text: 'Либо вы забыли про букву ',
                  style: TextStyle(fontSize: 18),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'ё',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    TextSpan(
                      text: ': )',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    )
                  ])),
        ),
      ],
    );
  }
}
