import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pagination/components/custom_input.dart';
import 'package:pagination/services/firestore_service.dart';

class FeedbackPage extends StatefulWidget {
  FeedbackPage({super.key});

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  TextEditingController messageController = TextEditingController();

  var feedbacks;

  @override
  void initState() {
    super.initState();
    feedbacks = FirestoreService().getFeedbacks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feedbacks'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          setState(() {
            feedbacks = FirestoreService().getFeedbacks();
          });
        },
        child: FutureBuilder(
          future: feedbacks,
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView.separated(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  Timestamp date = snapshot.data[index]['created_at'];
                  var formatDate =
                      DateFormat('dd/MM/yyyy').format(date.toDate());

                  return ListTile(
                    leading: const CircleAvatar(),
                    title: Text(snapshot.data[index]['user'].toString()),
                    subtitle: Text(snapshot.data[index]['message'].toString()),
                    trailing: Text(formatDate),
                  );
                },
                separatorBuilder: (context, index) => const Divider(),
              );
            }
          },
        ),
      ),
      bottomNavigationBar: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomInput(
                controller: messageController,
                labelText: "Digite sua mensagem",
                maxLines: 3,
                icon: const Icon(Icons.message),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            height: 50,
            child: ElevatedButton(
              onPressed: () {},
              child: const Icon(Icons.mic),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            height: 50,
            child: ElevatedButton(
              onPressed: () async {
                await FirestoreService().postFeedback(messageController.text);
                setState(() {
                  messageController.text = '';
                });
              },
              child: const Icon(Icons.send),
            ),
          ),
        ],
      ),
    );
  }
}
