import 'package:flutter/material.dart';
import 'package:parking_space/Models/allocate_vehicle_model.dart';
import 'package:parking_space/Models/register_space_model.dart';
import 'package:parking_space/Providers/book_slot_provider.dart';
import 'package:parking_space/Providers/register_parking_provider.dart';
import 'package:parking_space/constant/app_colors.dart';
import 'package:parking_space/constant/app_strings.dart';
import 'package:provider/provider.dart';


enum BaySize { S, M, L,XL }

class BookSlot extends StatefulWidget {
  final int? id;
  const BookSlot({Key? key,this.id}) : super(key: key);

  @override
  State<BookSlot> createState() => _BookSlotState();
}

class _BookSlotState extends State<BookSlot> {

  BaySize _baySize = BaySize.S;
  var spaceIdController = TextEditingController();
  var levelController = TextEditingController();
  var vehicleController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if(widget.id!=null) {
      spaceIdController.text = widget.id.toString();
    }

  }

  @override
  Widget build(BuildContext context) {
    //Method to register book slot space

    Future<void> _bookSlot() async {

      int spaceId=int.parse(spaceIdController.text.trim());
      String level = levelController.text.trim();
      String vechNo = vehicleController.text.trim();

      /// Concatinating space+level+vSize+VNo to create Unique ID for Bay
      ///
      String bayId= level+_baySize.name+vechNo;

      GetAllocatedVehicleModel allocatedVehicleModel = GetAllocatedVehicleModel( spaceId:spaceId ,level: level,bayId: bayId.toUpperCase(),timeStamp: DateTime.now().toString(),vName: vechNo,vSize:_baySize.name);
      var provider = Provider.of<BookSlotProvider>(context, listen: false);
      await provider.bookSlot(allocatedVehicleModel);

    }

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title:  const Text(AppStrings.bookSlot,style:  TextStyle(color: AppColors.white),),
        ),
        body:Consumer<BookSlotProvider>(builder: (context, data, child) {
          return Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.width*1,
                width: double.infinity,
                color: AppColors.black,
              ),
              Card(
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.width*0.5, left: 20, right: 20),
                elevation: 4,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
                      child: TextFormField(
                        controller:spaceIdController,
                        keyboardType: TextInputType.number,
                        cursorColor: AppColors.black,
                        decoration: const InputDecoration(
                            hintText: 'Enter registered Space ID',
                            hintStyle: TextStyle(
                              fontSize: 16,
                              color: AppColors.black,
                            )),
                      ),
                    ),

                    Container(
                      margin: const EdgeInsets.only(bottom: 40, left: 20, right: 20),
                      child:
                      TextFormField(
                        controller: levelController,
                        cursorColor: AppColors.black,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                            hintText: 'Level',
                            hintStyle: TextStyle(
                              fontSize: 16,
                              color: AppColors.black,
                            )),
                      ),
                    ),

                    Container(
                        margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
                        child: const Text('Vehicle Size',style:TextStyle(fontSize: 16,color: AppColors.black,) ,)

                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Radio(
                                fillColor: MaterialStateProperty.all(Colors.black),
                                activeColor: AppColors.black,
                                  value: BaySize.S, groupValue: BaySize, onChanged: (dynamic size) {
                                    setState(() {
                                      _baySize = size;
                                    });
                              }),
                              const Expanded(
                                child: Text('S'),
                              )
                            ],
                          ),
                          flex: 1,
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Radio(
                                  value: BaySize.M, groupValue: _baySize, onChanged: (dynamic size) {
                                    setState(() {
                                      _baySize = size;
                                    });
                              }),
                              const Expanded(child: Text('M'))
                            ],
                          ),
                          flex: 1,
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Radio(
                                  value: BaySize.L, groupValue: _baySize, onChanged: (dynamic size) {

                                    setState(() {
                                      _baySize = size;
                                    });
                              }),
                              const Expanded(child: Text('L'))
                            ],
                          ),
                          flex: 1,
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Radio(
                                  value: BaySize.XL, groupValue: _baySize, onChanged: (dynamic size) {

                                    setState(() {
                                      _baySize = size;
                                    });
                              }),
                              const Expanded(child: Text('XL'))
                            ],
                          ),
                          flex: 1,
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 40, left: 20, right: 20),
                      child: TextFormField(
                        controller: vehicleController,
                        keyboardType: TextInputType.text,
                        maxLength: 10,
                        cursorColor: AppColors.black,
                        decoration: const InputDecoration(
                            hintText: 'Vehicle No.',
                            hintStyle: TextStyle(
                              fontSize: 16,
                              color: AppColors.black,
                            )),
                      ),
                    ),
                  ],
                ),
              ),
              data.isLoading?const Center(
                child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(AppColors.black)),
              ):Container()

            ],
          );
        }
        ),
        floatingActionButton:  GestureDetector(
          onTap: (){
            _bookSlot();
          },
          child: Container(
            margin:const  EdgeInsets.only( bottom:25.0,left: 25, right: 25, ),
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
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),);
  }
}
