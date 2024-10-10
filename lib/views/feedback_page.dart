import 'package:flutter/material.dart';
import 'package:pagination/components/custom_input.dart';
import 'package:pagination/services/firestore_service.dart';

class FeedbackPage extends StatelessWidget {
  const FeedbackPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Feedbacks'),
      ),
      body: ListView.separated(
        itemCount: 24,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(),
            title: Text("Khalifa do brega"),
            subtitle: Text("asdasdasdsadasd"),
            trailing: Text("10/10/24"),
          );
        },
        separatorBuilder: (context, index) => const Divider(),
      ),
      bottomNavigationBar: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomInput(
                controller: TextEditingController(),
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
                await FirestoreService().postFeedback('asdasdsad');
              },
              child: const Icon(Icons.send),
            ),
          ),
        ],
      ),
    );
  }
}
