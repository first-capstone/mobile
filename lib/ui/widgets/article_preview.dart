import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:union/ui/widgets/article_detail.dart';

class ArticlePreview extends StatefulWidget {
  const ArticlePreview({
    super.key,
  });

  @override
  State<ArticlePreview> createState() => _ArticlePreviewState();
}

class _ArticlePreviewState extends State<ArticlePreview> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        const Row(
          children: [
            SizedBox(width: 16),
            CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(
                // TODO: 사용자 프로필 이미지, 데이터 연동 필요
                "https://static.vecteezy.com/system/resources/previews/015/078/556/non_2x/man-employee-illustration-on-a-background-premium-quality-symbols-icons-for-concept-and-graphic-design-vector.jpg",
              ), // Placeholder image
            ),
            SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('유니', // TODO: 사용자 이름, 데이터 연동 필요
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text('배재대학교', // TODO: 사용자 학교, 데이터 연동 필요
                    style: TextStyle(color: Colors.grey)),
              ],
            ),
            Spacer(),
            Text('03/27 20:48', // TODO: 데이터 연동 필요, 게시글 작성 시간 데이터
                style: TextStyle(color: Colors.grey)),
            SizedBox(width: 16),
          ],
        ),
        const SizedBox(height: 16),
        // TODO: 게시글 이미지가 있다면 null 체크를 이용해서 이미지를 불러오고, 없으면 아래 Image.network() 위젯을 불러 오지 않도록 해주세요.
        Image.network(
            "https://yt3.googleusercontent.com/QNwqVIbPkuOR1hRHDd6hxo_4t6w-A4Qb3pMuPHQ74EY-QQrqcYlxluQqRbpPZC4H4xAxvbG_-Jw=s900-c-k-c0x00ffffff-no-rj"),
        Row(
          children: [
            IconButton(
              icon: const Icon(FontAwesomeIcons.heart),
              color: Colors.grey,
              onPressed: () => {},
            ),
            IconButton(
              icon: const Icon(FontAwesomeIcons.comment),
              color: Colors.grey,
              onPressed: () => {
                Navigator.of(context, rootNavigator: true).push(
                  CupertinoPageRoute<bool>(
                    builder: (BuildContext context) => const ArticleDetail(),
                  ),
                )
              },
            ),
            const Spacer(),
            IconButton(
              icon: const FaIcon(FontAwesomeIcons.circleExclamation),
              color: Colors.red,
              onPressed: () => {},
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          child: Text('UP 25687개', // TODO: 데이터 연동 필요
              style: TextStyle(color: Colors.grey)),
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context, rootNavigator: true).push(
              CupertinoPageRoute<bool>(
                builder: (BuildContext context) => const ArticleDetail(),
              ),
            );
          },
          child: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  // TODO: 게시글 내용, 데이터 연동 필요
                  '울 학교 나섬이 너무 귀엽지 않아 ㅠㅠ??',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
        const Divider()
      ],
    );
  }
}
