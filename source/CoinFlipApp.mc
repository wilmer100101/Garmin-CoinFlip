import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;

class CoinFlipApp extends Application.AppBase {
    private var _coinFlipManager = new CoinFlipManager(self);
    private var _coinFlipView = new CoinFlipView(self);
    private var _coinFlipDelegate = new CoinFlipDelegate(self);
    private var _coinFlipAnimator = new CoinFlipAnimator(self);

    function initialize() {
        AppBase.initialize();
    }

    // onStart() is called on application start up
    function onStart(state as Dictionary?) as Void {
        _coinFlipManager.flipCoin();
    }

    // onStop() is called when your application is exiting
    function onStop(state as Dictionary?) as Void {
    }

    // Return the initial view of your application here
    function getInitialView() as [Views] or [Views, InputDelegates] {
        return [ _coinFlipView, _coinFlipDelegate ];
    }

    function getCoinFlipManager() as CoinFlipManager {
        return _coinFlipManager;
    }

    function getCoinFlipView() as CoinFlipView {
        return _coinFlipView;
    }

    function getCoinFlipDelegate() as CoinFlipDelegate {
        return _coinFlipDelegate;
    }

    function getCoinFlipAnimator() as CoinFlipAnimator {
        return _coinFlipAnimator;
    }
}