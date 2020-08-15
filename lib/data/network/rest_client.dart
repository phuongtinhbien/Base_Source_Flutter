
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client.g.dart';

@RestApi(
  baseUrl: "https://marketapibeta.cooky.vn/",
  autoCastResponse: true,
)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

//  @GET("auth/getToken")
//  Future<RespWrap<UserTokenModel>> getAuthToken(
//      @Query("sessionToken") String sessionToken,
//      @Query("checksum") String checksum);


}
