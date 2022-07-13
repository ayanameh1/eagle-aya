// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:eagle/CN/get_all_expo_cn.dart';
import 'package:eagle/constants/colors.dart';
import 'package:eagle/ui/notification.dart';
import 'package:eagle/ui/profile.dart';
import 'package:eagle/ui/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';



class HomePageScreen extends StatelessWidget {
  const HomePageScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: ChangeNotifierProvider(
        create: (context) => GetAllExpo(),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 30.0,
              ),
              Text(
                "Happening Now",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Cermona',fontSize: MediaQuery.of(context).size.width * 60 / 1080,
                ),
                //style:Theme.of(context).textTheme.bodyText1,
              ),
              SizedBox(
                height: 30.0,
              ),
              expolist(),
            ],
          ),
        ),
      ),
    );
  }}



//list of all exhibitions
class expolist extends StatefulWidget {
  @override
  State<expolist> createState() => _expolistState();
}
class _expolistState extends State<expolist> {
  @override
  void initState() {
    super.initState();
    final allexpo = Provider.of<GetAllExpo>(context, listen: false);
    allexpo.getallexpoData();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<GetAllExpo>(
      builder: (context, allexpo, child) {
        return allexpo.loading?Center(
          child: SpinKitPouringHourGlassRefined(
            color: yellow1,
            size: MediaQuery.of(context).size.width * 500 / 1080,
          ),
        ): Expanded(
          child: ListView.builder(
              itemCount: allexpo.data?.length,
              itemBuilder: (context, i) {
                final pos = allexpo.data;
                final post = pos?[i];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: ExpoCard('${post?.id.toString()}'),
                );
              }),
        );
      },
    );
  }
}



//card design

class ExpoCard extends StatelessWidget {
  ExpoCard(this.name);
  var name;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            name,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 844 / 1080,
            height: MediaQuery.of(context).size.height * 465 / 1920,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              image: DecorationImage(
                  image: AssetImage('assets/images/ddd.png'), fit: BoxFit.fill),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                  offset: Offset(4, 8), // Shadow position
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}