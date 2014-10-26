using Toybox.Graphics as Gfx;
using Toybox.System as Sys;

//! A simple gif drawing class
class Gif {
    // Hidden variables
    hidden var _bitmapResourcesArray;
    hidden var _size;
    hidden var _timer;
    hidden var _currentIdx;
    hidden var _didUpdateCallback;
    
     //! Constructor
    function initialize(bitmapResourcesArray) {
        // Validate input
        var size = bitmapResourcesArray.size();
        if (size < 2) {
            Sys.error( "Gif size less than 2 is not allowed!" );
        } else {
            // Initialize hidden variables
            _size = size;
            _bitmapResourcesArray = bitmapResourcesArray;
            _timer = new Timer.Timer();
            _currentIdx = 0;
        }
    }
    
    function callback() {
        _currentIdx += 1;
        if (_currentIdx == _size) {
            _currentIdx = 0;
        }
        Sys.println("Timer update :" + _currentIdx.toString());
        _didUpdateCallback.invoke();
    }
    
    function start(didUpdateCallback, time) {
        _didUpdateCallback = didUpdateCallback;
        _timer.start(method(:callback), time, true);
    }
    
    function stop () {
        _timer.stop();
    }
     
     //! Handle the update event
    function draw(dc, x, y) {
        dc.drawBitmap(x, y, _bitmapResourcesArray[_currentIdx]);
    }
}