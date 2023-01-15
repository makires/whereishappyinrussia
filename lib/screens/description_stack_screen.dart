import 'package:flutter/material.dart';
import 'package:test_backend_on_flask/helpers/network_utility.dart';

class DescriptionStackScreen extends StatelessWidget {
  const DescriptionStackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      persistentFooterButtons: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {
                  NetworkUtility.showLink('https://t.me/wherehirchat');
                },
                child: const Text('Предложения и пожелания')),
          ],
        )
      ],
      appBar: AppBar(
        title: const Text('Технические детали'),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Разное - не заразное:',
                style: TextStyle(fontSize: 18),
              ),
              // const SizedBox(height: 10),
              DataTable(columns: const [
                DataColumn(label: SizedBox.shrink()),
                DataColumn(label: SizedBox.shrink()),
              ], rows: const [
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('Свой бэкенд на',
                        textAlign: TextAlign.end,
                        style: TextStyle(fontSize: 18))),
                    DataCell(Text(
                      'Flask',
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    )),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('Свой фронтенд на',
                        textAlign: TextAlign.end,
                        style: TextStyle(fontSize: 18))),
                    DataCell(Text(
                      'Flutter',
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    )),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('Хостинг на',
                        textAlign: TextAlign.end,
                        style: TextStyle(fontSize: 18))),
                    DataCell(Text(
                      'Firebase',
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    )),
                  ],
                ),
              ]),
              const Divider(),
              // Table(
              //   defaultColumnWidth: IntrinsicColumnWidth(),
              //   children: const [
              //     TableRow(children: [
              //       TableCell(
              //         child: Text('Свой бэкенд на',
              //             style: TextStyle(fontSize: 18)),
              //       ),
              //       TableCell(
              //         child: Text(
              //           'Flask',
              //           style: TextStyle(
              //               fontWeight: FontWeight.bold, fontSize: 20),
              //         ),
              //       ),
              //     ]),
              //     TableRow(children: [
              //       TableCell(
              //         child: Text('Свой фронтенд на',
              //             style: TextStyle(fontSize: 18)),
              //       ),
              //       TableCell(
              //         child: Text(
              //           'Flutter',
              //           style: TextStyle(
              //               fontWeight: FontWeight.bold, fontSize: 20),
              //         ),
              //       ),
              //     ]),
              //     TableRow(children: [
              //       TableCell(
              //         child: Text('Хостинг на', style: TextStyle(fontSize: 18)),
              //       ),
              //       TableCell(
              //         child: Text(
              //           'Firebase',
              //           style: TextStyle(
              //               fontWeight: FontWeight.bold, fontSize: 20),
              //         ),
              //       ),
              //     ]),
              //   ],
              // ),

              RichText(
                  text: const TextSpan(
                      text: 'Ну прямо ',
                      style: TextStyle(fontSize: 18),
                      children: [
                    TextSpan(
                        text: 'FFF',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                    TextSpan(text: ' какое-то, '),
                  ])),
              RichText(
                  text: const TextSpan(
                      text: 'а не ',
                      style: TextStyle(fontSize: 18),
                      children: [
                    TextSpan(
                        text: 'МММ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18)),
                  ])),
              const Divider(),
            ]),
      ),
    );
  }
}
