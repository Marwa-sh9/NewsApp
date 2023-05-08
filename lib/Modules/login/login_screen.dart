 import 'package:flutter/material.dart';
import 'package:newsapp/Shared/Components/components.dart';
// import 'package:umedy_flutter/Shared/Components/components.dart';

class loginscreen extends StatefulWidget {
  @override
  _loginscreenState createState() => _loginscreenState();
}

class _loginscreenState extends State<loginscreen> {
  var useremail = TextEditingController();

  var userpassword = TextEditingController();

  var formkey= GlobalKey<FormState>();

  bool isPasswordshow = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        shadowColor: Colors.green,
        elevation: 5.5,
        leading: Icon(
          Icons.menu,
          color:Colors.black,
        ),
        title:Text('Log in' , style: TextStyle
          (
           color:Colors.black,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body:
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(50.0),
            child:
            Center(
              child: SingleChildScrollView(
                child: Form(
                  key:formkey,
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Login',
                        style: TextStyle(
                          // color:Colors.red,
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,

                        ),
                      ),
                      SizedBox(
                        height:30.0,

                      ),
                      defaultFormField(
                        controller: useremail,
                        lable: 'Email',
                        prefixIc: Icons.email,
                        type: TextInputType.emailAddress,
                        validate: (value){
                          if(value!.isEmpty)
                          {
                            return 'Email empty ! ';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height:20.0,

                      ),
                      defaultFormField(
                        ispassword: isPasswordshow ,
                        controller: userpassword,
                        lable: 'Password',
                        prefixIc: Icons.lock,
                        type: TextInputType.visiblePassword,
                        suffixIc:isPasswordshow?Icons.visibility :Icons.visibility_off ,
                        onpress: (){
                          setState(() {
                            isPasswordshow=!isPasswordshow;
                          });
                        },
                        validate: (value){
                          if(value!.isEmpty)
                          {
                            return 'password empty ! ';
                          }
                          return null;
                        },
),
                      SizedBox(
                        height:40.0,

                      ),
                      defaultButton(
                        width:double.infinity,
                        color:Colors.greenAccent,
                        text:'login',
                        function: ()
                          {
                            if(formkey.currentState!.validate())
                            {
                              Navigator.of(context).pushNamed("messenger_screen");
                            }
                            },
                      ),
                      SizedBox(
                        height:10.0,

                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Don\'t have an account?  '),
                          TextButton(
                            onPressed: (){
                            },
                            child: Text('Register Now'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
