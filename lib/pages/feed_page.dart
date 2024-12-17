import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_app_ui/model/post_model.dart';
import 'package:instagram_app_ui/model/story_model.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  final List<Story> _stories = [
    Story('assets/images/img_1.png', 'Shahlo'),
    Story('assets/images/img_2.png', 'Luiza'),
    Story('assets/images/img_6.png', 'Zarina'),
    Story('assets/images/img_4.png', 'Asal'),
    Story('assets/images/img_5.png', 'Mubin'),
    Story('assets/images/img_6.png', 'Iftixor'),
  ];

  final List<Post> _posts = [
    Post('Tursunxon', 'assets/images/img_5.png', 'assets/images/img_4.png',
        'Consequater nigil aliquid consequatur'),
    Post('Asalxon', 'assets/images/img.png', 'assets/images/img_6.png',
        'Consequater nigil aliquid consequatur'),
    Post('Iftixor', 'assets/images/img_4.png', 'assets/images/img_2.png',
        'Consequater nigil aliquid consequatur'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Divider(),
            // #sories
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Stories',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  Text(
                    'Watch All',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ],
              ),
            ),
            // #story_list
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(vertical: 10),
              height: 110,
              child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: _stories.map((story) {
                  return itemOfStory(story: story);
                }).toList(),
              ),
            ),
            // #post_list
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _posts.length,
                itemBuilder: (ctx, index) {
                  return _itemOfPost(post: _posts[index]);
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _itemOfPost({required Post post}) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          // #header
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Image(
                        image: AssetImage(post.userImage),
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(post.userName),
                  ],
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.more_horiz_outlined))
              ],
            ),
          ),
          FadeInImage(
            width: MediaQuery.of(context).size.width,
            image: AssetImage(post.postImage),
            fit: BoxFit.cover,
            placeholder: const AssetImage('assets/images/img_3.png'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {}, icon: const Icon(CupertinoIcons.heart)),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.mode_comment_outlined)),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.send)),
                ],
              ),
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.bookmark_border)),
            ],
          ),
          // #tags
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(horizontal: 14),
            child: RichText(
              softWrap: true,
              overflow: TextOverflow.visible,
              text: const TextSpan(children: [
                TextSpan(
                  text: "Liked By ",
                  style: TextStyle(color: Colors.black),
                ),
                TextSpan(
                  text: "Iftixor, ",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: "Luiza, ",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: "Mubin, ",
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: "Izzat ",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: "and ",
                  style: TextStyle(color: Colors.black),
                ),
                TextSpan(
                  text: "1 mln others ",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ]),
            ),
          ),
          // #caption
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(horizontal: 14,vertical: 5),
            child: RichText(
              softWrap: true,
              overflow: TextOverflow.visible,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "${post.userName} ",
                    style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.black),
                  ),
                  TextSpan(
                    text: post.caption,
                    style: const TextStyle(color: Colors.black),
                  ),
                ]
              ),
            ),
          ),

          // #post_date
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 14),
            alignment: Alignment.topLeft,
            child: const Text('February 2020',textAlign: TextAlign.start,style: TextStyle(color: Colors.grey),),
          )
        ],
      ),
    );
  }

  Widget itemOfStory({required Story story}) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(70),
            border: Border.all(width: 3, color: const Color(0xFF8e44ad)),
          ),
          child: Container(
            padding: const EdgeInsets.all(2),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(70),
              child: Image(
                image: AssetImage(story.image),
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(story.name),
      ],
    );
  }
}
