package scripts;

import com.stencyl.graphics.G;
import com.stencyl.graphics.BitmapWrapper;

import com.stencyl.behavior.Script;
import com.stencyl.behavior.Script.*;
import com.stencyl.behavior.ActorScript;
import com.stencyl.behavior.SceneScript;
import com.stencyl.behavior.TimedTask;

import com.stencyl.models.Actor;
import com.stencyl.models.GameModel;
import com.stencyl.models.actor.Animation;
import com.stencyl.models.actor.ActorType;
import com.stencyl.models.actor.Collision;
import com.stencyl.models.actor.Group;
import com.stencyl.models.Scene;
import com.stencyl.models.Sound;
import com.stencyl.models.Region;
import com.stencyl.models.Font;

import com.stencyl.Engine;
import com.stencyl.Input;
import com.stencyl.Key;
import com.stencyl.utils.Utils;

import openfl.ui.Mouse;
import openfl.display.Graphics;
import openfl.display.BlendMode;
import openfl.display.BitmapData;
import openfl.display.Bitmap;
import openfl.events.Event;
import openfl.events.KeyboardEvent;
import openfl.events.TouchEvent;
import openfl.net.URLLoader;

import box2D.common.math.B2Vec2;
import box2D.dynamics.B2Body;
import box2D.dynamics.B2Fixture;
import box2D.dynamics.joints.B2Joint;
import box2D.collision.shapes.B2Shape;

import motion.Actuate;
import motion.easing.Back;
import motion.easing.Cubic;
import motion.easing.Elastic;
import motion.easing.Expo;
import motion.easing.Linear;
import motion.easing.Quad;
import motion.easing.Quart;
import motion.easing.Quint;
import motion.easing.Sine;

import com.stencyl.graphics.shaders.BasicShader;
import com.stencyl.graphics.shaders.GrayscaleShader;
import com.stencyl.graphics.shaders.SepiaShader;
import com.stencyl.graphics.shaders.InvertShader;
import com.stencyl.graphics.shaders.GrainShader;
import com.stencyl.graphics.shaders.ExternalShader;
import com.stencyl.graphics.shaders.InlineShader;
import com.stencyl.graphics.shaders.BlurShader;
import com.stencyl.graphics.shaders.SharpenShader;
import com.stencyl.graphics.shaders.ScanlineShader;
import com.stencyl.graphics.shaders.CSBShader;
import com.stencyl.graphics.shaders.HueShader;
import com.stencyl.graphics.shaders.TintShader;
import com.stencyl.graphics.shaders.BloomShader;



class Design_4_4_TrumpBehavior extends SceneScript
{
	public var _XPosition:Float;
	public var _Trump:ActorType;
	public var _Cruz:ActorType;
	public var _Rubio:ActorType;
	public var _YPosition:Float;
	public var _BoxWidth:Float;
	public var _ActorNumber:Float;
	public var _BoxHeight:Float;
	
	
	public function new(dummy:Int, dummy2:Engine)
	{
		super();
		nameMap.set("XPosition", "_XPosition");
		_XPosition = 0.0;
		nameMap.set("Trump", "_Trump");
		nameMap.set("Cruz", "_Cruz");
		nameMap.set("Rubio", "_Rubio");
		nameMap.set("YPosition", "_YPosition");
		_YPosition = 0.0;
		nameMap.set("BoxWidth", "_BoxWidth");
		_BoxWidth = 0.0;
		nameMap.set("ActorNumber", "_ActorNumber");
		_ActorNumber = 0.0;
		nameMap.set("BoxHeight", "_BoxHeight");
		_BoxHeight = 0.0;
		
	}
	
	override public function init()
	{
		
		/* ======================== When Creating ========================= */
		_BoxHeight = asNumber(128);
		propertyChanged("_BoxHeight", _BoxHeight);
		runPeriodically(1000 * 1, function(timeTask:TimedTask):Void {
			_YPosition = asNumber((randomInt(Math.floor(0), Math.floor(2)) * _BoxHeight));
			propertyChanged("_YPosition", _YPosition);
			if((_YPosition == 0))
			{
				_XPosition = asNumber((randomInt(Math.floor(0), Math.floor(3)) * _BoxWidth));
				propertyChanged("_XPosition", _XPosition);
			}
			else
			{
				_XPosition = asNumber((randomInt(Math.floor(0), Math.floor(4)) * _BoxWidth));
				propertyChanged("_XPosition", _XPosition);
			}
			_ActorNumber = asNumber(randomInt(Math.floor(1), Math.floor(9)));
			propertyChanged("_ActorNumber", _ActorNumber);
			if((_ActorNumber <= 5))
			{
				createRecycledActor(getActorType(10), _XPosition, _YPosition, Script.FRONT);
			}
			else if(((_ActorNumber > 5) && (_ActorNumber <= 8)))
			{
				createRecycledActor(getActorType(15), _XPosition, _YPosition, Script.FRONT);
			}
			else if(((_ActorNumber > 8) && (_ActorNumber <= 9)))
			{
				createRecycledActor(getActorType(13), _XPosition, _YPosition, Script.FRONT);
			}
			runLater(1000 * .7, function(timeTask:TimedTask):Void {
				recycleActor(getLastCreatedActor());
			}, null);
		}, null);
		
	}
	
	override public function forwardMessage(msg:String)
	{
		
	}
}