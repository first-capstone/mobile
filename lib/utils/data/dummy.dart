import 'package:union/utils/model/article.dart';
import 'package:union/utils/model/comment.dart';
import 'package:union/utils/model/profile.dart';

// 기본 프로필 URL "https://static.vecteezy.com/system/resources/previews/015/078/556/non_2x/man-employee-illustration-on-a-background-premium-quality-symbols-icons-for-concept-and-graphic-design-vector.jpg"

final List<Article> dummyArticleList = [
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
