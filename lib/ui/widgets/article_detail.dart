import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ArticleDetail extends StatefulWidget {
  const ArticleDetail({super.key});

  @override
  State<ArticleDetail> createState() => _ArticleDetailState();
}

class _ArticleDetailState extends State<ArticleDetail> {
  bool isAnonymous = true;
  final TextEditingController _commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Article Detail'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
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
                              "https://static.vecteezy.com/system/resources/previews/015/078/556/non_2x/man-employee-illustration-on-a-background-premium-quality-symbols-icons-for-concept-and-graphic-design-vector.jpg",
                            ),
                          ),
                          SizedBox(width: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('유니',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Text('배재대학교',
                                  style: TextStyle(color: Colors.grey)),
                            ],
                          ),
                          Spacer(),
                          Text('03/27 20:48',
                              style: TextStyle(color: Colors.grey)),
                          SizedBox(width: 16),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Image.network(
                          "https://yt3.googleusercontent.com/QNwqVIbPkuOR1hRHDd6hxo_4t6w-A4Qb3pMuPHQ74EY-QQrqcYlxluQqRbpPZC4H4xAxvbG_-Jw=s900-c-k-c0x00ffffff-no-rj"),
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: Text(
                          '울 학교 나섬이 너무 귀엽지 않아 ㅠㅠ??',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.star_border),
                              color: Colors.grey,
                              onPressed: () => {},
                            ),
                            const SizedBox(width: 8),
                            const Text('UP 25687개',
                                style: TextStyle(color: Colors.grey)),
                            const Spacer(),
                            IconButton(
                              icon: const FaIcon(FontAwesomeIcons.solidBell),
                              color: Colors.red,
                              onPressed: () => {},
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: Divider(),
                      ),
                      _buildComment(
                        avatarUrl:
                            "https://static.vecteezy.com/system/resources/previews/015/078/556/non_2x/man-employee-illustration-on-a-background-premium-quality-symbols-icons-for-concept-and-graphic-design-vector.jpg",
                        username: '유니버스 1 (충남대학교)',
                        text: '너네도 귀여운건가 나섬이?? 나도 가지고싶다!',
                        timestamp: '03/27 21:05',
                        replies: [
                          _buildReply(
                            avatarUrl:
                                "https://static.vecteezy.com/system/resources/previews/015/078/556/non_2x/man-employee-illustration-on-a-background-premium-quality-symbols-icons-for-concept-and-graphic-design-vector.jpg",
                            username: '유니 (클로버)',
                            text: '다음에 우리 만나게 되면 내가 선물할게',
                            timestamp: '03/27 21:06',
                          ),
                        ],
                      ),
                      _buildComment(
                        avatarUrl:
                            "https://static.vecteezy.com/system/resources/previews/015/078/556/non_2x/man-employee-illustration-on-a-background-premium-quality-symbols-icons-for-concept-and-graphic-design-vector.jpg",
                        username: '유니버스 2 (한양대학교)',
                        text: '나섬이 정말 귀엽다!',
                        timestamp: '03/27 21:10',
                        replies: [],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    // border: Border.all(
                    //   color: Colors.grey[200] as Color,
                    //   width: 1,
                    // ),
                    color: Colors.grey[200],
                  ),
                  child: Row(
                    children: [
                      Checkbox(
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        value: isAnonymous,
                        onChanged: (value) {
                          setState(() {
                            isAnonymous = value!;
                          });
                        },
                      ),
                      const Text('익명'),
                      const SizedBox(width: 8),
                      Expanded(
                        child: TextField(
                          controller: _commentController,
                          decoration: const InputDecoration(
                            hintText: '댓글을 입력하세요.',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      IconButton(
                        icon: const Icon(Icons.send),
                        color: Colors.grey,
                        onPressed: () {
                          // Add your send comment logic here
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildComment({
    required String avatarUrl,
    required String username,
    required String text,
    required String timestamp,
    required List<Widget> replies,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 15,
                backgroundImage: NetworkImage(avatarUrl),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      username,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(text),
                    Text(
                      timestamp,
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
          ...replies,
        ],
      ),
    );
  }

  Widget _buildReply({
    required String avatarUrl,
    required String username,
    required String text,
    required String timestamp,
  }) {
    return Padding(
      padding: const EdgeInsets.only(left: 40, top: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.reply, size: 20, color: Colors.grey),
          const SizedBox(width: 8),
          CircleAvatar(
            radius: 15,
            backgroundImage: NetworkImage(avatarUrl),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  username,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(text),
                Text(
                  timestamp,
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
