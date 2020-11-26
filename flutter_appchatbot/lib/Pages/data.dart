class SliderModel{
  String imagePath;

  SliderModel({this.imagePath});
  void setImageAssetPath(String getImagepath){
    imagePath = getImagepath;
  }

  String getImageAssetPath(){
    return imagePath;
  }

}
List<SliderModel> getSlides(){
  List<SliderModel> slides = new List<SliderModel>();
  SliderModel sliderModel = new SliderModel();

  sliderModel.setImageAssetPath("assets/1.png");
  slides.add(sliderModel);
  sliderModel = new SliderModel();

  sliderModel.setImageAssetPath("assets/2.png");
  slides.add(sliderModel);
  sliderModel = new SliderModel();

  sliderModel.setImageAssetPath("assets/3.png");
  slides.add(sliderModel);
  sliderModel = new SliderModel();

  sliderModel.setImageAssetPath("assets/4.png");
  slides.add(sliderModel);
  sliderModel = new SliderModel();

  return slides;
}