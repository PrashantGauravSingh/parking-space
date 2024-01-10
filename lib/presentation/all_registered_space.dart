import 'package:flutter/material.dart';
import 'package:parking_space/Providers/book_slot_provider.dart';
import 'package:parking_space/Providers/register_space_provider.dart';
import 'package:parking_space/constant/app_colors.dart';
import 'package:parking_space/core/register_space_service.dart';
import 'package:parking_space/presentation/book_slot.dart';
import 'package:provider/provider.dart';

class AllRegisteredSpace extends StatefulWidget {

  final BuildContext context;
  const AllRegisteredSpace({Key? key, required this.context}) :super(key: key);

  @override
  State<AllRegisteredSpace> createState() => _AllRegisteredSpaceState();
}

class _AllRegisteredSpaceState extends State<AllRegisteredSpace> {

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      Provider.of<RegisterSpaceProvider>(context, listen: false).getAllRegisteredSpace();
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Registered Spaces',style: TextStyle(color: AppColors.white),),
      ),
      body: Consumer<RegisterSpaceProvider>(
        builder: (context, value, child) {
          if (value.isLoading) {
            return const Center(
              child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(AppColors.black)),
            );
          }
          final getRegisterSpaceModel = value.getRegisterSpaceModel;
          return ListView.builder(
            itemCount: getRegisterSpaceModel.length,
            itemBuilder: (context, index) {
              final todo = getRegisterSpaceModel[index];

              return GestureDetector(
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute<dynamic>(builder: (BuildContext context) => ChangeNotifierProvider<BookSlotProvider>(create: (_) => BookSlotProvider(),child:  BookSlot(id:todo.id ,)),));
                },
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                              Radius.circular(10)
                          ),
                          boxShadow: [BoxShadow(
                              color:  Color(0x1a181818),
                              offset: Offset(0,1),
                              blurRadius: 15,
                              spreadRadius: 0
                          )] ,
                          color: AppColors.white
                      ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor:AppColors.black ,
                          child: Text(todo.id.toString(),style: const TextStyle(color: AppColors.white),),
                        ),
                        title: Text(
                          todo.spaceName??'',
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios_rounded),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),

      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/RegisterSpace');
          },
          backgroundColor: AppColors.black,
          child: const Icon(Icons.add),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
    );
  }
}
