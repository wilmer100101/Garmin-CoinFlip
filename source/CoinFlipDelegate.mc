import Toybox.Lang;
import Toybox.WatchUi;
import Toybox.System;

class CoinFlipDelegate extends WatchUi.BehaviorDelegate {
    private var _app as CoinFlipApp;

    function initialize(app as CoinFlipApp) {
        BehaviorDelegate.initialize();

        self._app = app;
    }

    function onSelect() as Boolean {
        _app.getCoinFlipManager().flipCoin();
        return true;
    }
}