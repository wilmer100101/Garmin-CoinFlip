import Toybox.Graphics;
import Toybox.WatchUi;
import Toybox.Lang;
import Toybox.System;
import Toybox.Time;

public class CoinFlipView extends WatchUi.View {
    private var _app as CoinFlipApp;
    private var _tailsLoadedResource;
    private var _headsLoadedResource;
    private var _tailsAnimationLayer;
    private var _headsAnimationLayer;
    private var _infoLayer;

    function initialize(app as CoinFlipApp) {
        View.initialize();
        
        self._app = app;

        _tailsLoadedResource = WatchUi.loadResource($.Rez.Drawables.tailsanimation);
        _headsLoadedResource = WatchUi.loadResource($.Rez.Drawables.headsanimation);
    }

    function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.MainLayout(dc));

        var height = dc.getHeight();
        var width = dc.getWidth();

        _tailsAnimationLayer = new WatchUi.AnimationLayer(_tailsLoadedResource, {
          :locX => (height - _tailsLoadedResource.getHeight()) / 2,
          :locY => (width - _tailsLoadedResource.getWidth()) / 2,
        });
        _headsAnimationLayer = new WatchUi.AnimationLayer(_headsLoadedResource, {
          :locX => (height - _headsLoadedResource.getHeight()) / 2,
          :locY => (width - _headsLoadedResource.getWidth()) / 2,
        });
        
        addLayer(_tailsAnimationLayer);
        addLayer(_headsAnimationLayer);

        _infoLayer = findDrawableById("info");
    }

    public function animate(countdown as Number) {
        if ((countdown % 7) != 0) {
            return;
        }

        var isHead = _app.getCoinFlipManager().isHead();
        if (0 != countdown) {
            _infoLayer.setText("");
            WatchUi.requestUpdate();
        } else if (0 >= countdown) {
            updateInfoTextStatus(isHead);
            WatchUi.requestUpdate();
            return;
        }

        var sequencesLeft = Math.round(countdown / 7);
        if (sequencesLeft % 2 == 0) {
            playAnimation(!isHead);
        } else {
            playAnimation(isHead);
        }
    }

    private function playAnimation(_isHead as Boolean) {
        if (_isHead) {
            _tailsAnimationLayer.setVisible(false);
            _headsAnimationLayer.setVisible(true);
            _headsAnimationLayer.play({ :delegate => null });
        } else {
            _headsAnimationLayer.setVisible(false);
            _tailsAnimationLayer.setVisible(true);
            _tailsAnimationLayer.play({ :delegate => null });
        }
    }

    private function updateInfoTextStatus(_isHead as Boolean) {
        if (_isHead) {
            _infoLayer.setText("Heads");
        }
        else {
            _infoLayer.setText("Tails");
        }
    }
}