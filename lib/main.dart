import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stepper',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 74),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stepper'),
      ),
      body: Center(
        child: Stepper(
          controlsBuilder: (context, details) {
            return Center(
              child: Row(
                children: [
                  TextButton(
                    onPressed: details.onStepContinue,
                    child: Text(_currentStep < 2 ? 'Go to step ${details.stepIndex + 2}' : 'Finish'),
                  ),
                  TextButton(
                    onPressed: details.onStepCancel,
                    child: Text(_currentStep > 0 ? 'Go back to step ${details.stepIndex}' : 'Exit'),
                  ),
                ],
              ),
            );
          },
          steps: [
            Step(
              state: _currentStep > 0 ? StepState.complete : StepState.editing,
              title: const Text('Step 1'),
              content: const Text('Content for step 1'),
              isActive: _currentStep == 0,
            ),
            Step(
              state: _currentStep > 1 ? StepState.complete : StepState.editing,
              title: const Text('Step 2'),
              content: const Text('Content for step 2'),
              isActive: _currentStep == 1,
            ),
            Step(
              state: _currentStep > 2 ? StepState.complete : StepState.editing,
              title: const Text('Step 3'),
              content: const Text('Content for step 3'),
              isActive: _currentStep == 2,
            ),
          ],
          elevation: 1,
          currentStep: _currentStep,
          onStepContinue: () {
            if (_currentStep < 2) {
              setState(() {
                _currentStep += 1;
              });
            }
          },
          onStepCancel: () {
            if (_currentStep > 0) {
              setState(() {
                _currentStep -= 1;
              });
            }
          },
          onStepTapped: (value) {
            setState(() {
              _currentStep = value;
            });
          },
          // type: StepperType.horizontal,
        ),
      ),
    );
  }
}
