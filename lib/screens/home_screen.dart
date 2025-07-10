// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/ad_provider.dart';
import '../providers/quiz_provider.dart';
import '../widgets/banner_ad_widget.dart';
import '../widgets/custom_button.dart';
import 'quiz_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AdMob Quiz App'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        children: [
          const BannerAdWidget(),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.quiz,
                    size: 100,
                    color: Colors.blue,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Welcome to Quiz App!',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Test your knowledge with our quiz',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  const SizedBox(height: 40),
                  CustomButton(
                    text: 'Start Quiz',
                    onPressed: () {
                      context.read<QuizProvider>().resetQuiz();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const QuizScreen(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  Consumer<AdProvider>(
                    builder: (context, adProvider, child) {
                      return Column(
                        children: [
                          CustomButton(
                            text: 'Watch Ad for Bonus Points',
                            onPressed: () {
                              adProvider.showRewardedAd();
                            },
                            backgroundColor: Colors.green,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Bonus Points: ${adProvider.adState.rewardedAdPoints}',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      );
                    },
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
