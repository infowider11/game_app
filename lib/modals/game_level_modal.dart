class GameLevelModal{
  int id;
  String name;
  bool isFree;
  String imageUrl;

  GameLevelModal({
    required this.id,
    required this.name,
    required this.isFree,
    required this.imageUrl,
  });


  factory GameLevelModal.fromJson(Map data){
    return GameLevelModal(id: data['id'], name: data['title'], isFree: data['is_free']==1, imageUrl: data['icon']);
  }
}