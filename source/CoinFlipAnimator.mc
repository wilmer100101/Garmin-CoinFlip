import Toybox.Graphics;
import Toybox.WatchUi;
import Toybox.Lang;
import Toybox.System;
import Toybox.Time;

public class CoinFlipAnimator {
    private const ANIMATION_DURATION = 28 as Number;

    private var _app as CoinFlipApp;
    private var _scheduled = new Timer.Timer();
    private var _countdown as Number = ANIMATION_DURATION;

    function initialize(app as CoinFlipApp) {
        self._app = app;
    }

    public function startAnimation() {
        _countdown = ANIMATION_DURATION;
        _scheduled.start(method(:tickAnimateTask), 100, true);
    }
    
    public function tickAnimateTask() {    
        _app.getCoinFlipView().animate(_countdown);

        if (0 >= _countdown) { 
            _scheduled.stop();
            return;
        }

        _countdown--;
    }
}