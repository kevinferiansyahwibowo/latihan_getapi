import 'package:flutter/material.dart';
import 'package:latihan_getapi/api/service.dart';
import 'package:latihan_getapi/model/user.dart';
import 'package:latihan_getapi/ui/widget.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});
  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  late Future<UserResponse> _userData;
  @override
  void initState() {
    super.initState();
    _userData = ApiService().userData();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Dashboard',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),
          centerTitle: true,
          toolbarHeight: 70,
          backgroundColor: Colors.purple.shade200,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 20),
            child: Column(children: [
              const SizedBox(
                height: 20,
              ),
              FutureBuilder<UserResponse>(
                future: _userData,
                builder: (context, AsyncSnapshot<UserResponse> snapshot) {
                  var state = snapshot.connectionState;
                  if (state != ConnectionState.done) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: snapshot.data?.data.length,
                        itemBuilder: (context, index) {
                          var listData = snapshot.data?.data[index];
                          return Padding(
                            padding: const EdgeInsets.fromLTRB(20.0, 8, 20, 8),
                            child: Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 6,
                                        color: Colors.purple.shade300),
                                    borderRadius: BorderRadius.circular(10)),
                                child: ListWidget(listData: listData!)),
                          );
                        },
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Material(
                          child: Text(snapshot.error.toString()),
                        ),
                      );
                    } else {
                      return const Material(child: Text(''));
                    }
                  }
                },
              )
            ]),
          ),
        ));
  }
}
