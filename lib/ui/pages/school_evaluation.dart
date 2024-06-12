import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:union/ui/widgets/article_preview.dart';
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
                            'https://www.pcu.ac.kr/images/site/kor/content/8_ui_A19.png'), // Replace with your image link
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
                          Text('5.0', style: TextStyle(color: Colors.grey)),
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
                color: Colors.white,
                width: MediaQuery.of(context).size.width <
                        MediaQuery.of(context).size.height
                    ? MediaQuery.of(context).size.width
                    : MediaQuery.of(context).size.height,
                height: MediaQuery.of(context).size.width <
                        MediaQuery.of(context).size.height
                    ? MediaQuery.of(context).size.width
                    : MediaQuery.of(context).size.height,
                child: SingleChildScrollView(
                  child: ArticlePreview(
                      profileImageUrl:
                          "https://www.pcu.ac.kr/images/site/kor/content/8_ui_A19.png",
                      username: "배재대학교",
                      school: "",
                      timestamp: '05/29 18:00',
                      imageUrls: [
                        "https://scontent-den2-1.cdninstagram.com/v/t51.29350-15/445579796_996688808688619_7124016908369508029_n.jpg?stp=dst-jpg_e35&efg=eyJ2ZW5jb2RlX3RhZyI6ImltYWdlX3VybGdlbi4xNDQweDE0NDAuc2RyLmYyOTM1MCJ9&_nc_ht=scontent-den2-1.cdninstagram.com&_nc_cat=107&_nc_ohc=wQfwrKf2tGYQ7kNvgFrNwsp&edm=APs17CUBAAAA&ccb=7-5&ig_cache_key=MzM3NDgzOTkwODExNTE1NjYzNQ%3D%3D.2-ccb7-5&oh=00_AYCpbpnH2L9A7wE1Vh6JVgT5qIMX-fvLpeh_T18k-bYGVQ&oe=666F28CF&_nc_sid=10d13b",
                        "https://scontent-den2-1.cdninstagram.com/v/t51.29350-15/446106760_1460165511268277_5414120076742597931_n.jpg?stp=dst-jpg_e35&efg=eyJ2ZW5jb2RlX3RhZyI6ImltYWdlX3VybGdlbi4xNDQweDE0NDAuc2RyLmYyOTM1MCJ9&_nc_ht=scontent-den2-1.cdninstagram.com&_nc_cat=105&_nc_ohc=HfkXh1jbN3EQ7kNvgE7LKmA&edm=APs17CUBAAAA&ccb=7-5&ig_cache_key=MzM3NDgzOTkwNzkyMjIyMDEzMg%3D%3D.2-ccb7-5&oh=00_AYCcC2o5_9cb7x7RE8EXyLHOsDaX_bdlSX77IBFZVfNXJQ&oe=666F2CAD&_nc_sid=10d13b",
                        "https://scontent-ssn1-1.cdninstagram.com/v/t51.29350-15/446108217_2254541218226924_8018603231167945840_n.jpg?stp=dst-jpg_e35&efg=eyJ2ZW5jb2RlX3RhZyI6ImltYWdlX3VybGdlbi4xNDQweDE0NDAuc2RyLmYyOTM1MCJ9&_nc_ht=scontent-ssn1-1.cdninstagram.com&_nc_cat=108&_nc_ohc=kN9n1lteADMQ7kNvgHYbRQU&edm=AFg4Q8wBAAAA&ccb=7-5&ig_cache_key=MzM3NDgzOTkwNzkzOTA2Mjc5Mg%3D%3D.2-ccb7-5&oh=00_AYCtikjdWFE5oV1E3-8qn9QjSeoXAHsBsDQv3OLGa2fwSw&oe=666F4838&_nc_sid=cf751b",
                        "https://scontent-ssn1-1.cdninstagram.com/v/t51.29350-15/446098812_1570912216820433_7814437809832026024_n.jpg?stp=dst-jpg_e35&efg=eyJ2ZW5jb2RlX3RhZyI6ImltYWdlX3VybGdlbi4xNDQweDE0NDAuc2RyLmYyOTM1MCJ9&_nc_ht=scontent-ssn1-1.cdninstagram.com&_nc_cat=109&_nc_ohc=ckzd6hK1r2sQ7kNvgE1ZeVb&edm=AFg4Q8wBAAAA&ccb=7-5&ig_cache_key=MzM3NDgzOTkwODExNTMzODY3Ng%3D%3D.2-ccb7-5&oh=00_AYAhc-z9o8v15V1vSc-Y2hmHqWA6217i-Lx2mcPH9xLEDg&oe=666F4E84&_nc_sid=cf751b",
                        "https://scontent-ssn1-1.cdninstagram.com/v/t51.29350-15/446117886_1167481104443629_6972489875012390371_n.jpg?stp=dst-jpg_e35&efg=eyJ2ZW5jb2RlX3RhZyI6ImltYWdlX3VybGdlbi4xNDQweDE0NDAuc2RyLmYyOTM1MCJ9&_nc_ht=scontent-ssn1-1.cdninstagram.com&_nc_cat=101&_nc_ohc=sq8EKYwyausQ7kNvgEsB_XY&edm=AFg4Q8wBAAAA&ccb=7-5&ig_cache_key=MzM3NDgzOTkwNzkzOTAzMjA1NQ%3D%3D.2-ccb7-5&oh=00_AYA9iJ3Mx75Qgm7bLgfk7s2dQfx1zSejslCwJNHo9KViLw&oe=666F4889&_nc_sid=cf751b",
                        "https://scontent-ssn1-1.cdninstagram.com/v/t51.29350-15/446111700_1614769702689498_69278871781095181_n.jpg?stp=dst-jpg_e35&efg=eyJ2ZW5jb2RlX3RhZyI6ImltYWdlX3VybGdlbi4xNDQweDE0NDAuc2RyLmYyOTM1MCJ9&_nc_ht=scontent-ssn1-1.cdninstagram.com&_nc_cat=106&_nc_ohc=fMTJdynIOMQQ7kNvgE46Z1Q&edm=AFg4Q8wBAAAA&ccb=7-5&ig_cache_key=MzM3NDgzOTkwNzkzOTEzMjMyNQ%3D%3D.2-ccb7-5&oh=00_AYB8JJjE5Hy1CvFFafFqi9Rggvbaq3DgcZh3wBp4hdDzWw&oe=666F4671&_nc_sid=cf751b",
                        "https://scontent-ssn1-1.cdninstagram.com/v/t51.29350-15/445920216_1634693403942557_3301228905341541761_n.jpg?stp=dst-jpg_e35&efg=eyJ2ZW5jb2RlX3RhZyI6ImltYWdlX3VybGdlbi4xNDQweDE0NDAuc2RyLmYyOTM1MCJ9&_nc_ht=scontent-ssn1-1.cdninstagram.com&_nc_cat=105&_nc_ohc=bCaIr3Tqd50Q7kNvgFW9qLq&edm=AFg4Q8wBAAAA&ccb=7-5&ig_cache_key=MzM3NDgzOTkwNzkzMDY2NTEyMg%3D%3D.2-ccb7-5&oh=00_AYCQrWBHkIam6ywqErSFbTGnY8H_hTaqOTf4x3ABcmTGgQ&oe=666F3118&_nc_sid=cf751b"
                      ],
                      content: """🎵 대동제 공연 라인업 안내 🎵

안녕하세요. 배재대학교입니다:D
어느덧 다음주면 2024 연자골 대동제가 시작됩니다!

올해에도 많은 아티스트분들이 온다고 하는데요!
화려한 라인업 공개합니다🩷

🌹연자골 대동제 LINE-UP 🌟
[DAY 1] 거미🕷️ | 미란이👩🏻‍🎤 | 하이키🌹 |
[DAY 2] 재만🎙️ | 애쉬아일랜드☁️ | 비오💫 |

#배재대 #대동제 #연자골대동제 #축제 #배재대축제 #거미 #애쉬아일랜드 #재만 #하이키 #미란이 #비오""",
                      upCount: 426,
                      isUpped: true,
                      isReported: false,
                      isAnonymous: false,
                      comments: []),
                )),
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
