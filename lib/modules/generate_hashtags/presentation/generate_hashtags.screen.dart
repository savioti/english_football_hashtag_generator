import 'package:english_football_hashtag_generator/app/dependency_injection/service_locator.dart';
import 'package:english_football_hashtag_generator/modules/generate_hashtags/domain/usecases/generate_hashtags_usecase.dart';
import 'package:english_football_hashtag_generator/modules/generate_hashtags/presentation/generate_hashtags.presenter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GenerateHashtagsScreen extends StatelessWidget {
  GenerateHashtagsScreen({Key? key}) : super(key: key);

  final _inputController = TextEditingController();
  final _outputController = TextEditingController();
  final _presenter = GenerateHashtagsPresenter(
      usecase: serviceLocator.get<GenerateHashTagUseCase>());
  final _provider = StateProvider<String>((ref) => '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hashtag generator'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 32.0, horizontal: 32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Input',
                    style: TextStyle(fontSize: 24.0),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[800],
                      borderRadius: BorderRadius.circular(3.0),
                    ),
                    child: TextField(
                      controller: _inputController,
                      maxLines: 5,
                    ),
                  ),
                  const SizedBox(height: 32.0),
                  Align(
                    alignment: Alignment.center,
                    child: Consumer(
                      builder: (context, ref, child) {
                        return ElevatedButton(
                          onPressed: () async {
                            final hashtagData = await _presenter
                                .generateHashtags(_inputController.text);
                            ref.read(_provider.state).state = hashtagData;
                          },
                          child: const Text('Generate'),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 32.0),
                  const Text(
                    'Output',
                    style: TextStyle(fontSize: 24.0),
                  ),
                  Container(
                    height: 120.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey[800],
                      borderRadius: BorderRadius.circular(3.0),
                    ),
                    child: Consumer(
                      builder: (context, ref, child) {
                        _outputController.text =
                            ref.watch(_provider.state).state;
                        return TextField(
                          controller: _outputController,
                          readOnly: true,
                          maxLines: 5,
                        );
                      },
                    ),
                  ),
                  const Spacer(),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      'Created by Angelo Savioti',
                      style: TextStyle(color: Colors.grey[700], fontSize: 12.0),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
