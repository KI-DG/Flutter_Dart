import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

// Uri URL을 쉽게 변환시켜주는 class
final homeUrl = Uri.parse('https://blog.codefactory.ai');

class HomeScreen extends StatelessWidget {

  WebViewController controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
  ..loadRequest(homeUrl);


  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('이기용'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              controller.loadRequest(homeUrl);
            },
            icon: Icon(
              Icons.home,
            ),
          )
        ],
      ),
      body: WebViewWidget(
        controller: controller,
      )
      // WebView(
      //   onWebViewCreated: (WebViewController controller) {
      //     this.controller = controller;
      //   },
      //   // 처음 화면은 어디로 갈지 정하는거
      //   initialUrl: homeUrl,
      //   // 유튜브 동영상 재생하기 위해서 사용
      //   javascriptMode: JavascriptMode.unrestricted,
      // ),
    );
  }
}
