import 'package:flutter_mobile/config/config.dart';
import 'package:flutter_mobile/domain/model/grpc/auto_trading.pbgrpc.dart';
import 'package:grpc/grpc.dart';

class GrpcClient {
  GrpcClient() {
    client = ClientChannel(
      AppConfig.config.grpcUrl,
      port: AppConfig.config.grpcPort,
      options: AppConfig.config.channelOptionsGrpc,
    );
  }

  static final GrpcClient share = GrpcClient();

  late ClientChannel client;

  CallOptions options = CallOptions(
    timeout: Duration(seconds: 30),
  );

  static MarketApiClient marketApiClient = MarketApiClient(
    share.client,
    options: share.options,
  );
}
