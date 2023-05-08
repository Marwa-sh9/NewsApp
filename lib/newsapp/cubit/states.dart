abstract class NewsStates{}

class NewsInitialState extends NewsStates{}

class NewsbottomNavState extends NewsStates{}

class NewsGetBusinessLoadingState extends NewsStates{}

class NewsGetBusinessSuccessState extends NewsStates{}

class NewsGetBusinessErrorState extends NewsStates
{
  final String error;
  NewsGetBusinessErrorState(this.error);

}
class NewsGettechcrunchLoadingState extends NewsStates{}

class NewsGettechcrunchSuccessState extends NewsStates{}

class NewsGettechcrunchErrorState extends NewsStates
{
  final String error;
  NewsGettechcrunchErrorState(this.error);
}

class NewsGetwsjLoadingState extends NewsStates{}

class NewsGetwsjSuccessState extends NewsStates{}

class NewsGetwsjErrorState extends NewsStates
{
  final String error;
  NewsGetwsjErrorState(this.error);
}
//class AppChangeModeState  extends NewsStates{}

class NewsGetsearchLoadingState extends NewsStates{}

class NewsGetsearchSuccessState extends NewsStates{}

class NewsGetsearchErrorState extends NewsStates
{
  final String error;

  NewsGetsearchErrorState(this.error);
}


