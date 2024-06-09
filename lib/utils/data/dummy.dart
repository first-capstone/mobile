import 'package:union/utils/model/article.dart';
import 'package:union/utils/model/comment.dart';
import 'package:union/utils/model/profile.dart';

const String dummyDefaultProfileImageUrl =
    "https://static.vecteezy.com/system/resources/previews/015/078/556/non_2x/man-employee-illustration-on-a-background-premium-quality-symbols-icons-for-concept-and-graphic-design-vector.jpg";

final List<Article> dummyArticleList = [
  Article(
      author: Profile(
        username: "유니",
        school: "배재대학교",
        avatarUrl: dummyDefaultProfileImageUrl,
      ),
      content: "울 학교 나섬이 너무 귀엽지 않아 ㅠㅠ??",
      timestamp: "03/27 20:48",
      isReported: false,
      isStarred: false,
      upCount: 10,
      imageUrl:
          "https://yt3.googleusercontent.com/QNwqVIbPkuOR1hRHDd6hxo_4t6w-A4Qb3pMuPHQ74EY-QQrqcYlxluQqRbpPZC4H4xAxvbG_-Jw=s900-c-k-c0x00ffffff-no-rj",
      comments: [
        Comment(
          author: Profile(
            school: "충남대학교",
            avatarUrl: dummyDefaultProfileImageUrl,
            username: '유니버스 1',
          ),
          text: '너네도 키링같은거 나눠줘?? 나도 가지고싶다!',
          timestamp: '03/27 21:05',
          replies: [
            Comment(
              author: Profile(
                school: "배재대학교",
                avatarUrl: dummyDefaultProfileImageUrl,
                username: '유니',
              ),
              text: '다음에 우리 만나게 되면 내가 선물할게',
              timestamp: '03/27 21:06',
            ),
            Comment(
              author: Profile(
                school: "충남대학교",
                avatarUrl: dummyDefaultProfileImageUrl,
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
            avatarUrl: dummyDefaultProfileImageUrl,
            username: '유니버스 2',
          ),
          text: '나섬이 정말 귀엽다!',
          timestamp: '03/27 21:18',
        ),
      ])
];
