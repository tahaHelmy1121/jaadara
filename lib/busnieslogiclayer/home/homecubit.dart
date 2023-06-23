import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jaadara/datalayer/repo/home/slider.dart';

import '../../datalayer/model/bestsellers.dart';
import '../../datalayer/model/offers.dart';
import '../../datalayer/model/searchmodel.dart';
import '../../datalayer/model/slider.dart';
import '../../datalayer/repo/home/bestsellers.dart';

import '../../datalayer/repo/home/offers.dart';
import 'homestate.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit()
      : super(
    HomeStateInitial(),
  );

 // SliderModel categorySlider = SliderModel();
  Seller seller = Seller();
  SliderModel? sliderCat = SliderModel();



  getSliderSendData({context}) async {
    sliderCat = await SliderRepo.getSliderRepo();
    emit(HomeStateSuccess());
  }


  getSellerSendData({context}) async {
    seller = await SellerRepo.getSellerRepo();
    emit(HomeStateSuccess());
  }

  Offers offers = Offers();
  String searchProduct = "";
  getoffersSendData({context}) async {
    offers = await OfferRepo.getOfferRepo();
    emit(HomeStateSuccess());
  }
  SearchModel  searchModel = SearchModel();


}

