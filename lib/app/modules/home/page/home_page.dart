import 'package:dio/dio.dart';
import 'package:ejemplo_lunes/app/modules/home/services/remote_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Este es el texto'),
            ElevatedButton(
                onPressed: () async {
                  await RemoteService(dio: Dio()).getPost();
                },
                child: const Text('Press '))
          ],
        ),
      ),
    );
  }
}
