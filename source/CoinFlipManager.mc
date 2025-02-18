import Toybox.Graphics;
import Toybox.WatchUi;
import Toybox.Lang;

public class CoinFlipManager {
    private var _app as CoinFlipApp;
    private var _isHead = true as Boolean;

    function initialize(app as CoinFlipApp) {
        self._app = app;
    }

    public function flipCoin() {
        _isHead = (Math.rand() / 2147483647d) > 0.5;
        _app.getCoinFlipAnimator().startAnimation();
    }

    public function isHead() as Boolean {
        return _isHead;
    }
}