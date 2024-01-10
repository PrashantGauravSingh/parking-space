import 'package:flutter/material.dart';
import 'package:parking_space/Models/register_space_model.dart';
import 'package:parking_space/Providers/register_parking_provider.dart';
import 'package:parking_space/constant/app_colors.dart';
import 'package:parking_space/constant/app_strings.dart';
import 'package:provider/provider.dart';

class RegisterSpace extends StatelessWidget {
  const RegisterSpace({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var spaceIdController = TextEditingController();
    var spaceNameController = TextEditingController();

    //Method to register parking space

    Future<void> _registerParkingSpace() async {
      int spaceId=int.parse(spaceIdController.text.trim());
      String spaceName = spaceNameController.text.trim();

      GetRegisterSpaceModel getRegisterSpaceModel = GetRegisterSpaceModel( id:spaceId ,spaceName:spaceName);

      var provider = Provider.of<RegisterParkingProvider>(context, listen: false);
      await provider.registerParkingSpace(getRegisterSpaceModel);

    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title:  const Text(AppStrings.parkingRegister,style:  TextStyle(color: AppColors.white),),
        ),
        body:Consumer<RegisterParkingProvider>(builder: (context, data, child) {
    return Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.width*1,
              width: double.infinity,
              color: AppColors.black,
            ),
            Card(
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.width*0.8, left: 20, right: 20),
              elevation: 4,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
                    child: TextFormField(
                      controller:spaceIdController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          hintText: 'Space ID',
                          hintStyle: TextStyle(
                            fontSize: 16,
                            color: AppColors.black,
                          )),
                    ),
                  ),

                  Container(
                    margin: const EdgeInsets.only(bottom: 40, left: 20, right: 20),
                    child: TextFormField(
                      controller: spaceNameController,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                          hintText: 'Space Name',
                          hintStyle: TextStyle(
                            fontSize: 16,
                            color: AppColors.black,
                          )),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: (){
                _registerParkingSpace();
              },
              child: Container(
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.width*1.15, left: 25, right: 25, ),
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                height: 45,
                decoration: BoxDecoration(
                    color: AppColors.black,
                    border: Border.all(
                      color: AppColors.black,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(20))
                ),
                child: const Center(
                  child:  Text(
                    AppStrings.submit,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            data.isLoading?const Center(
            child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(AppColors.black)),
    ):Container()

          ],
        );
          }
      ),
    ),);
  }

}
