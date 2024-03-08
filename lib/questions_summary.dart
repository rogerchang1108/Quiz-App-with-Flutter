import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 30, 
                      height: 30, 
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: (data['user_answer'] == data['correct_answer'])
                            ? const Color.fromARGB(255, 150, 198, 241) // Correct color
                            : const Color.fromARGB(255, 249, 133, 241), // Wrong color
                      ),
                      child: Center(
                        child: Text(
                          ((data['question_index'] as int) + 1).toString(),
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data['question'] as String,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            'Your Answer:      ${data['user_answer']}',
                            style: const TextStyle(
                              color: Color.fromARGB(255, 202, 171, 252),
                            ),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Text(
                            'Correct Answer: ${data['correct_answer']}',
                            style: const TextStyle(
                              color: Color.fromARGB(255, 181, 254, 246),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
