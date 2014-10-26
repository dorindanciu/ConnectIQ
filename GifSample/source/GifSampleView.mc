using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;

var marioGif;

class GifSampleView extends Ui.View {

    var image;
    var array = new[8];

    function callback() {
        Ui.requestUpdate();
    }
    
    //! Load your resources here
    function onLayout(dc) {
        image = Ui.loadResource(Rez.Drawables.id_monkey);
        
        array[0] = Ui.loadResource(Rez.Drawables.id_mario_1);
        array[1] = Ui.loadResource(Rez.Drawables.id_mario_2);
        array[2] = Ui.loadResource(Rez.Drawables.id_mario_3);
        array[3] = Ui.loadResource(Rez.Drawables.id_mario_4);
        array[4] = Ui.loadResource(Rez.Drawables.id_mario_5);
        array[5] = Ui.loadResource(Rez.Drawables.id_mario_6);
        array[6] = Ui.loadResource(Rez.Drawables.id_mario_7);
        array[7] = Ui.loadResource(Rez.Drawables.id_mario_8);
        
        marioGif = new Gif(array);
        
    }

    //! Restore the state of the app and prepare the view to be shown
    function onShow() {
        marioGif.start(method(:callback), 100);
    }

    //! Update the view
    function onUpdate(dc) {
        dc.setColor(Gfx.COLOR_WHITE, Gfx.COLOR_BLACK);
        dc.clear();
        dc.drawText(5, 20, Gfx.FONT_MEDIUM, "Click the menu button", Gfx.TEXT_JUSTIFY_LEFT);
        //dc.drawBitmap(5, 30, image);
        marioGif.draw(dc, 30, 30);
    }

    //! Called when this View is removed from the screen. Save the
    //! state of your app here.
    function onHide() {
        marioGif.stop();
    }

}