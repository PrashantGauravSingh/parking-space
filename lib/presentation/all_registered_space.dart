import 'package:flutter/material.dart';
import 'package:parking_space/Providers/register_space_provider.dart';
import 'package:parking_space/constant/app_colors.dart';
import 'package:parking_space/core/register_space_service.dart';
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
        title: const Text('Spaces',style: TextStyle(color: AppColors.white),),
      ),
      body: Consumer<RegisterSpaceProvider>(
        builder: (context, value, child) {
          if (value.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final getRegisterSpaceModel = value.getRegisterSpaceModel;
          return ListView.builder(
            itemCount: getRegisterSpaceModel.length,
            itemBuilder: (context, index) {
              final todo = getRegisterSpaceModel[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
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
              );
            },
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/RegisterSpace');
        },
        backgroundColor: AppColors.black,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
    );
  }
}
