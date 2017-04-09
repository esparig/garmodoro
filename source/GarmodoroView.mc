using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.System as System;
using Toybox.Timer as Timer;

class GarmodoroView extends Ui.View {
	hidden var pomodoroSubtitle;
	hidden var breakLabel;
	hidden var readyLabel;

	function initialize() {
		System.println( "GomodoroView: initialize" );
		View.initialize();
	}

	// Load your resources here
	function onLayout(dc) {
		System.println( "onLayout" );

		pomodoroSubtitle = Ui.loadResource( Rez.Strings.pomodoroSubtitle );
		breakLabel = Ui.loadResource( Rez.Strings.breakLabel );
		readyLabel = Ui.loadResource( Rez.Strings.readyLabel );
	}

	// Called when this View is brought to the foreground. Restore
	// the state of this View and prepare it to be shown. This includes
	// loading resources into memory.
	function onShow() {
		System.println( "onShow" );
	}

	// Update the view
	function onUpdate( dc ) {
		System.println( "onUpdate" );

		dc.setColor( Gfx.COLOR_TRANSPARENT, Gfx.COLOR_BLACK );
		dc.clear();
		if ( isBreakTimerStarted ) {
			dc.setColor( Gfx.COLOR_GREEN, Gfx.COLOR_TRANSPARENT );
			dc.drawText( ( dc.getWidth() / 2 ), ( ( dc.getHeight() / 2 ) - 30 ), Gfx.FONT_LARGE, me.breakLabel, Gfx.TEXT_JUSTIFY_CENTER );
		} else if ( isPomodoroTimerStarted ) {
			dc.setColor( Gfx.COLOR_RED, Gfx.COLOR_TRANSPARENT );
			dc.drawText( ( dc.getWidth() / 2 ), ( ( dc.getHeight() / 2 ) - 90 ), Gfx.FONT_NUMBER_THAI_HOT, minutes.format( "%02d" ), Gfx.TEXT_JUSTIFY_CENTER );
			dc.setColor( Gfx.COLOR_DK_RED, Gfx.COLOR_TRANSPARENT );
			dc.drawText( ( dc.getWidth() / 2 ), ( ( dc.getHeight() / 2 ) + 10 ), Gfx.FONT_TINY, me.pomodoroSubtitle, Gfx.TEXT_JUSTIFY_CENTER );
		} else {
			dc.setColor( Gfx.COLOR_ORANGE, Gfx.COLOR_TRANSPARENT );
			dc.drawText( ( dc.getWidth() / 2 ), ( ( dc.getHeight() / 2 ) - 30 ), Gfx.FONT_LARGE, me.readyLabel, Gfx.TEXT_JUSTIFY_CENTER );
		}

		dc.setColor( Gfx.COLOR_WHITE, Gfx.COLOR_TRANSPARENT );
		dc.drawText( ( dc.getWidth() / 2 ), ( ( dc.getHeight() / 2 ) + 30 ), Gfx.FONT_MEDIUM, "Pomodoro #" + pomodoroNumber, Gfx.TEXT_JUSTIFY_CENTER );
	}

	// Called when this View is removed from the screen. Save the
	// state of this View here. This includes freeing resources from
	// memory.
	function onHide() {
		System.println( "onHide" );
	}
}
