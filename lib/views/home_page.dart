import 'package:flutter/material.dart';
import 'package:pagination/services/get_users.dart';
import 'package:pagination/views/detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 0, 0, 0.1),
      drawer: const Drawer(),
      appBar: AppBar(
        title: const Text("HomePage"),
      ),
      body: Column(children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(8, (index) {
              return Container(
                margin: const EdgeInsets.all(8),
                child: const CircleAvatar(
                  radius: 40,
                ),
              );
            }),
          ),
        ),
        Expanded(
          child: FutureBuilder(
              future: getUsers(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                } else {
                  snapshot.data[0]['firstName'] = "Khalifa do Brega";
                  snapshot.data[0]['company']['title'] = "Cantor";
                  snapshot.data[0]['image'] =
                      "data:image/jpeg;base64,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";
                  snapshot.data[2]['image'] = "https://avatars.githubusercontent.com/u/112215288?v=4";
                  return GridView.builder(
                      itemCount: snapshot.data.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              childAspectRatio: 0.85),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailPage(
                                  user: snapshot.data[index],
                                ),
                              ),
                            );
                            getUsers();
                          },
                          child: Container(
                            color: Colors.white,
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  CircleAvatar(
                                    radius: 60,
                                    backgroundImage: NetworkImage(
                                        snapshot.data[index]['image']),
                                  ),
                                  Text(
                                    snapshot.data[index]['firstName'],
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(snapshot.data[index]['company']['title'])
                                ]),
                          ),
                        );
                      });
                }
              }),
        )
      ]),
    );
  }
}
