
import 'package:flutter/material.dart';
import 'package:parking_space/constant/app_colors.dart';
import 'package:parking_space/constant/app_strings.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.black,
        title: const Text(AppStrings.parkingTitle,style: TextStyle(color: AppColors.white),),
      ),
      body:  Center(
        child: Container(
            alignment: Alignment.center,
              padding: const EdgeInsets.all(20),
              child: GridView.count(
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  childAspectRatio: .90,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {

                        Navigator.pushNamed(context, '/AllRegisteredSpace');
                      },
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Image.asset('resources/assets/png/parking.png',height: 50,width: 50),
                              const Padding(
                              padding:  EdgeInsets.all(8.0),
                              child:  Text('All Spaces'),
                            )],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/BookSlot');
                      },
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children:  <Widget>[
                              Image.asset('resources/assets/png/allocated.png',height: 50,width: 50), const Padding(
                              padding:  EdgeInsets.all(8.0),
                              child: Text('Book Slot'),
                            )],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/DeleteSlot');
                      },
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children:  <Widget>[
                              Image.asset('resources/assets/png/exit.png',height: 50,width: 50,),
                              const Padding(
                                padding:  EdgeInsets.all(8.0),
                                child: Text('Delete Slot'),
                              )],
                          ),
                        ),
                      ),
                    ),

                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/DeleteSpace');
                      },
                      child: Container(
                        child: Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children:  <Widget>[Image.asset('resources/assets/png/delete_space.png',height: 50,width: 50),
                                const Padding(
                                padding:  EdgeInsets.all(8.0),
                                child: Text('Delete Space'),
                              )],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ])),
      ),
    );
  }
}
