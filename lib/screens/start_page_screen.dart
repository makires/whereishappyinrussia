import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_backend_on_flask/screens/description_stack_screen.dart';
import 'package:test_backend_on_flask/helpers/network_utility.dart';
import 'package:test_backend_on_flask/screens/ui_elements/has_many_cities_widget.dart';
import 'package:test_backend_on_flask/screens/ui_elements/has_one_city_widget.dart';
import 'package:test_backend_on_flask/screens/ui_elements/no_cities_widget.dart';
import 'package:test_backend_on_flask/view_model/view_model.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Где на Руси жить хорошо',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: AnimatedSplashScreen(
            duration: 1000,
            splash: Icons.travel_explore,
            nextScreen: const MyHomePage(),
            splashTransition: SplashTransition.fadeTransition,
            backgroundColor: Colors.blue));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final cityNameController = TextEditingController();
  bool _showClearButton = false;
  bool _showResult = false;

  @override
  void dispose() {
    cityNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ViewModel>(
      builder: (context, viewModel, child) {
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
                TextButton(
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return const DescriptionStackScreen();
                      }));
                    },
                    child: const Text('Техническая сторона')),
              ],
            )
          ],
          appBar: AppBar(
            title: const Text('Где на Руси жить хорошо'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 350,
                  child: TextField(
                    onChanged: (text) {
                      setState(() {
                        _showClearButton = text.isNotEmpty;
                      });
                    },
                    onSubmitted: (value) async {
                      final cityForRequest = cityNameController.text;
                      viewModel.getDataAboutCity(
                          cityName: cityForRequest, context: context);
                      Future.delayed(const Duration(milliseconds: 500));
                      setState(() {
                        _showResult = true;
                      });
                    },
                    keyboardType: TextInputType.multiline,
                    textCapitalization: TextCapitalization.sentences,
                    style: const TextStyle(color: Colors.black, fontSize: 22),
                    controller: cityNameController,
                    decoration: InputDecoration(
                      suffixIcon: _showClearButton
                          ? IconButton(
                              onPressed: () {
                                setState(() {
                                  cityNameController.clear();
                                  _showClearButton = false;
                                  _showResult = false;
                                });
                              },
                              icon: const Icon(Icons.cancel_sharp),
                            )
                          : null,
                      border: const OutlineInputBorder(),
                      hintText: 'Название города',
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                    onPressed: () async {
                      final cityForRequest = cityNameController.text;
                      viewModel.getDataAboutCity(
                          cityName: cityForRequest, context: context);
                      Future.delayed(const Duration(milliseconds: 500));
                      setState(() {
                        if (cityForRequest.isNotEmpty) {
                          _showResult = true;
                        }
                      });
                    },
                    child: const Text('Узнать')),
                const SizedBox(height: 20),
                if (viewModel.customCities.length == 1 &&
                    _showResult == true) ...[
                  HasOneCityWidget(
                    viewModel: viewModel,
                  ),
                ] else if (viewModel.customCities.length > 1 &&
                    _showResult == true) ...[
                  HasManyCitiesWidget(
                    viewModel: viewModel,
                  ),
                ] else if (viewModel.customCities.isEmpty &&
                    _showResult == true) ...[
                  const NoCitiesWidget(),
                ] else if (viewModel.customCities.isEmpty &&
                    _showResult == false)
                  ...[],
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
