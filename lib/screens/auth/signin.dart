import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  void _googleSignInProcess(BuildContext context) async {
    GoogleSignIn _googleSignIn = GoogleSignIn();
    GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    String? token = googleAuth?.idToken;
    // ResGoogleSignInModel _socialGoogleUser = ResGoogleSignInModel(
    //     displayName: googleUser?.displayName,
    //     email: googleUser?.email,
    //     photoUrl: googleUser?.photoUrl,
    //     id: googleUser?.id,
    //     token: token);
    // Fluttertoast.showToast(
    //     msg: googleUser!.email,
    //     backgroundColor: Colors.blue,
    //     textColor: Colors.white);
    // LogUtils.showLog("${_socialGoogleUser.toJson()}");
  }

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Container(
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              "assets/icons/logo.png",
              height: 100,
              width: 100,
            ),
          ),
          InkWell(
            onTap: () {
              _googleSignInProcess(context);
            },
            child: Container(
              width: deviceWidth,
              height: 50,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.black,
              ),
              child: const Center(
                  child: Text(
                "Google",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              )),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    ));
  }
}
