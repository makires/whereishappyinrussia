import 'package:flutter/material.dart';

import 'package:test_backend_on_flask/view_model/view_model.dart';

class HasOneCityWidget extends StatelessWidget {
  final ViewModel viewModel;
  const HasOneCityWidget({
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
            text: TextSpan(
              text: 'Если население в количестве ',
              style: const TextStyle(fontSize: 18),
              children: <TextSpan>[
                TextSpan(
                    text: viewModel.customCities.first.population,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                const TextSpan(text: ' человек вам подходит, то Welcome!')
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'Но лучше подумать дважды :) Это ${viewModel.customCities.first.subject}',
          style: const TextStyle(
            fontSize: 16,
            fontStyle: FontStyle.italic,
          ),
        ),
      ],
    );
  }
}
