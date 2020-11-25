class SliderModel{
  String imagePath;
  String title;
  String desc;

  SliderModel({this.imagePath,this.title,this.desc});
  void setImageAssetPath(String getImagepath){
    imagePath = getImagepath;
  }
  void setTitle(String getTitle){
    title = getTitle;
  }
  void setDesc(String getDesc){
    desc = getDesc;
  }
  String getImageAssetPath(){
    return imagePath;
  }
  String getTitle(){
    return title;
  }
  String getDesc(){
    return desc;
  }
}
List<SliderModel> getSlides(){
  List<SliderModel> slides = new List<SliderModel>();
  SliderModel sliderModel = new SliderModel();
  sliderModel.setImageAssetPath("assets/1.png");
  sliderModel.setTitle("Fuck");
  sliderModel.setDesc("Aoy fuck you");
  slides.add(sliderModel);
  sliderModel = new SliderModel();

  sliderModel.setImageAssetPath("assets/2.png");
  sliderModel.setTitle("Fuck");
  sliderModel.setDesc("Aoy fuck you");
  slides.add(sliderModel);
  sliderModel = new SliderModel();

  sliderModel.setImageAssetPath("assets/3.png");
  sliderModel.setTitle("Fuck");
  sliderModel.setDesc("Aoy fuck you");
  slides.add(sliderModel);
  sliderModel = new SliderModel();

  sliderModel.setImageAssetPath("assets/4.png");
  sliderModel.setTitle("Fuck");
  sliderModel.setDesc("Aoy fuck you");
  slides.add(sliderModel);
  sliderModel = new SliderModel();

  return slides;
}