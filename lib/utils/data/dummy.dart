import 'package:union/ui/widgets/search_univ.dart';
import 'package:union/utils/model/article.dart';
import 'package:union/utils/model/comment.dart';
import 'package:union/utils/model/profile.dart';

// 기본 프로필 URL "https://static.vecteezy.com/system/resources/previews/015/078/556/non_2x/man-employee-illustration-on-a-background-premium-quality-symbols-icons-for-concept-and-graphic-design-vector.jpg"

final List<SearchUniv> dummyUnivList = [
  SearchUniv(
    logoPath:
        "https://i.namu.wiki/i/qf-gKUtHQD7tB9REirpR3yhtZjIIGTFwv8m9N_5wMjkmE_xDknkuJFREtF7n8-n76EyGV5FWzEU6TQL1GrSnEg.webp",
    univName: "ICT 폴리텍대학 (경기도)",
    isFollow: true,
  ),
  SearchUniv(
    logoPath:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSyzrLBySOFP2PZFI9oj2BNmCBC-uFobWiAzA&s",
    univName: "목원대학교(대전광역시)",
    isFollow: true,
  ),
  SearchUniv(
    logoPath: "https://www.pcu.ac.kr/images/site/kor/content/8_ui_A19.png",
    univName: "배재대학교(대전광역시)",
    isFollow: true,
  ),
  SearchUniv(
    logoPath:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_TFgKvgyoxhd1aAls3Ua7B3hRRLqR0-y3iw&s",
    univName: "가야대학교(경상남도)",
    isFollow: false,
  ),
  SearchUniv(
    logoPath:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQWvSQ-r6RM4fjyoHDIMNgq-6LI0RGKne0pnw&s",
    univName: "가천대학교(인천)",
    isFollow: false,
  ),
  SearchUniv(
    logoPath: "https://www.cku.ac.kr/sites/cku/images/sub/UI10.png",
    univName: "가톨릭관동대학교(강원도)",
    isFollow: false,
  ),
  SearchUniv(
    logoPath:
        "https://mblogthumb-phinf.pstatic.net/MjAyMzAxMTdfNzQg/MDAxNjczOTE4OTc0OTA0.yRXHcPhbRjzy-fQDFGXDErl-prik02C1YWmcPEWJlSwg.t25qlVT0eaHFgMyRtgCythwyHrUyLxu8rC5fuhlPQAgg.PNG.hyuncar2/KNU_Mark.png?type=w800",
    univName: "강남대학교(경기도)",
    isFollow: false,
  ),
  SearchUniv(
    logoPath:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSyGaXHn36YT_B2HmDZgFA1GrewVv5RnnmiR-ZgafRQxlPbsX57JKIPLv_3yC3NwPikMMs&usqp=CAU",
    univName: "강동대학교(충청북도)",
    isFollow: false,
  ),
  SearchUniv(
    logoPath:
        "https://www.gyu.ac.kr/site/gyu/images/contents/cts238wrap_img01.png",
    univName: "강릉영동대학교(강원도)",
    isFollow: false,
  ),
  SearchUniv(
    logoPath:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQXQ_vjoEgsUHleLJskJjN0mjzAjGyncEarLQ&s",
    univName: "강릉원주대학교(강원도)",
    isFollow: false,
  ),
  SearchUniv(
    logoPath:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQCz7ylWJIYdLzSTLJcclXu8zdqW7UzFVXMwA&s",
    univName: "건국대학교(서울특별시)",
    isFollow: false,
  ),
  SearchUniv(
    logoPath: "https://www.gtec.ac.kr/type/common/img/kor/info/symbol2.png",
    univName: "경기과학기술대학교(경기도)",
    isFollow: false,
  ),
  SearchUniv(
    logoPath:
        "https://upload.wikimedia.org/wikipedia/ko/thumb/3/34/%EA%B3%A0%EB%A0%A4%EB%8C%80%ED%95%99%EA%B5%90_%EB%A1%9C%EA%B3%A0.svg/1200px-%EA%B3%A0%EB%A0%A4%EB%8C%80%ED%95%99%EA%B5%90_%EB%A1%9C%EA%B3%A0.svg.png",
    univName: "고려대학교(서울특별시)",
    isFollow: false,
  ),
  SearchUniv(
    logoPath: "https://www.daewon.ac.kr/mbs/daewon/images/ui_01.png",
    univName: "대원대학교(충청북도)",
    isFollow: false,
  ),
  SearchUniv(
    logoPath:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-H2Xb8eI1zpVzSNoHL1UV1gO3aAaqGp7T1w&s",
    univName: "배화여자대학교(서울특별시)",
    isFollow: false,
  ),
  SearchUniv(
    logoPath:
        "https://blog.kakaocdn.net/dn/bVDUi3/btrpozcmjEv/MmVG7njKeJbD9AR1ItXNz1/img.png",
    univName: "부산대학교(부산광역시)",
    isFollow: false,
  ),
];

final List<Article> dummyArticleList = [
  // Article(
  //     author: Profile(
  //         avatarUrl:
  //             "https://static.vecteezy.com/system/resources/previews/015/078/556/non_2x/man-employee-illustration-on-a-background-premium-quality-symbols-icons-for-concept-and-graphic-design-vector.jpg",
  //         username: "유니",
  //         school: "배재대학교"),
  //     content: "테스트 게시글 입니다.",
  //     timestamp: "05/29 18:00",
  //     upCount: 0,
  //     imageUrls: [],
  //     comments: []),
  Article(
      author: Profile(
        username: "배재대학교(공식)",
        school: "배재대학교",
        avatarUrl: "https://www.pcu.ac.kr/images/site/kor/content/8_ui_A19.png",
      ),
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
      upCount: 425,
      isStarred: false,
      isReported: false,
      isAnonymous: false,
      comments: [
        Comment(
          author: Profile(
            school: "배재대학교",
            avatarUrl:
                "https://static.vecteezy.com/system/resources/previews/015/078/556/non_2x/man-employee-illustration-on-a-background-premium-quality-symbols-icons-for-concept-and-graphic-design-vector.jpg",
            username: '유니버스 1',
          ),
          text: '와 거미가 온다고?? 가슴이 웅장해진다...',
          timestamp: '05/29 18:23',
        ),
        Comment(
          author: Profile(
            school: "목원대학교",
            avatarUrl:
                "https://static.vecteezy.com/system/resources/previews/015/078/556/non_2x/man-employee-illustration-on-a-background-premium-quality-symbols-icons-for-concept-and-graphic-design-vector.jpg",
            username: '유니버스 2',
          ),
          text: '애쉬아일랜드랑 비오 보러 가야겠다',
          timestamp: '05/10 18:26',
          replies: [
            Comment(
                author: Profile(
                    username: "유니버스 3",
                    school: "서울대학교",
                    avatarUrl:
                        "https://static.vecteezy.com/system/resources/previews/015/078/556/non_2x/man-employee-illustration-on-a-background-premium-quality-symbols-icons-for-concept-and-graphic-design-vector.jpg"),
                text: "와 이건 대전 내려가야겠다 ㅇㅈ?",
                timestamp: '05/29 18:33')
          ],
        )
      ]),
  Article(
    author: Profile(
      username: "유니",
      school: "한국과학기술원",
      avatarUrl:
          "https://static.vecteezy.com/system/resources/previews/015/078/556/non_2x/man-employee-illustration-on-a-background-premium-quality-symbols-icons-for-concept-and-graphic-design-vector.jpg",
    ),
    content: "2024 카이스트 축제 23일 라인업",
    timestamp: "05/10 19:22",
    isReported: false,
    isStarred: false,
    upCount: 1586,
    imageUrls: [
      "https://cdn.dailycc.net/news/photo/202405/787210_694570_5658.jpg",
      "https://cdn.dailycc.net/news/photo/202405/787210_694569_5657.jpg",
      "https://cdn.dailycc.net/news/photo/202405/787210_694568_5657.jpg"
    ],
    comments: [
      Comment(
        author: Profile(
          school: "혜전대학교",
          avatarUrl:
              "https://static.vecteezy.com/system/resources/previews/015/078/556/non_2x/man-employee-illustration-on-a-background-premium-quality-symbols-icons-for-concept-and-graphic-design-vector.jpg",
          username: '유니버스 1',
        ),
        text: '와씨... 좋겠다 우리는 무슨 릴김치? 오는데 ㅜㅜㅜㅜㅜㅜ 최예나 프로미스나인 사랑해!!!!!!!!',
        timestamp: '05/10 19:23',
        replies: [
          Comment(
            author: Profile(
              username: "유니",
              school: "홍익대학교",
              avatarUrl:
                  "https://static.vecteezy.com/system/resources/previews/015/078/556/non_2x/man-employee-illustration-on-a-background-premium-quality-symbols-icons-for-concept-and-graphic-design-vector.jpg",
            ),
            text: '우리 학교 놀러와!!',
            timestamp: '05/10 19:25',
          ),
          Comment(
            author: Profile(
              school: "포항공과대학교",
              avatarUrl:
                  "https://static.vecteezy.com/system/resources/previews/015/078/556/non_2x/man-employee-illustration-on-a-background-premium-quality-symbols-icons-for-concept-and-graphic-design-vector.jpg",
              username: '유니버스 3',
            ),
            text: '난 ㄹㅇ 간다. 대전에 숙소 잡았다.',
            timestamp: '05/10 19:25',
          ),
          Comment(
            author: Profile(
              username: "유니",
              school: "한국과학기술원",
              avatarUrl:
                  "https://static.vecteezy.com/system/resources/previews/015/078/556/non_2x/man-employee-illustration-on-a-background-premium-quality-symbols-icons-for-concept-and-graphic-design-vector.jpg",
            ),
            text: '욜 대박!! 밤새 놀자고!! 대전 둔산동 가서 술 마셔!!',
            timestamp: '05/10 19:27',
          ),
          Comment(
            author: Profile(
              username: "유니버스 4",
              school: "평택대학교",
              avatarUrl:
                  "https://static.vecteezy.com/system/resources/previews/015/078/556/non_2x/man-employee-illustration-on-a-background-premium-quality-symbols-icons-for-concept-and-graphic-design-vector.jpg",
            ),
            text: '와 좋겠다 ㅠㅠ 나도 데리고 가!!',
            timestamp: '05/10 19:27',
          ),
          Comment(
            author: Profile(
              username: "유니버스 3",
              school: "포항공과대학교",
              avatarUrl:
                  "https://static.vecteezy.com/system/resources/previews/015/078/556/non_2x/man-employee-illustration-on-a-background-premium-quality-symbols-icons-for-concept-and-graphic-design-vector.jpg",
            ),
            text: '따라오든가 ㅋㅋㅋㅋ',
            timestamp: '05/10 19:27',
          ),
        ],
      ),
      Comment(
        author: Profile(
          school: "초당대학교",
          avatarUrl:
              "https://static.vecteezy.com/system/resources/previews/015/078/556/non_2x/man-employee-illustration-on-a-background-premium-quality-symbols-icons-for-concept-and-graphic-design-vector.jpg",
          username: '유니버스 2',
        ),
        text: '진짜 라인업 대박이다.. 우리는 두부만들기 체험하는데... 부럽다... 재밌게 놀다와...',
        timestamp: '05/10 19:28',
        replies: [
          Comment(
            author: Profile(
              username: "유니버스 4",
              school: "평택대학교",
              avatarUrl:
                  "https://static.vecteezy.com/system/resources/previews/015/078/556/non_2x/man-employee-illustration-on-a-background-premium-quality-symbols-icons-for-concept-and-graphic-design-vector.jpg",
            ),
            text: 'ㅋㅋㅋㅋㅋㅋㅋㅋㅋ 나도 두부만들기 체험하러 갈게 ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ',
            timestamp: '05/10 19:28',
          ),
        ],
      ),
      Comment(
        author: Profile(
          username: "유니버스 5",
          school: "창원대학교",
          avatarUrl:
              "https://static.vecteezy.com/system/resources/previews/015/078/556/non_2x/man-employee-illustration-on-a-background-premium-quality-symbols-icons-for-concept-and-graphic-design-vector.jpg",
        ),
        text:
            '아니 뭐 대전 노잼도시라며 올해에 워터밤 페스티벌도 하는데 대유잼도시네;; 나도 대전에 있는 대학교로 편입한다 진심.',
        timestamp: '05/10 19:28',
      ),
    ],
  ),
  Article(
    author: Profile(
      username: "유니",
      school: "홍익대학교",
      avatarUrl:
          "https://static.vecteezy.com/system/resources/previews/015/078/556/non_2x/man-employee-illustration-on-a-background-premium-quality-symbols-icons-for-concept-and-graphic-design-vector.jpg",
    ),
    content: "애들아 이거 사진 봐봐 어떻게 생각해? 댓글로 자기 생각 한 번씩만 적어줘",
    timestamp: "05/10 19:22",
    isReported: false,
    isStarred: false,
    upCount: 309,
    imageUrls: [
      "https://image.yes24.com/images/chyes24/froala/0/51981/79515.jpg",
      "https://cdn.crowdpic.net/detail-thumb/thumb_d_D3D2F6CEEB487DB9813D50BE2489422F.png",
      "https://cdn.crowdpic.net/detail-thumb/thumb_d_D3D2F6CEEB487DB9813D50BE2489422F.png",
      "https://cdn.crowdpic.net/detail-thumb/thumb_d_D3D2F6CEEB487DB9813D50BE2489422F.png",
      "https://cdn.crowdpic.net/detail-thumb/thumb_d_D3D2F6CEEB487DB9813D50BE2489422F.png",
      "https://cdn.crowdpic.net/detail-thumb/thumb_d_D3D2F6CEEB487DB9813D50BE2489422F.png",
      "https://cdn.crowdpic.net/detail-thumb/thumb_d_D3D2F6CEEB487DB9813D50BE2489422F.png",
      "https://cdn.crowdpic.net/detail-thumb/thumb_d_D3D2F6CEEB487DB9813D50BE2489422F.png",
      "https://cdn.crowdpic.net/detail-thumb/thumb_d_D3D2F6CEEB487DB9813D50BE2489422F.png",
      "https://cdn.crowdpic.net/detail-thumb/thumb_d_D3D2F6CEEB487DB9813D50BE2489422F.png",
      "https://cdn.pixabay.com/photo/2020/06/08/13/59/point-5274472_640.png"
    ],
    comments: [
      Comment(
        author: Profile(
          school: "남서울대학교",
          avatarUrl:
              "https://static.vecteezy.com/system/resources/previews/015/078/556/non_2x/man-employee-illustration-on-a-background-premium-quality-symbols-icons-for-concept-and-graphic-design-vector.jpg",
          username: '유니버스 1',
        ),
        text: '진짜 주글래??????????????????',
        timestamp: '05/10 19:23',
        replies: [
          Comment(
            author: Profile(
              username: "유니",
              school: "홍익대학교",
              avatarUrl:
                  "https://static.vecteezy.com/system/resources/previews/015/078/556/non_2x/man-employee-illustration-on-a-background-premium-quality-symbols-icons-for-concept-and-graphic-design-vector.jpg",
            ),
            text: '미안하다..이거 보여주려고 어그로 끌었다..',
            timestamp: '05/10 19:25',
          ),
          Comment(
            author: Profile(
              school: "인하공업전문대학",
              avatarUrl:
                  "https://static.vecteezy.com/system/resources/previews/015/078/556/non_2x/man-employee-illustration-on-a-background-premium-quality-symbols-icons-for-concept-and-graphic-design-vector.jpg",
              username: '유니버스 3',
            ),
            text: '진짜 개짱나네 요즘 왜 다 이거 올리냐;;',
            timestamp: '05/10 19:25',
          ),
          Comment(
            author: Profile(
              username: "유니",
              school: "홍익대학교",
              avatarUrl:
                  "https://static.vecteezy.com/system/resources/previews/015/078/556/non_2x/man-employee-illustration-on-a-background-premium-quality-symbols-icons-for-concept-and-graphic-design-vector.jpg",
            ),
            text: '미안..미얀..미얀마.....',
            timestamp: '05/10 19:27',
          ),
        ],
      ),
      Comment(
        author: Profile(
          school: "한서대학교",
          avatarUrl:
              "https://static.vecteezy.com/system/resources/previews/015/078/556/non_2x/man-employee-illustration-on-a-background-premium-quality-symbols-icons-for-concept-and-graphic-design-vector.jpg",
          username: '유니버스 2',
        ),
        text: '진짜 한대 칠까',
        timestamp: '05/10 19:28',
        replies: [
          Comment(
            author: Profile(
              username: "유니버스 4",
              school: "동아대학교",
              avatarUrl:
                  "https://static.vecteezy.com/system/resources/previews/015/078/556/non_2x/man-employee-illustration-on-a-background-premium-quality-symbols-icons-for-concept-and-graphic-design-vector.jpg",
            ),
            text: 'ㄱㄱ 진행시켜',
            timestamp: '05/10 19:28',
          ),
        ],
      ),
    ],
  ),
  Article(
    author: Profile(
      username: "가천대학교 22학번 대표",
      school: "가천대학교",
      avatarUrl:
          "https://i.pinimg.com/736x/25/a6/7b/25a67b52cbebddcf0345ea594a77960f.jpg",
    ),
    content:
        "가천대 제외 애니 좋아하는 사람? 모임하고싶은데 같은 학교는 좀 부담스러워서.. 다른 학교 같이 애니 공유하자능. 내 최애 애니는 데스노트. 두뇌 싸움 좋아하면 추천. 안좋아해도 추천 한 번 보길 바래",
    timestamp: "05/09 15:00",
    isReported: false,
    isStarred: false,
    upCount: 68,
    imageUrls: [
      "https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FbZXCBj%2FbtsDXxZHWut%2F4hXPKkXd7lewTkyqVocNj0%2Fimg.jpg",
    ],
    comments: [
      Comment(
        author: Profile(
          school: "고구려대학교",
          avatarUrl:
              "https://static.vecteezy.com/system/resources/previews/015/078/556/non_2x/man-employee-illustration-on-a-background-premium-quality-symbols-icons-for-concept-and-graphic-design-vector.jpg",
          username: '유니버스 1',
        ),
        text: '오...나는 러브 코미디물 좋아해서 토라도라 보는데 완전 추천 개설레 ',
        timestamp: '05/09 15:01',
        replies: [
          Comment(
            author: Profile(
              username: "가천대학교 22학번 대표",
              school: "가천대학교",
              avatarUrl:
                  "https://i.pinimg.com/736x/25/a6/7b/25a67b52cbebddcf0345ea594a77960f.jpg",
            ),
            text: '오호라 고마워 한 번 봐야겠다',
            timestamp: '05/09 15:01',
          ),
        ],
      ),
      Comment(
        author: Profile(
          school: "수원가톨릭대학교",
          avatarUrl:
              "https://static.vecteezy.com/system/resources/previews/015/078/556/non_2x/man-employee-illustration-on-a-background-premium-quality-symbols-icons-for-concept-and-graphic-design-vector.jpg",
          username: '유니버스 2',
        ),
        text:
            'ㅋㅋ ㄹㅇ 이런걸 보네 난 "강철의 연금술사 : BROTHERHOOD" 이거 ㅋ 이걸 안봤으면 애니를 본다고 할 수가 없지. 넌 자격 박탈이다 닝겐.',
        timestamp: '05/09 15:02',
        replies: [
          Comment(
            author: Profile(
              username: "가천대학교 22학번 대표",
              school: "가천대학교",
              avatarUrl:
                  "https://i.pinimg.com/736x/25/a6/7b/25a67b52cbebddcf0345ea594a77960f.jpg",
            ),
            text: '미..미안해.. 당장 보도록할게 한 번만 기회를 줘',
            timestamp: '05/09 15:05',
          ),
          Comment(
            author: Profile(
              school: "수원가톨릭대학교",
              avatarUrl:
                  "https://static.vecteezy.com/system/resources/previews/015/078/556/non_2x/man-employee-illustration-on-a-background-premium-quality-symbols-icons-for-concept-and-graphic-design-vector.jpg",
              username: '유니버스 2',
            ),
            text: '이번만 기회를 주지. 오늘 내로 볼 것.',
            timestamp: '05/09 15:05',
          ),
          Comment(
            author: Profile(
              username: "가천대학교 22학번 대표",
              school: "가천대학교",
              avatarUrl:
                  "https://i.pinimg.com/736x/25/a6/7b/25a67b52cbebddcf0345ea594a77960f.jpg",
            ),
            text: '으응! 알겠어!',
            timestamp: '05/09 15:06',
          ),
        ],
      ),
    ],
  ),
  Article(
    author: Profile(
      username: "유니",
      school: "가야대학교",
      avatarUrl:
          "https://static.vecteezy.com/system/resources/previews/015/078/556/non_2x/man-employee-illustration-on-a-background-premium-quality-symbols-icons-for-concept-and-graphic-design-vector.jpg",
    ),
    content: "카톡 프사 추천 해줘!!",
    timestamp: "05/09 13:13",
    isReported: false,
    isStarred: false,
    upCount: 8,
    imageUrls: [],
    comments: [
      Comment(
        author: Profile(
          school: "백석대학교",
          avatarUrl:
              "https://static.vecteezy.com/system/resources/previews/015/078/556/non_2x/man-employee-illustration-on-a-background-premium-quality-symbols-icons-for-concept-and-graphic-design-vector.jpg",
          username: '유니버스 1',
        ),
        text: '셀카 ㄱㄱ',
        timestamp: '05/09 13:14',
        replies: [
          Comment(
            author: Profile(
              school: "가야대학교",
              avatarUrl:
                  "https://static.vecteezy.com/system/resources/previews/015/078/556/non_2x/man-employee-illustration-on-a-background-premium-quality-symbols-icons-for-concept-and-graphic-design-vector.jpg",
              username: '유니',
            ),
            text: '얼굴에 자신이 없어...',
            timestamp: '05/09 13:14',
          ),
          Comment(
            author: Profile(
              school: "단국대학교",
              avatarUrl:
                  "https://static.vecteezy.com/system/resources/previews/015/078/556/non_2x/man-employee-illustration-on-a-background-premium-quality-symbols-icons-for-concept-and-graphic-design-vector.jpg",
              username: '유니버스 3',
            ),
            text: '자신감을 가져',
            timestamp: '05/09 13:15',
          ),
        ],
      ),
      Comment(
        author: Profile(
          school: "명지대학교",
          avatarUrl:
              "https://static.vecteezy.com/system/resources/previews/015/078/556/non_2x/man-employee-illustration-on-a-background-premium-quality-symbols-icons-for-concept-and-graphic-design-vector.jpg",
          username: '유니버스 2',
        ),
        text: '걍 아무것도 올리지 마셈 ㅋㅋ 신비주의 컨셉으로 가',
        timestamp: '05/09 13:17',
        replies: [
          Comment(
            author: Profile(
              school: "아주대학교",
              avatarUrl:
                  "https://static.vecteezy.com/system/resources/previews/015/078/556/non_2x/man-employee-illustration-on-a-background-premium-quality-symbols-icons-for-concept-and-graphic-design-vector.jpg",
              username: "유니버스 4",
            ),
            text: 'ㅇㅇ 요즘 그런 컨셉 많더라 ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ',
            timestamp: '05/05 18:48',
          ),
          Comment(
            author: Profile(
              school: "가야대학교",
              avatarUrl:
                  "https://static.vecteezy.com/system/resources/previews/015/078/556/non_2x/man-employee-illustration-on-a-background-premium-quality-symbols-icons-for-concept-and-graphic-design-vector.jpg",
              username: '유니',
            ),
            text: '그래야하낭,, 난 인생이 신비주의 컨셉이어서 탈출하고싶었는데 ㅜㅜ',
            timestamp: '05/05 18:53',
          )
        ],
      ),
    ],
  ),
  Article(
    author: Profile(
      username: "개쩌는 글쓴이",
      school: "한남대학교",
      avatarUrl:
          "https://img.freepik.com/free-psd/3d-render-of-avatar-character_23-2150611731.jpg",
    ),
    content: "탕수육 부먹 VS 찍먹 어떤게 더 좋아?",
    timestamp: "05/05 18:37",
    isReported: false,
    isStarred: false,
    upCount: 35,
    imageUrls: [
      "https://i.namu.wiki/i/NSZu9w4DRwEPOCgPSzvs4sAZlxfMBoxZLCZQgM_O4wRH8jN0guRfBiLURu-Tno5p-Q2aw5e5gy9gLJsnYKlq8Q.webp",
    ],
    comments: [
      Comment(
        author: Profile(
          school: "충남대학교",
          avatarUrl:
              "https://static.vecteezy.com/system/resources/previews/015/078/556/non_2x/man-employee-illustration-on-a-background-premium-quality-symbols-icons-for-concept-and-graphic-design-vector.jpg",
          username: '유니버스 1',
        ),
        text: '당연히 찍먹이 진리 아니야?',
        timestamp: '05/05 18:40',
        replies: [
          Comment(
            author: Profile(
              school: "한남대학교",
              avatarUrl:
                  "https://img.freepik.com/free-psd/3d-render-of-avatar-character_23-2150611731.jpg",
              username: '개쩌는 글쓴이',
            ),
            text: '그치!! 나도 찍먹이 진리라고 생각해',
            timestamp: '05/05 18:41',
          ),
          Comment(
            author: Profile(
              school: "서울대학교",
              avatarUrl:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR0F-f4OneMLn_LUt3n2KJNi5TAipH6Jguy-Q&s",
              username: '지나가는 서울대생',
            ),
            text: '? 무슨 미친소리야 당연히 부먹이지;;',
            timestamp: '05/05 18:43',
          ),
        ],
      ),
      Comment(
        author: Profile(
          school: "한양대학교",
          avatarUrl:
              "https://static.vecteezy.com/system/resources/previews/015/078/556/non_2x/man-employee-illustration-on-a-background-premium-quality-symbols-icons-for-concept-and-graphic-design-vector.jpg",
          username: '유니버스 2',
        ),
        text: '와 탕수육 먹고 싶다.. ㅠ',
        timestamp: '05/05 18:43',
        replies: [
          Comment(
            author: Profile(
              school: "우송대학교",
              avatarUrl:
                  "https://static.vecteezy.com/system/resources/previews/015/078/556/non_2x/man-employee-illustration-on-a-background-premium-quality-symbols-icons-for-concept-and-graphic-design-vector.jpg",
              username: "유니버스 3",
            ),
            text: '탕수육 사먹어..',
            timestamp: '05/05 18:48',
          ),
          Comment(
            author: Profile(
              school: "한양대학교",
              avatarUrl:
                  "https://static.vecteezy.com/system/resources/previews/015/078/556/non_2x/man-employee-illustration-on-a-background-premium-quality-symbols-icons-for-concept-and-graphic-design-vector.jpg",
              username: '유니버스 2',
            ),
            text: '돈이없서... ㅠㅠㅠㅠㅠ',
            timestamp: '05/05 18:53',
          )
        ],
      ),
    ],
  ),
  Article(
    author: Profile(
      school: "연세대학교",
      avatarUrl:
          "https://static.vecteezy.com/system/resources/previews/015/078/556/non_2x/man-employee-illustration-on-a-background-premium-quality-symbols-icons-for-concept-and-graphic-design-vector.jpg",
      username: "유니",
    ),
    content: "애들아!! 어린이날인데 지금 모해??",
    timestamp: "05/05 11:47",
    imageUrls: [],
    upCount: 3,
    comments: [
      Comment(
        author: Profile(
          username: "유니버스 1",
          school: "강원대학교",
          avatarUrl:
              "https://static.vecteezy.com/system/resources/previews/015/078/556/non_2x/man-employee-illustration-on-a-background-premium-quality-symbols-icons-for-concept-and-graphic-design-vector.jpg",
        ),
        text: "나 집에서 딩구르르~",
        timestamp: "05/05 13:22",
      ),
      Comment(
        author: Profile(
          username: "유니버스 2",
          school: "과천대학교",
          avatarUrl:
              "https://static.vecteezy.com/system/resources/previews/015/078/556/non_2x/man-employee-illustration-on-a-background-premium-quality-symbols-icons-for-concept-and-graphic-design-vector.jpg",
        ),
        text: "나 여친이랑 데이트중 ㅎㅎ",
        timestamp: "05/05 17:54",
      ),
    ],
  ),
  Article(
    author: Profile(
      username: "유니",
      school: "배재대학교",
      avatarUrl:
          "https://static.vecteezy.com/system/resources/previews/015/078/556/non_2x/man-employee-illustration-on-a-background-premium-quality-symbols-icons-for-concept-and-graphic-design-vector.jpg",
    ),
    content: "울 학교 나섬이 너무 귀엽지 않아 ㅠㅠ??",
    timestamp: "03/27 20:48",
    isReported: false,
    isStarred: false,
    upCount: 10,
    imageUrls: [
      "https://yt3.googleusercontent.com/QNwqVIbPkuOR1hRHDd6hxo_4t6w-A4Qb3pMuPHQ74EY-QQrqcYlxluQqRbpPZC4H4xAxvbG_-Jw=s900-c-k-c0x00ffffff-no-rj",
    ],
    comments: [
      Comment(
        author: Profile(
          school: "충남대학교",
          avatarUrl:
              "https://static.vecteezy.com/system/resources/previews/015/078/556/non_2x/man-employee-illustration-on-a-background-premium-quality-symbols-icons-for-concept-and-graphic-design-vector.jpg",
          username: '유니버스 1',
        ),
        text: '너네도 키링같은거 나눠줘?? 나도 가지고싶다!',
        timestamp: '03/27 21:05',
        replies: [
          Comment(
            author: Profile(
              school: "배재대학교",
              avatarUrl:
                  "https://static.vecteezy.com/system/resources/previews/015/078/556/non_2x/man-employee-illustration-on-a-background-premium-quality-symbols-icons-for-concept-and-graphic-design-vector.jpg",
              username: '유니',
            ),
            text: '다음에 우리 만나게 되면 내가 선물할게',
            timestamp: '03/27 21:06',
          ),
          Comment(
            author: Profile(
              school: "충남대학교",
              avatarUrl:
                  "https://static.vecteezy.com/system/resources/previews/015/078/556/non_2x/man-employee-illustration-on-a-background-premium-quality-symbols-icons-for-concept-and-graphic-design-vector.jpg",
              username: '유니버스 1',
            ),
            text: '헐 미친 고마워!',
            timestamp: '03/27 21:08',
          ),
        ],
      ),
      Comment(
        author: Profile(
          school: "한양대학교",
          avatarUrl:
              "https://static.vecteezy.com/system/resources/previews/015/078/556/non_2x/man-employee-illustration-on-a-background-premium-quality-symbols-icons-for-concept-and-graphic-design-vector.jpg",
          username: '유니버스 2',
        ),
        text: '나섬이 정말 귀엽다!',
        timestamp: '03/27 21:18',
      ),
    ],
  ),
];
