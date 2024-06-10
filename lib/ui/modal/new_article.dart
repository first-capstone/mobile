import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NewArticle extends StatefulWidget {
  const NewArticle({super.key, required this.addArticle});

  final Function(String content, bool isAnonymouse) addArticle;

  @override
  State<NewArticle> createState() => _NewArticleState();
}

class _NewArticleState extends State<NewArticle> {
  final GlobalKey<ScaffoldState> _modalScaffoldKey = GlobalKey<ScaffoldState>();

  final TextEditingController controller = TextEditingController();
  bool isAnonymous = false;

  @override
  Widget build(BuildContext context) {
    return CupertinoPopupSurface(
      isSurfacePainted: true,
      child: Scaffold(
        extendBody: false,
        key: _modalScaffoldKey,
        resizeToAvoidBottomInset: true,
        body: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      minimumSize: Size.zero, // Set this
                      padding: EdgeInsets.zero, // and this
                    ),
                    child: const Text('취소'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      minimumSize: Size.zero, // Set this
                      padding: EdgeInsets.zero, // and this
                    ),
                    child: const Text('게시'),
                    onPressed: () {
                      if (controller.text.trim().isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('내용을 입력하세요.'),
                          ),
                        );
                      } else {
                        widget.addArticle(controller.text, isAnonymous);
                        Navigator.pop(context);
                      }
                    },
                  ),
                ],
              ),
              Text(
                '게시글 쓰기',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: CupertinoTextField(
                  controller: controller,
                  placeholder: '내용을 입력하세요.',
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  expands: true,
                ),
              ),
              Row(
                children: [
                  IconButton(
                    icon: const FaIcon(FontAwesomeIcons.image),
                    onPressed: () {},
                  ),
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
