import 'package:eagle/components/components.dart';
import 'package:eagle/constants/colors.dart';
import 'package:flutter/material.dart';
import 'add_expo2.dart';

class AddExpoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var sizeAware = MediaQuery.of(context).size;
    TextEditingController fnamecontroller = TextEditingController();
    TextEditingController lnamecontroller = TextEditingController();
    TextEditingController postitlecontroller = TextEditingController();
    TextEditingController phone1controller = TextEditingController();
    TextEditingController curaddresscontroller = TextEditingController();
    TextEditingController emailaddresscontroller = TextEditingController();
    TextEditingController compnamecontroller = TextEditingController();
    TextEditingController phone2controller = TextEditingController();
    TextEditingController busemailcontroller = TextEditingController();
    TextEditingController faxnumcontroller = TextEditingController();
    TextEditingController countrycontroller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          child: Image.asset('assets/images/Group 8.png'),
          width: sizeAware.width * 257 / 1080,
          height: sizeAware.height * 146 / 160,
        ),
        shadowColor: Colors.black.withOpacity(0.5),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 20.0),
          child: SafeArea(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(height: sizeAware.height * 40 / 1920),
              Container(
                width: sizeAware.width * 500 / 1080,
                height: sizeAware.width * 190 / 1920,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: darkpurple,
                ),
                child: Center(
                  child: Text(
                    'Step 1',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: white,
                      fontFamily: 'Uniform',
                      fontWeight: FontWeight.bold,
                      //fontSize: 30,
                    ),
                  ),
                ),
              ),
              SizedBox(height: sizeAware.height * 124 / 1920),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Personl informaiton'),
                        ],
                      ),
                      SizedBox(
                        height: sizeAware.height * 47 / 1920,
                      ),
                      SizedBox(
                        height:sizeAware.height * 100 / 1920,
                        child: defaulTexttFormField(
                          controller: fnamecontroller,
                          label: 'First name',
                          validate: (String? value) {
                            if (value == null || value.trim().length == 0) {
                              return 'first name  must not be empty';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: sizeAware.height * 28 / 1920,
                      ),
                      defaulTexttFormField(
                        controller: lnamecontroller,
                        label: 'Last Name',
                        validate: (String? value) {
                          if (value == null || value.trim().length == 0) {
                            return 'last name  must not be empty';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: sizeAware.height * 28 / 1920,
                      ),
                      defaulTexttFormField(
                          controller: postitlecontroller,
                          label: 'Position Title',
                          validate: (String? value) {
                            if (value == null || value.trim().length == 0) {
                              return 'position title must not be empty';
                            }
                            return null;
                          }),
                      SizedBox(
                        height: sizeAware.height * 28 / 1920,
                      ),
                      defaulTexttFormField(
                          controller: phone1controller,
                          label: 'Phone Number',
                          validate: (String? value) {
                            if (value == null || value.trim().length == 0) {
                              return 'phone number must not be empty';
                            }
                            return null;
                          }),
                      SizedBox(
                        height: sizeAware.height * 28 / 1920,
                      ),
                      defaulTexttFormField(
                          controller: curaddresscontroller,
                          label: 'Current Address',
                          validate: (String? value) {
                            if (value == null || value.trim().length == 0) {
                              return 'current address must not be empty';
                            }
                            return null;
                          }),
                      SizedBox(
                        height: sizeAware.height * 28 / 1920,
                      ),
                      defaulTexttFormField(
                          controller: emailaddresscontroller,
                          label: 'Email Address',
                          validate: (String? value) {
                            if (value == null || value.trim().length == 0) {
                              return 'email Addressr must not be empty';
                            }
                            return null;
                          })
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.grey[200],
                    border: Border.all(
                      width: 1,
                    )),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Company informaiton'),
                        ],
                      ),
                      SizedBox(
                        height: sizeAware.height * 47 / 1920,
                      ),
                      defaulTexttFormField(
                        controller: compnamecontroller,
                        label: 'Company name',
                        validate: (String? value) {
                          if (value == null || value.trim().length == 0) {
                            return 'company name  must not be empty';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: sizeAware.height * 28 / 1920,
                      ),
                      defaulTexttFormField(
                        controller: phone2controller,
                        label: 'Phone Number',
                        validate: (String? value) {
                          if (value == null || value.trim().length == 0) {
                            return 'phone number  must not be empty';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: sizeAware.height * 28 / 1920,
                      ),
                      defaulTexttFormField(
                        controller: busemailcontroller,
                        label: 'Business email',
                        validate: (String? value) {
                          if (value == null || value.trim().length == 0) {
                            return 'business email must not be empty';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: sizeAware.height * 28 / 1920,
                      ),
                      defaulTexttFormField(
                          controller: faxnumcontroller,
                          label: 'Fax Number',
                          validate: (String? value) {
                            if (value == null || value.trim().length == 0) {
                              return 'fax number must not be empty';
                            }
                            return null;
                          }),
                      SizedBox(
                        height: sizeAware.height * 28 / 1920,
                      ),
                      defaulTexttFormField(
                          controller: countrycontroller,
                          label: 'Country',
                          validate: (String? value) {
                            if (value == null || value.trim().length == 0) {
                              return 'fax number must not be empty';
                            }
                            return null;
                          })
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.grey[200],
                    border: Border.all(
                      width: 1,
                    )),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            'Plaese provide a brochure to make it easier for visitor to understand your work and connect with you',
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: sizeAware.height * 47 / 1920,
                    ),
                  ]),
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.grey[200],
                    border: Border.all(
                      width: 1,
                    )),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            'How to would you like to present your product?',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: sizeAware.height * 47 / 1920,
                    ),
                  ]),
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.grey[200],
                    border: Border.all(
                      width: 1,
                    )),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 202 / 1920,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 359 / 1080,
                height: MediaQuery.of(context).size.height * 82 / 1920,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddExpo2Screen(),
                      ),
                    );
                  },
                  child: Text(
                    "Next",
                    style: TextStyle(
                      color: black,
                      fontFamily: 'Uniform',
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(54),
                    color: yellow1,
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xff565656),
                        spreadRadius: 0,
                        blurRadius: 0,
                        offset: Offset(2, 4),
                      ),
                    ]),
              ),
            ]),
          ),
        ),
      ),
    );
  }
  Widget defaulTexttFormField({
    required TextEditingController controller,
    required String label,
    IconData? prefix,
    IconData? suffix,
    bool? obscuretext,
    Function()? onTap,
    Function(String)? onChanged,
    Function()? suffixPressed,
    Function(String)? onSubmit,
    TextInputType? type,
    String Phone = '',
    required String? Function(String?)? validate,
    bool isPassword = false,
  }) =>
      TextFormField(
        validator: validate,
        keyboardType: type,
        onTap: onTap,
        obscureText: isPassword,
        onChanged: onChanged,
        onFieldSubmitted: onSubmit,
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            color: black,
            fontFamily: 'Uniform',
          ),
          prefixIcon: Icon(
            prefix,
          ),
          suffixIcon: suffix != null
              ? IconButton(
            onPressed: suffixPressed,
            icon: Icon(
              suffix,
            ),
          )
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(54),),),
          focusColor: Color(0xffffd100),
        ),
      );
}
