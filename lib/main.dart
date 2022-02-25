import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/helpers/extensions/IntExt.dart';
import 'package:login_app/helpers/extensions/StringExt.dart';
import 'package:login_app/helpers/extensions/WidgetExt.dart';
import 'package:login_app/helpers/widgets/Background.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          inputDecorationTheme: InputDecorationTheme(
            focusedBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white.withOpacity(0.5))),
            hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
          )),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var page = 0.obs;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Background(
        child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              print("height${constraints.maxHeight}");
            return SingleChildScrollView(
              padding: EdgeInsets.only(left: constraints.maxWidth*.08,right: constraints.maxWidth*.08),
              child
                  : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: const EdgeInsets.only( top: 12),
                      child: Image.asset(
                        'assets/logo.png',
                        height:  constraints.maxHeight>800?100:60,
                      )),
                  SizedBox(height: constraints.maxHeight>800?constraints.maxHeight*.15:constraints.maxHeight*.1,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //Login(constraints,divider),
                      Obx(() => page.value == 0
                          ? Login()
                          : Signup()),
                      constraints.maxWidth>1000?Container(
                        padding: EdgeInsets.only(right: constraints.maxWidth*0.1),
                        //child: Lottie.asset('assets/caller.json', width: constraints.maxWidth*0.3,height:constraints.maxWidth*0.3 ),
                      ):SizedBox(),
                    ],
                  ),
                ],
              ),
            );

        }),
      ),
    );
  }


  Widget Login() {
    return Container(
      child: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            'Login to your account.'.text(size: Get.width>800?50:30),
            8.height,
            'Enter your credential to access your account'
                .text(size: 20, color: Colors.grey),
            48.height,
            Container(
              width: 400,
              child: Column(
                children: [
                  Container(
                    constraints: BoxConstraints(maxWidth: 400),
                    child: const TextField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Username',
                      ),
                    ),
                  ),
                  12.height,
                  Container(
                    constraints: BoxConstraints(maxWidth: 400),
                    child: const TextField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Password',
                      ),
                    ),
                  ),
                  12.height,
                  TextButton(onPressed: () {}, child: 'Forgot Password?'.text())
                      .topRight,
                  50.height,
                  Container(
                      width: 400,
                      constraints: BoxConstraints(maxWidth: 400),
                      height: 50,
                      child: ElevatedButton(
                          onPressed: () {}, child: const Text('Log in'))),
                  12.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      'Don\'t have an account?'
                          .text(size: 18, color: Colors.grey),
                      TextButton(
                          onPressed: () {
                            page.value = 1;
                          },
                          child: 'Register'.text(size: 18, color: Colors.white))
                    ],
                  ),
                ],
              ),
            ),
            24.width
          ],
        ),
      ),
    );
  }

  Widget Signup() {
    return Container(

      child: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            'Create new account.'.text(size:  Get.width>800?50:30),
            8.height,
            'Fill the following details to create your account.'
                .text(size:  Get.width>800?20:16, color: Colors.grey),
            48.height,
            Container(
              constraints: BoxConstraints(
                maxWidth:  Get.width<600?Get.width:400,
              ),
              child: Column(
                children: [
                  TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Full name',
                    ),
                  ),
                  12.height,
                  const TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Email',
                    ),
                  ),
                  12.height,
                  const TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Mobile',
                    ),
                  ),
                  50.height,
                  Container(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                          onPressed: () {}, child: const Text('Sign up'))),
                  12.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      'Already have an account?'
                          .text(size: 18, color: Colors.grey),
                      TextButton(
                        onPressed: () {
                          page.value = 0;
                        },
                        child: 'Log In'.text(size: 18, color: Colors.white),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
