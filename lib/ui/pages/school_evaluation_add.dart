import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class SchoolEvaluationForm extends StatefulWidget {
  const SchoolEvaluationForm({super.key});

  @override
  _SchoolEvaluationFormState createState() => _SchoolEvaluationFormState();
}

class _SchoolEvaluationFormState extends State<SchoolEvaluationForm> {
  double overallRating = 0.0;
  final TextEditingController _controller = TextEditingController();
  final List<String> criteria = [
    '교내 장학금 제도',
    '기숙사 시설',
    '학교 공공 시설',
    '학식',
    '교육 커리큘럼',
    '학교 행사 및 지원'
  ];
  final Map<String, String> ratings = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[100],
        title: const Text('학교평가'),
        // leading: IconButton(
        //   icon: const Icon(Icons.arrow_back),
        //   onPressed: () {
        //     // Handle back button action
        //   },
        // ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: RatingBar.builder(
                initialRating: overallRating,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  setState(() {
                    overallRating = rating;
                  });
                },
              ),
            ),
            const SizedBox(height: 8),
            Center(
              child: Text(
                '$overallRating/5',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _controller,
              maxLines: 5,
              decoration: const InputDecoration(
                hintText: '학교에 대한 총평을 작성해 주세요.',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ...criteria.map((criterion) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    criterion,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Wrap(
                    spacing: 4.0,
                    runSpacing: 4.0,
                    children: [
                      for (String rating in [
                        '매우 좋음',
                        '좋음',
                        '보통',
                        '나쁨',
                        '매우 나쁨'
                      ])
                        ChoiceChip(
                          label: Text(rating),
                          selected: ratings[criterion] == rating,
                          onSelected: (selected) {
                            setState(() {
                              if (selected) {
                                ratings[criterion] = rating;
                              }
                            });
                          },
                        ),
                    ],
                  ),
                  const SizedBox(height: 8),
                ],
              );
            }),
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle form submission
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlue[100],
                ),
                child: const Text('평가하기'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
