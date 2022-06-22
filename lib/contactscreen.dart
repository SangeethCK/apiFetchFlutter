import 'package:chatpage/model/usermodel.dart';
import 'package:chatpage/service/apifetch.dart';
import 'package:flutter/material.dart';

class contactscreen extends StatefulWidget {
  const contactscreen({Key? key}) : super(key: key);

  @override
  State<contactscreen> createState() => _contactscreenState();
}

class _contactscreenState extends State<contactscreen> {
  ApiFetch _apiFetch = ApiFetch();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Contacts',
          style: TextStyle(color: Colors.black),
        ),
        leading: const Icon(
          Icons.menu,
          color: Colors.blue,
        ),
        actions: const [
          Icon(
            Icons.search,
            color: Colors.blue,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: FutureBuilder<List<UserModel>>(
        future: _apiFetch.apiGet(),
        builder: (BuildContext context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          }
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (BuildContext context, int index) {
              var data = snapshot.data;
              return ListTile(
                  leading: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(data![index].picture),
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    height: 50,
                    width: 50,
                  ),
                  title: Text(data[index].firstName),
                  subtitle: Text(data[index].lastName));
            },
          );
        },
      ),
    );
  }
}
