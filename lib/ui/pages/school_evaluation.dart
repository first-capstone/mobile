import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'school_evaluation_add.dart';

class SchoolEvaluationPage extends StatefulWidget {
  const SchoolEvaluationPage({super.key});

  @override
  _SchoolEvaluationPageState createState() => _SchoolEvaluationPageState();
}

class _SchoolEvaluationPageState extends State<SchoolEvaluationPage> {
  final List<Map<String, String>> reviews = [
    {
      "user": "유니(배재대학교)",
      "review": "우리학교는 교내장학금 제도가 잘 되어 있어서 학교 다닐 맛 나는듯",
      "rating": "5.0"
    },
    {
      "user": "유니(배재대학교)",
      "review": "학교 안에 편의점 같은 공공시설이 근처에 많아서 너무 편리해요.",
      "rating": "5.0"
    },
    {
      "user": "유니(배재대학교)",
      "review":
          "나는 컴공과인데 검공과 교육커리큘럼이 꼼꼼해서 다니기 좋아요. 물론 수업들이 난이도는 있지만 그래도 교수님들이 열정적이라서 좋아요.",
      "rating": "5.0"
    },
  ];

  void addReview(String review, String rating) {
    setState(() {
      reviews.add({
        "user": "유니(배재대학교)",
        "review": review,
        "rating": rating,
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[100],
        title: const Text(
          '학교 평가',
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(CupertinoPageRoute<bool>(
                builder: (BuildContext context) => SchoolEvaluationForm(
                  onSubmit: addReview,
                ),
                allowSnapshotting: false,
              ));
            },
            icon: const FaIcon(FontAwesomeIcons.pencil),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              color: Colors.lightBlue[100],
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                            'https://www.unamwiki.org/w/images/d/d6/%EB%B0%B0%EC%9E%AC%EB%8C%80%ED%95%99%EA%B5%90_%EC%8B%AC%EB%B2%8C%EB%A7%88%ED%81%AC.jpg'), // Replace with your image link
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '배재대학교(대전광역시)',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text('0.0', style: TextStyle(color: Colors.grey)),
                          Text('대전광역시 서구 배재로 155-40',
                              style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                      Spacer(),
                      Text(
                        '홈페이지',
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              color: Colors.grey[200],
              width: MediaQuery.of(context).size.width <
                      MediaQuery.of(context).size.height
                  ? MediaQuery.of(context).size.width
                  : MediaQuery.of(context).size.height,
              height: MediaQuery.of(context).size.width <
                      MediaQuery.of(context).size.height
                  ? MediaQuery.of(context).size.width
                  : MediaQuery.of(context).size.height,
              child: const Center(
                  child: Text('지도 뷰 들어갈 예정')), // Replace with actual content
            ),
            ListTile(
              title: const Text('+ 더보기'),
              onTap: () {
                // Handle on tap
              },
            ),
            const Divider(),
            ...reviews.map((review) {
              return Container(
                color: Colors.lightBlue[50],
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.only(bottom: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          review['user']!,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            Text(review['rating']!),
                            const Icon(Icons.star, color: Colors.blue),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(review['review']!),
                  ],
                ),
              );
            }),
            ListTile(
              title: const Text('+ 더보기'),
              onTap: () {
                // Handle on tap
              },
            ),
          ],
        ),
      ),
    );
  }
}
