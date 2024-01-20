import 'package:flutter/material.dart';
import '../startingscreens/signin.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

bool obsecure = true;

class _RegisterState extends State<Register> {
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isChecked = false;

  Future<void> register() async {
    final supabase = Supabase.instance.client;

    await supabase.auth.signUp(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );

    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Signin()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.center,
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/signup11.png'),
                fit: BoxFit.cover,
              ),
            ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Center(
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.055,
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        size: MediaQuery.of(context).size.height * 0.04,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.01,
                        ),
                        child: Container(
                          decoration: const BoxDecoration(),
                          height: MediaQuery.of(context).size.height * 0.6,
                          width: MediaQuery.of(context).size.width * 0.90,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical:
                                  MediaQuery.of(context).size.height * 0.05,
                            ),
                            child: Column(
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      'Sign Up\n',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.045,
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Create your account\n',
                                        style: TextStyle(
                                          color: const Color.fromRGBO(
                                              94, 94, 94, 1),
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.016,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical:
                                        MediaQuery.of(context).size.height *
                                            0.003,
                                  ),
                                ),
                                TextFormField(
                                  autofocus: true,
                                  controller: _usernameController,
                                  decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    iconColor: Colors.grey,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                        MediaQuery.of(context).size.height *
                                            0.01,
                                      ),
                                      borderSide: const BorderSide(
                                        color: Colors.transparent,
                                      ),
                                    ),
                                    hintText: "User Name",
                                    suffixIcon: const Icon(Icons.person),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Please enter a user name";
                                    }
                                    return null;
                                  },
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical:
                                        MediaQuery.of(context).size.height *
                                            0.007,
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
                                        MediaQuery.of(context).size.height *
                                            0.01,
                                      ),
                                      borderSide: const BorderSide(
                                        color: Colors.transparent,
                                      ),
                                    ),
                                    hintText: "Email Address",
                                    suffixIcon: const Icon(Icons.mail),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Please enter your email";
                                    }

                                    if (!value.contains("@")) {
                                      return "Please enter a valid email format";
                                    }

                                    return null;
                                  },
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical:
                                        MediaQuery.of(context).size.height *
                                            0.007,
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
                                        MediaQuery.of(context).size.height *
                                            0.01,
                                      ),
                                      borderSide: const BorderSide(
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
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical:
                                        MediaQuery.of(context).size.height *
                                            0.007,
                                  ),
                                ),
                                TextFormField(
                                  autofocus: true,
                                  obscureText: obsecure,
                                  decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    iconColor: Colors.grey,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                        MediaQuery.of(context).size.height *
                                            0.01,
                                      ),
                                      borderSide: const BorderSide(
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
                                    hintText: "Confirm Password",
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
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.width * 0.5,
                          left: MediaQuery.of(context).size.width * 0.11,
                          right: MediaQuery.of(context).size.width * 0.08,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ElevatedButton(
                                  onPressed: register,
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.white,
                                    backgroundColor: Colors.blue,
                                    minimumSize: Size(
                                      MediaQuery.of(context).size.width * 0.25,
                                      MediaQuery.of(context).size.height * 0.05,
                                    ),
                                    padding: EdgeInsets.symmetric(
                                      horizontal:
                                          MediaQuery.of(context).size.height *
                                              0.05,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(
                                          MediaQuery.of(context).size.height *
                                              0.05,
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
                          ],
                        ),
                      ),
                    ],
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
