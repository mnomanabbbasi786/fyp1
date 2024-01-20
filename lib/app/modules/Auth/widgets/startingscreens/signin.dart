import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fyp1/app/modules/home/landing.dart';
import 'package:supabase/supabase.dart';
import '../startingscreens/forgetpass1.dart';
import '../startingscreens/register.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Signin extends StatefulWidget {
  const Signin({
    Key? key,
  }) : super(key: key);

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool obsecure = true;
  bool isChecked = false;

  Future<void> signIn() async {
    final response = await Supabase.instance.client.auth.signInWithPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );

    if (response.user != null) {
      // Successfully signed in, navigate to the landing screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Landing()),
      );
    } else {
      // Handle sign-in error
      print('Error: INVALID CERENDENTIALS');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.center,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/login111.png'),
                fit: BoxFit.cover,
              ),
            ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.08,
                    ),
                    child: Container(
                      decoration: BoxDecoration(),
                      height: MediaQuery.of(context).size.height * 0.55,
                      width: MediaQuery.of(context).size.width * 0.90,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height * 0.05,
                        ),
                        child: Column(
                          children: [
                            Column(
                              children: [
                                Text.rich(
                                  textAlign: TextAlign.justify,
                                  TextSpan(
                                    text: 'Welcome\n',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.045,
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text:
                                            'By signing in you are agreeing to\n',
                                        style: TextStyle(
                                          color: Color.fromRGBO(94, 94, 94, 1),
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.016,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      TextSpan(
                                        text: 'our ',
                                        style: TextStyle(
                                          color: Color.fromRGBO(94, 94, 94, 1),
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.016,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      TextSpan(
                                        text: 'terms and policy',
                                        style: TextStyle(
                                          color: Colors.blueAccent,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.016,
                                          fontWeight: FontWeight.bold,
                                          decoration: TextDecoration.underline,
                                        ),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {},
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                vertical:
                                    MediaQuery.of(context).size.height * 0.02,
                              ),
                            ),
                            TextFormField(
                              autofocus: true,
                              controller: _emailController,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                iconColor: Colors.grey,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    MediaQuery.of(context).size.height * 0.01,
                                  ),
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                  ),
                                ),
                                hintText: "Email Address",
                                suffixIcon: Icon(Icons.mail),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter some text";
                                }

                                if (!value.contains("@")) {
                                  return "Please enter the correct email format";
                                }

                                return null;
                              },
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                vertical:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                            ),
                            TextFormField(
                              autofocus: true,
                              obscureText: obsecure,
                              controller: _passwordController,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                iconColor: Colors.grey,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    MediaQuery.of(context).size.height * 0.01,
                                  ),
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                  ),
                                ),
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    obsecure = !obsecure;
                                    setState(() {});
                                  },
                                  child: Icon(obsecure
                                      ? Icons.visibility_off
                                      : Icons.visibility),
                                ),
                                hintText: "Password",
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter your password";
                                }

                                if (value.length < 8 || value.length > 20) {
                                  return "Password length should be at least 8 characters long";
                                }

                                return null;
                              },
                            ),
                            CheckboxListTile(
                              title: const Text('Remember me'),
                              autofocus: false,
                              activeColor: Colors.grey,
                              checkColor: Colors.white,
                              selected: isChecked,
                              value: isChecked,
                              onChanged: (value) {
                                setState(() {
                                  isChecked = value!;
                                });
                              },
                              controlAffinity: ListTileControlAffinity.leading,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.width * 0.15,
                      left: MediaQuery.of(context).size.width * 0.08,
                      right: MediaQuery.of(context).size.width * 0.08,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton(
                              onPressed: signIn,
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: Colors.blue,
                                minimumSize: Size(
                                  MediaQuery.of(context).size.width * 0.25,
                                  MediaQuery.of(context).size.height * 0.05,
                                ),
                                padding: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.height * 0.05,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      MediaQuery.of(context).size.height * 0.05,
                                    ),
                                  ),
                                ),
                              ),
                              child: const Text('Login'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Register(),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.blue,
                                backgroundColor: Colors.white,
                                minimumSize: Size(
                                  MediaQuery.of(context).size.width * 0.25,
                                  MediaQuery.of(context).size.height * 0.05,
                                ),
                                padding: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.height * 0.05,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      MediaQuery.of(context).size.height * 0.05,
                                    ),
                                  ),
                                ),
                              ),
                              child: const Text('Register'),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.05,
                          ),
                          child: Row(
                            children: [
                              Text(
                                "Don't remember your password? ",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      MediaQuery.of(context).size.height * 0.02,
                                ),
                              ),
                              TextButton(
                                child: Text(
                                  "Click here",
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ForgetPass1(),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Text(
                          "Login with touch id",
                          style: TextStyle(color: Color.fromARGB(190, 0, 0, 0)),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.072,
                          width: MediaQuery.of(context).size.height * 0.072,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.white),
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.fingerprint_outlined),
                            iconSize:
                                MediaQuery.of(context).size.height * 0.045,
                            color: Colors.white,
                            tooltip: 'IconButton',
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
