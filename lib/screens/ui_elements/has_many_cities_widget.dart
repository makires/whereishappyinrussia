import 'package:flutter/material.dart';
import 'package:test_backend_on_flask/view_model/view_model.dart';

class HasManyCitiesWidget extends StatelessWidget {
  final ViewModel viewModel;
  const HasManyCitiesWidget({
    Key? key,
    required this.viewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: RichText(
            textAlign: TextAlign.center,
            text: const TextSpan(
              text: 'Ого, с таким названием есть несколько городов, ',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: RichText(
            textAlign: TextAlign.center,
            text: const TextSpan(
              text: 'например:',
              style: TextStyle(
                fontSize: 18,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Table(
          defaultColumnWidth: const IntrinsicColumnWidth(),
          border: TableBorder.all(
              width: 0.5, color: Colors.grey, style: BorderStyle.solid),
          children: List.generate(
            viewModel.customCities.length,
            (index) {
              return TableRow(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RichText(
                      text: TextSpan(
                        text:
                            '${viewModel.customCities[index].nameCity} \n(${viewModel.customCities[index].subject}) ',
                        style: const TextStyle(fontSize: 18),
                        children: [
                          TextSpan(
                              text:
                                  '${viewModel.customCities[index].population} ',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18)),
                          const TextSpan(
                              text: 'чел.', style: TextStyle(fontSize: 16)),
                        ],
                      ),
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
