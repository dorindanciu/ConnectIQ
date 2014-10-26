using Toybox.Application as App;
using Toybox.WatchUi as Ui;

class GifSampleApp extends App.AppBase {

    //! onStart() is called on application start up
    function onStart() {
    }

    //! onStop() is called when your application is exiting
    function onStop() {
    }

    //! Return the initial view of your application here
    function getInitialView() {
        return [ new GifSampleView(), new GifSampleDelegate() ];
    }

}

class GifSampleDelegate extends Ui.BehaviorDelegate {

    function onMenu() {
        Ui.pushView(new Rez.Menus.MainMenu(), new GifSampleMenuDelegate(), Ui.SLIDE_UP);
    }

}