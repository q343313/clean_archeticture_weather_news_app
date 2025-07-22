
part of 'apibloc.dart';

abstract class ApiEvent extends Equatable{

  @override
  List<Object>get props=>[];
}

class GetApiData extends ApiEvent{}