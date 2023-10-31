import 'package:flutter/material.dart';
import 'package:http_request/api_data_source.dart';
import 'package:http_request/users_model.dart';
import 'package:http_request/detail_users.dart';

 class PageListUsers extends StatelessWidget {
  const PageListUsers ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Users'),
        backgroundColor: Colors.purple,
      ),
      body: _buildListUserBody(),
    );
  }
  Widget _buildListUserBody(){
    return Container(
      child: FutureBuilder(
        future: ApiDataSource.instance.loadUsers(),
        builder: (BuildContext context, AsyncSnapshot<dynamic>snapshot){
          if (snapshot.hasError){
            return _buildErrorSection();
          }
          if (snapshot.hasData){
            UsersModel usersModel = UsersModel.fromJson(snapshot.data);
            return _buildSuccessSection(usersModel);
          }
          return _BuildLoadingSection();
        },
      ),
    );
  }
  Widget _buildErrorSection(){
    return Text('Error');
  }
  Widget _BuildLoadingSection(){
    return Center(
      child: CircularProgressIndicator(),
    );
  }
  Widget _buildSuccessSection(UsersModel data){
    return ListView.builder(
      itemCount: data.data!.length ,
        itemBuilder: (BuildContext context, int index) {
        return _buildItemUsers(context, data.data![index]);
        },
    );
  }
  Widget _buildItemUsers (BuildContext context, Data userData){
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => DetailUsers(userData : userData )
      ),
      );
      },
      child: Card (
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 100,
                child: Image.network(userData.avatar!),
            ),
            Container(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(userData.firstName!+" "+userData.lastName!),
                  Text(userData.email!),
                ],
            )
          ],
        ),
      ),
    );
  }
}
