import 'package:connectorapp/Marriage_related_own_posts/bridal_own_postDisplay.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:like_button/like_button.dart';

class OnlyBridalPosts extends StatefulWidget {
  const OnlyBridalPosts({super.key});

  @override
  State<OnlyBridalPosts> createState() => _OnlyBridalPostsState();
}

class _OnlyBridalPostsState extends State<OnlyBridalPosts> {
  List<Map<String, dynamic>> bridalPosts = [];
  List<Map<String, dynamic>> filteredPosts = [];
  var db = FirebaseFirestore.instance;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    getData();
    _searchController.addListener(_filterPosts);
    super.initState();
  }

  @override
  void dispose() {
    _searchController.removeListener(_filterPosts);
    _searchController.dispose();
    super.dispose();
  }

  void getData() async {
    final snapshot =
        await db
            .collection("posts")
            .where("serviceType", isEqualTo: "Bridal Makeup")
            .get();

    bridalPosts = snapshot.docs.map((doc) => doc.data()).toList();
    filteredPosts = bridalPosts;
    if (!mounted) return;
    setState(() {});
  }

  void _filterPosts() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      if (query.isEmpty) {
        filteredPosts = bridalPosts;
      } else {
        filteredPosts =
            bridalPosts.where((post) {
              final name = (post["name"] as String? ?? "").toLowerCase();
              final serviceType =
                  (post["serviceType"] as String? ?? "").toLowerCase();
              final location =
                  (post["location"] as String? ?? "").toLowerCase();

              return name.contains(query) ||
                  serviceType.contains(query) ||
                  location.contains(query);
            }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigoAccent,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.black,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: "Search Your Location",
              border: InputBorder.none,
              hintStyle: const TextStyle(color: Colors.white),
            ),
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.clear),
            onPressed: () {
              _searchController.clear();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child:
            filteredPosts.isEmpty
                ? const Center(child: Text("No matching posts found."))
                : ListView.builder(
                  itemCount: filteredPosts.length,
                  itemBuilder: (context, index) {
                    var post = filteredPosts[index];
                    return SizedBox(
                      height: 150,
                      child: Card(
                        color: Colors.white,
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) =>
                                        BridalOwnPostdisplay(post: post),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: ListTile(
                              leading: Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: CircleAvatar(
                                  backgroundImage: AssetImage(
                                    "assets/images/Dj-setup.jpg",
                                  ),
                                ),
                              ),
                              title: Text(post["companyName"] ?? "No name"),
                              subtitle: Row(
                                children: [
                                  Text(post["location"] ?? "No service"),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 120),
                                    child: LikeButton(
                                      size: 45,
                                      likeCount: 0,
                                      likeBuilder:
                                          (isLiked) => Icon(
                                            CupertinoIcons.hand_thumbsup_fill,
                                            color:
                                                isLiked
                                                    ? Colors.blue
                                                    : Colors.grey,
                                            size: 30,
                                          ),
                                      countBuilder: (likeCount, isLiked, text) {
                                        var color =
                                            isLiked ? Colors.blue : Colors.grey;
                                        return Text(count == 0 ? "Like" : text);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
      ),
    );
  }
}
