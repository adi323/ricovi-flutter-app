//677224134697-alr87u929iciiboeche6laeq4vfbolgh.apps.googleusercontent.com
import 'package:googleapis/photoslibrary/v1.dart' as photos;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:googleapis_auth/googleapis_auth.dart' as google_apis;
import 'package:http/http.dart' as http;


class GooglePhotoService{
  GoogleSignIn gsignin=GoogleSignIn(scopes: ['https://www.googleapis.com/auth/photoslibrary']);
  AuthClient? client;

  Future<List<String>> fetchGooglePhotos()async{
    try{
      final gaccount= await gsignin.signIn();

      if(gaccount==null){
        return [];
      }

      final gsigninAuth=await gaccount.authentication;
      DateTime tm=DateTime.now().toUtc().add(const Duration(minutes: 10));


      final access=AccessToken('Bearer',gsigninAuth.accessToken??'',tm);

      final cred=google_apis.AccessCredentials(
        access,
        gsigninAuth.idToken,
        []
      );

      client=google_apis.authenticatedClient(http.Client(), cred);
      final photosApi=photos.PhotosLibraryApi(client!);
      var albumsResponse=await photosApi.mediaItems.list(pageSize: 100);

      List<String> allmedia=[];

      while(albumsResponse.nextPageToken!=null){
        allmedia+=albumsResponse.mediaItems!.map((e) => e.baseUrl!).toList();
        albumsResponse=await photosApi.mediaItems.list(pageSize: 100,pageToken: albumsResponse.nextPageToken);
      }
      
      return allmedia;
      //print(albumsResponse);
      //return [];

    }catch(error){
      print("error fetching photos: $error");
    }

    return [];
  }


}