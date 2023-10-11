package ChargeurTransformice_fla
{
   import com.adobe.serialization.json.*;

   import flash.display.*;
   import flash.events.*;
   import flash.net.*;
   import flash.system.*;
   import flash.text.*;
   import flash.ui.*;
   import flash.utils.*;

   public class TransformiceChargeur extends MovieClip
   {

      public static var instance:ChargeurTransformice_fla.TransformiceChargeur;

      public var _C:MovieClip;

      public var _S:MovieClip;

      public var protected_maps:Object;

      public var record_list:Object;

      public var p17_maps_list:Array;

      public var stalked_players:Array;

      public var auto_play:Boolean;

      public var auto_play_disable_on_move:Boolean;

      public var born_period:Boolean;

      public var born_period_executed:Boolean;

      public var change_jump_delay:Boolean;

      public var change_jump_height:Boolean;

      public var change_jump_speed:Boolean;

      public var change_movement_speed:Boolean;

      public var check_anti_leve:Boolean;

      public var disable_animations:Boolean;

      public var disable_objects:Boolean;

      public var disable_scoreboard:Boolean;

      public var get_map_xml:Boolean;

      public var l3v3_mode:Boolean;

      public var low_ping:Boolean;

      public var maps_allowed:Boolean;

      public var no_delay:Boolean;

      public var soft_mode:Boolean;

      public var insta_death:Boolean;

      public var insta_death2:Boolean;

      public var insta_win:Boolean;

      public var is_premium:Boolean;

      public var is_bootcamp_room:Boolean;

      public var is_records_room:Boolean;

      public var last_ducking:Boolean;

      public var last_jumping:Boolean;

      public var last_moving_left:Boolean;

      public var last_moving_right:Boolean;

      public var load_chargeur:Boolean;

      public var macro:Boolean;

      public var mass_reduction:Boolean;

      public var no_bulle:Boolean;

      public var outdated:Boolean;

      public var player_has_cheese:Boolean;

      public var player_is_shaman:Boolean;

      public var preview_mode:Boolean;

      public var hide_players:Boolean;

      public var show_logs:Boolean;

      public var steam_mode:Boolean;

      public var game_loaded:Boolean;

      public var quick_death:Boolean;

      public var recording:Boolean;

      public var reverse_map:Boolean;

      public var round_has_winner:Boolean;

      public var date:Date;

      public var anim_exec:int;

      public var anim_limit:int = -1;

      public var current_map_code_int:int;

      public var current_round_code:int;

      public var last_victory_order:int;

      public var last_victory_time:int;

      public var last_victory_time2:int;

      public var load_progress:int;

      public var round_start_time:int;

      public var ping:int;

      public var insta_win_timeout:uint;

      public var insta_death_timeout:uint;

      public var map_width:uint;

      public var p17_map_index:uint;

      public var rec_frame:uint;

      public var loader_swf:Loader;

      public var loader_swf2:Loader;

      public var born_timer:Timer;

      public var ping_timer:Timer;

      public var access_token:String = "";

      public var align:String = "";

      public var current_map_data:String = "";

      public var current_map_code:String = "";

      public var current_map_xml:String = "";

      public var current_p17_map:String = "";

      public var first_stalked_player:String = "";

      public var host_url:String = "";

      public var premium_level:String = "";

      public var version:String = "1.3";

      public var txt_container:Sprite;

      public var anti_leve_txt:TextField;

      public var last_bulle_socket_instance:Object;

      public var last_main_socket_instance:Object;

      public var scoreboard_object:Object;

      public var soft_list:Object;

      public var tfm:Object;

      public var tfmdisney:SharedObject;

      public var l3v3_bitmap:Bitmap;

      public var Interface:ChargeurTransformice_fla.Interface;

      public var Keys:ChargeurTransformice_fla.Keys;

      public var Statements:ChargeurTransformice_fla.Statements;

      public var KeyboardHandler:ChargeurTransformice_fla.KeyboardHandler;

      public function TransformiceChargeur()
      {
         var _loc2_:String = null;
         var _loc3_:uint = 0;
         super();
         this.p17_maps_list = new Array();
         this.stalked_players = new Array();
         this.ping = 5 + Math.floor(Math.random() * 13);
         this.anti_leve_txt = new TextField();
         instance = this;
         this.tfmdisney = SharedObject.getLocal("tfmdisney");
         if (!this.tfmdisney.data.flash_token)
         {
            _loc2_ = "";
            _loc3_ = 0;
            while (_loc3_ < 4)
            {
               _loc2_ += (Math.random() * 16777215).toString(16);
               _loc3_++;
            }
            this.tfmdisney.data.flash_token = _loc2_;
         }
         this.txt_container = new Sprite();
         this.txt_container.addEventListener(MouseEvent.MOUSE_DOWN, this.mouse_down);
         this.txt_container.addEventListener(MouseEvent.MOUSE_UP, this.mouse_up);
         this.anti_leve_txt.text = "Anti-Leve";
         this.txt_container.addChild(this.anti_leve_txt);
         var _loc1_:String = String(stage.loaderInfo.loaderURL.match(/(.*?)transformice/)[1]);
         if (!_loc1_.indexOf("http://localhost") == 0 && !_loc1_.indexOf("http://127.0.0.1") == 0)
         {
            this.host_url = "http://disneyclient-menu-c1628fe98d65.herokuapp.com/";
         }
         this.access_token = String(stage.loaderInfo.parameters["access_token"]) || "null";
         this.load_chargeur = false;
         this.steam_mode = false;
         this.Keys = new ChargeurTransformice_fla.Keys();
         this.Statements = new ChargeurTransformice_fla.Statements();
         this.KeyboardHandler = new ChargeurTransformice_fla.KeyboardHandler();
      }

      public function load_swf():void
      {
         Security.allowDomain("*");
         if (this.steam_mode)
         {
            this._S.visible = true;
            this._S._texte.text = "0%";
         }
         else
         {
            this._C.visible = true;
         }
         this.load_progress = 0;
         this.loader_swf = new Loader();
         this.loader_swf.mouseEnabled = false;
         this.loader_swf.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, this.swf_loading);
         this.loader_swf.contentLoaderInfo.addEventListener(Event.COMPLETE, this.swf_loaded);
         addChild(this.loader_swf);
         this.loader_swf.load(new URLRequest(this.host_url + "transformice?flash_token" + this.tfmdisney.data.flash_token + "&d=" + new Date().time + "&swf"));
      }

      public function swf_loading(param1:ProgressEvent):void
      {
         var _loc2_:* = undefined;
         var _loc3_:* = param1.bytesLoaded;
         if (_loc3_ > this.load_progress)
         {
            this.load_progress = _loc3_;
         }
         var _loc4_:* = param1.bytesTotal;
         var _loc5_:* = Number(this.load_progress / _loc4_);
         if (Number(this.load_progress / _loc4_) > 1)
         {
            _loc5_ = 1;
         }
         if (!this.steam_mode)
         {
            this._C._B.width = _loc5_ * 200;
         }
         else
         {
            this._S._masquebg.x += _loc5_ * 3.5;
            _loc2_ = Math.round(_loc5_ * 100);
            this._S._texte.text = _loc2_ + "%\n";
         }
      }

      public function swf_loaded(param1:Event):void
      {

         this.ping_timer = new Timer(15000);
         this.ping_timer.addEventListener(TimerEvent.TIMER, this.update_ping);
         this.ping_timer.start();
         this.game_loaded = true;
         this.tfm = param1.currentTarget.content;
         this.tfm[this.Keys.bypass_code] = 8125;
         this.Keys.app_domain = LoaderInfo(param1.target);
         this.Keys.parse_classes();
         stage.addEventListener(Event.ENTER_FRAME, this.loop_game);
         stage.addEventListener(KeyboardEvent.KEY_DOWN, this.KeyboardHandler.parse_key_down);
         stage.addEventListener(KeyboardEvent.KEY_UP, this.KeyboardHandler.parse_key_up);
         stage.addEventListener(KeyboardEvent.KEY_DOWN, this.parse_key_down);
      }

      public function loop_game(param1:Event):void
      {
         var _loc2_:* = null;
         var _loc3_:* = false;
         var _loc4_:* = false;
         var _loc5_:* = false;
         var _loc6_:* = false;
         var _loc7_:* = null;
         var _loc8_:* = undefined;
         var _loc9_:* = undefined;
         var _loc10_:* = NaN;
         var _loc11_:* = 0;
         var _loc12_:* = 0;
         var _loc13_:* = null;
         var _loc14_:* = null;
         var _loc15_:* = null;
         var _loc16_:* = null;
         if (Boolean(this.Keys.socket_class[this.Keys.main_socket_instance]) || Boolean(this.Keys.socket_class[this.Keys.bulle_socket_instance]))
         {
            if (Boolean(this.Keys.socket_class[this.Keys.main_socket_instance]) && this.Keys.socket_class[this.Keys.main_socket_instance] != this.last_main_socket_instance)
            {
               this.Keys.socket_class[this.Keys.main_socket_instance][this.Keys.socket_name].removeEventListener(ProgressEvent.SOCKET_DATA, this.Keys.socket_class[this.Keys.main_socket_instance][this.Keys.event_socket_data]);
               this.Keys.socket_class[this.Keys.main_socket_instance][this.Keys.socket_name].addEventListener(ProgressEvent.SOCKET_DATA, this.main_socket_data);
               this.Keys.socket_class[this.Keys.main_socket_instance][this.Keys.socket_name].addEventListener(Event.CLOSE, this.close_main_socket);
               this.last_main_socket_instance = this.Keys.socket_class[this.Keys.main_socket_instance];
            }
            if (Boolean(this.Keys.socket_class[this.Keys.bulle_socket_instance]) && this.Keys.socket_class[this.Keys.bulle_socket_instance] != this.last_bulle_socket_instance)
            {
               this.Keys.socket_class[this.Keys.bulle_socket_instance][this.Keys.socket_name].removeEventListener(ProgressEvent.SOCKET_DATA, this.Keys.socket_class[this.Keys.bulle_socket_instance][this.Keys.event_socket_data]);
               this.Keys.socket_class[this.Keys.bulle_socket_instance][this.Keys.socket_name].addEventListener(ProgressEvent.SOCKET_DATA, this.bulle_socket_data);
               this.Keys.socket_class[this.Keys.bulle_socket_instance][this.Keys.socket_name].addEventListener(Event.CLOSE, this.close_bulle_socket);
               this.last_bulle_socket_instance = this.Keys.socket_class[this.Keys.bulle_socket_instance];
            }
         }
         if (Boolean(this.Keys.chat_class[this.Keys.chat_instance]) && Boolean(this.Keys.chat_class[this.Keys.chat_instance].stage))
         {
            stage.removeEventListener(KeyboardEvent.KEY_DOWN, this.Keys.chat_class[this.Keys.chat_instance][this.Keys.event_chat_text]);
         }
         var _loc17_:* = this.tfm[this.Keys.player];
         if (this.recording && !this.preview_mode)
         {
            if (_loc17_)
            {
               _loc2_ = _loc17_[this.Keys.player_name];
               if (!_loc17_[this.Keys.is_dead] && Boolean(this.stalked_players[_loc2_]))
               {
                  ++ this.rec_frame;
                  _loc3_ = this.last_ducking;
                  _loc4_ = this.last_jumping;
                  _loc5_ = this.last_moving_left;
                  _loc6_ = this.last_moving_right;
                  this.last_ducking = _loc17_[this.Keys.is_down];
                  this.last_jumping = _loc17_[this.Keys.is_jumping];
                  this.last_moving_left = _loc17_[this.Keys.player_moving_left];
                  this.last_moving_right = _loc17_[this.Keys.player_moving_right];
                  if (_loc5_ != this.last_moving_left || _loc6_ != this.last_moving_right || _loc4_ != this.last_jumping || this.rec_frame >= 6)
                  {
                     (_loc7_ = {}).mr = this.last_moving_right;
                     _loc7_.ml = this.last_moving_left;
                     _loc8_ = _loc17_[this.Keys.player_physics][this.Keys.get_x_form]();
                     _loc9_ = _loc17_[this.Keys.player_physics][this.Keys.get_linear_velocity]();
                     _loc7_.x = int(_loc8_.position[this.Keys.pos_x] * 100);
                     _loc7_.y = int(_loc8_.position[this.Keys.pos_y] * 100);
                     _loc7_.vx = int(_loc9_[this.Keys.pos_x] * 100);
                     _loc7_.vy = int(_loc9_[this.Keys.pos_y] * 100);
                     _loc7_.jump = this.last_jumping;
                     _loc7_.frame = _loc17_[this.Keys.current_frame];
                     this.save_movement(_loc2_, _loc7_, "walk");
                     this.rec_frame = 0;
                  }
                  if (_loc3_ != this.last_ducking)
                  {
                     this.save_movement(_loc2_, this.last_ducking ? 1 : 0, "crouch");
                  }
               }
               else
               {
                  this.rec_frame = 0;
               }
            }
         }
         if (this.Keys.checker_class)
         {
            if (this.Keys.frame_loop_class)
            {
               this.Keys.frame_loop_class[this.Keys.new_check] = getTimer();
            }
            this.Keys.checker_class[this.Keys.check_pos] = false;
            try
            {
               this.Keys.checker_class[this.Keys.check_id] = 0;
               this.Keys.checker_class[this.Keys.check_timestamp] = -666;
               if (this.Keys.checker_class[this.Keys.check_timer] != null)
               {
                  if ((this.Keys.checker_class[this.Keys.check_timer] as Timer).running)
                  {
                     this.Keys.checker_class[this.Keys.check_timer].stop();
                     this.Keys.checker_class[this.Keys.check_timer] = null;
                  }
               }
            }
            catch (error:Error)
            {
            }
            if (_loc17_ && Boolean(_loc17_[this.Keys.player_clip]))
            {
               if (this.change_jump_delay)
               {
                  _loc17_[this.Keys.jump_timestamp] = getTimer() - Number(this.Interface.jump2_input[this.Keys.text_field].text) * 1000;
               }
               if (this.change_movement_speed)
               {
                  if (Boolean(_loc17_[this.Keys.player_moving_left]) || Boolean(_loc17_[this.Keys.player_moving_right]))
                  {
                     _loc10_ = Number(this.Interface.movement_input[this.Keys.text_field].text);
                     if (_loc17_[this.Keys.player_moving_left])
                     {
                        if (_loc17_[this.Keys.player_physics][this.Keys.physics_state][this.Keys.physics_state_vx] > -_loc10_)
                        {
                           _loc17_[this.Keys.player_physics][this.Keys.physics_state][this.Keys.physics_state_vx] -= 0.1;
                        }
                     }
                     else if (_loc17_[this.Keys.player_physics][this.Keys.physics_state][this.Keys.physics_state_vx] < _loc10_)
                     {
                        _loc17_[this.Keys.player_physics][this.Keys.physics_state][this.Keys.physics_state_vx] += 0.1;
                     }
                  }
               }
               if (this.Keys.mouse_info_class)
               {
                  if (this.change_jump_height)
                  {
                     this.Keys.mouse_info_class[this.Keys.mouse_info_instance][this.Keys.jump_height] = Number(this.Interface.jump_input[this.Keys.text_field].text);
                  }
               }
               if (this.mass_reduction)
               {
                  this.Keys.anim_class[this.Keys.update_coord](_loc17_, Number(this.Interface.mass_input[this.Keys.text_field].text));
               }
            }
         }
         if (this.disable_objects)
         {
            this.Statements.hide_objects();
         }
         if (this.no_delay)
         {
            if (Boolean(this.Keys.frame_loop_class) && Boolean(this.Keys.frame_loop_class[this.Keys.victory_time]))
            {
               _loc11_ = this.Keys.frame_loop_class[this.Keys.victory_time];
               if (this.last_victory_time != _loc11_)
               {
                  ++ this.last_victory_order;
                  _loc12_ = (_loc12_ = (getTimer() - this.round_start_time) / 10 - 1) < 0 ? 0 : _loc12_;
                  _loc13_ = this.Statements.new_victory_packet(0, _loc17_[this.Keys.player_id], 0, this.last_victory_order, _loc12_);
                  this.Keys.packet_handler_class[this.Keys.packet_handler](_loc13_);
                  if (this.is_records_room)
                  {
                     _loc14_ = "<ROSE>You beat map CODE in TIME seconds!";
                     _loc15_ = this.current_map_code;
                     if (!this.current_map_xml)
                     {
                        _loc15_ = _loc15_.replace("@", "");
                     }
                     _loc14_ = _loc14_.replace("CODE", _loc15_).replace("TIME", (_loc12_ / 100).toFixed(2));
                     (_loc16_ = new ByteArray()).writeUTF(_loc14_);
                     this.Keys.packet_handler_class[this.Keys.packet_handler](this.Statements.parse_packet(6, 9, _loc16_));
                  }
                  this.last_victory_time = _loc11_;
               }
            }
         }
         if (_loc17_)
         {
            if (Boolean(_loc17_[this.Keys.player_cheese]) && !this.player_has_cheese)
            {
               this.player_has_cheese = true;
               if (this.no_delay)
               {
                  _loc13_ = this.Statements.new_cheese_packet(_loc17_[this.Keys.player_id], true);
                  this.Keys.packet_handler_class[this.Keys.packet_handler](_loc13_);
               }
            }
         }
         if (this.insta_death)
         {
            if (_loc17_)
            {
               if (this.round_has_winner && !_loc17_[this.Keys.is_dead] && !this.player_is_shaman)
               {
                  this.Statements.kill_player();
               }
            }
         }
         if (this.l3v3_mode && Boolean(this.l3v3_bitmap))
         {
            if (_loc17_[this.Keys.player_clip])
            {
               if (_loc17_.contains(this.l3v3_bitmap))
               {
                  if (Boolean(_loc17_[this.Keys.player_moving_left]) || Boolean(_loc17_[this.Keys.player_moving_right]))
                  {
                     if (_loc17_[this.Keys.player_moving_left])
                     {
                        this.l3v3_bitmap.scaleX = -1;
                        this.l3v3_bitmap.x = 25;
                     }
                     else
                     {
                        this.l3v3_bitmap.scaleX = 1;
                        this.l3v3_bitmap.x = -25;
                     }
                  }
               }
            }
         }
         if (this.macro)
         {
            if (this.KeyboardHandler.pressing_up_key || this.KeyboardHandler.pressing_w_key)
            {
               this.Statements.press_key(Number(this.Interface.macro_input[this.Keys.text_field].text), this.KeyboardHandler.pressing_w_key ? uint(Keyboard.W) : uint(Keyboard.UP));
            }
         }
      }

      public function parse_key_down(param1:KeyboardEvent):void
      {
         var chat_text_field:*;
         var chat_instance:* = undefined;
         var chat_container:* = undefined;
         var chat_text:String = null;
         var args:Array = null;
         var tag:String = null;
         var state:String = null;
         var result:Array = null;
         var player:String = null;
         var txt:String = null;
         var i:uint = 0;
         var info:Object = null;
         var index:uint = 0;
         var _loc_3:* = undefined;
         var fix:* = undefined;
         var event:KeyboardEvent = param1;
         if (Boolean(this.Keys.chat_class) && Boolean(this.Keys.chat_class[this.Keys.chat_instance]))
         {
            chat_instance = this.Keys.chat_class[this.Keys.chat_instance];
            if (chat_instance[this.Keys.chat_container])
            {
               chat_container = chat_instance[this.Keys.chat_container];
            }
         }
         if (!chat_instance || !chat_container)
         {
            return;
         }
         chat_text_field = chat_container[this.Keys.chat_text_field];
         if (event.keyCode == Keyboard.ENTER)
         {
            if (stage.focus == chat_text_field)
            {
               chat_text = String(chat_text_field.text);
               args = chat_text.split(" ");
               if (args[0] == "/ping")
               {
                  if (this.low_ping)
                  {
                     chat_text_field.text = "";
                     _loc_3 = this.Keys.chat_class2;
                     _loc_3[this.Keys.chat_message2]("<BL>ping ~" + this.ping + "</BL>", true);
                  }
               }
               else if (args[0] == "/pong")
               {
                  chat_text_field.text = "";
                  _loc_3 = this.Keys.socket_class[this.Keys.bulle_socket_instance];
                  _loc_3[this.Keys.data_sender](new this.Keys.command_packet_class("ping"));
               }
               else if (args[0] == "/xml")
               {
                  if (args[1] == "auto")
                  {
                     this.get_map_xml = !this.get_map_xml;
                     tag = this.get_map_xml ? "VP" : "R";
                     state = this.get_map_xml ? "on" : "off";
                     _loc_3 = this.Keys.chat_class2;
                     _loc_3[this.Keys.chat_message2]("<" + tag + ">XML auto: " + state + "</" + tag + ">");
                  }
                  else
                  {
                     _loc_3 = this.Keys.chat_class2;
                     _loc_3[this.Keys.chat_message2]("<J>" + this.current_map_code + " XML:</J> <BL>" + this.current_map_xml.replace(/</g, "&lt;") + "</BL>");
                  }
               }
               else if (args[0] == "/stalk")
               {
                  if (!args[1] || args[1].toLowerCase() == "clear" || args[1].toLowerCase() == "reset")
                  {
                     this.stalked_players = new Array();
                     this.first_stalked_player = "";
                  }
                  else
                  {
                     i = 1;
                     while (i < args.length)
                     {
                        if (args[i] != " " && args[i] != "")
                        {
                           this.set_stalked_player(args[i]);
                        }
                        i++;
                     }
                  }
                  result = new Array();
                  for (player in this.stalked_players)
                  {
                     result.push(player);
                  }
                  txt = result.length > 0 ? "<VP>[Autoplay] " + this.Keys.translate("AP0") + ": " + result.join(", ") + "</VP>" : "<R>[Autoplay] " + this.Keys.translate("AP1") + "</R>";
                  this.Keys.chat_class2[this.Keys.chat_message2](txt);
               }
               else if (args[0] == "/setmenu")
               {
                  this.Interface.menu_x = Number(args[1] || 0);
                  this.Interface.menu_y = Number(args[2] || 0);
                  this.Interface.menu_ui.x = this.Interface.menu_x;
                  this.Interface.menu_ui.y = this.Interface.menu_y;
               }
               else if (args[0] == "/menu")
               {
                  if (args[1] == "on")
                  {
                     this.Interface.keys.open_menu.using_shortcut = true;
                  }
               }
               else if (args[0] == "/save" || args[0] == "/saveconfig")
               {
                  this.Statements.save_config();
               }
               else if (args[0] == "/ajuda" || args[0] == "/help" || args[0] == "/comandos" || args[0] == "/commands")
               {
                  this.Interface.ls_commands();
               }
               else if (args[0] == "/animlimit")
               {
                  this.anim_limit = Number(args[1] || -1);
               }
               else if (args[0] == "/logs")
               {
                  this.show_logs = !this.show_logs;
               }
               else if (args[0] == "/nobulle")
               {
                  this.no_bulle = !this.no_bulle;
               }
               else if (args[0] == "/rec")
               {
                  info = this.Statements.get_map_record(String(args[1]) || this.current_map_code, String(args[2]) || null);
                  if (info.times == null)
                  {
                     this.Keys.chat_class2[this.Keys.chat_message2]("<R>" + this.Keys.translate("REC3") + "</R>");
                  }
                  else if (info.times.length == 0)
                  {
                     this.Keys.chat_class2[this.Keys.chat_message2]("<R>" + this.Keys.translate("REC2") + "</R>");
                  }
                  else
                  {
                     this.Keys.chat_class2[this.Keys.chat_message2]("<VP>" + info.map_code + " " + this.Keys.translate("REC1") + info.times.join("/") + "</VP>");
                  }
               }
               else if (args[0] == "/soft")
               {
                  if (this.premium_level == "PLATINUM")
                  {
                     if (args[1])
                     {
                        if (args[1] == "del")
                        {
                           this.Statements.save_soft(!!args[2] ? String(args[2]) : this.current_map_code);
                        }
                        else
                        {
                           this.Statements.save_soft(args[1], this.current_map_xml);
                        }
                     }
                  }
               }
               else if (args[0] == "/look")
               {
                  if (args[1])
                  {
                     this.tfm[this.Keys.player][this.Keys.player_look] = args[1];
                  }
               }
               else if (["/prev", "/next", "/mapindex", "/setindex"].indexOf(args[0]) > -1)
               {
                  if (this.is_records_room)
                  {
                     if (args[0] == "/next" || args[0] == "/prev" || args[0] == "/setindex")
                     {
                        fix = function(param1:uint):uint
                        {
                           if (param1 < 0)
                           {
                              param1 = 0;
                           }
                           else if (param1 >= p17_maps_list.length)
                           {
                              param1 = p17_maps_list.length - 1;
                           }
                           return param1;
                        };
                        if (args[0] == "/setindex")
                        {
                           this.p17_map_index = this.fix(Number(args[1] || 0));
                           this.Keys.chat_class2[this.Keys.chat_message2]("<N>Map index is now " + this.p17_map_index + ". Use <J>/prev or /next</J> to change map according to its index</N>");
                        }
                        else
                        {
                           index = Number(args[1] || 1);
                           this.p17_map_index -= args[0] == "/prev" ? index : -index;
                           this.p17_map_index = this.fix(this.p17_map_index);
                           chat_text_field.text = "!np " + this.p17_maps_list[this.p17_map_index];
                        }
                     }
                     else if (args[0] == "/mapindex")
                     {
                        this.Keys.chat_class2[this.Keys.chat_message2]("<N>Current map index is " + this.p17_map_index + "</N>");
                     }
                  }
                  else
                  {
                     this.tfm[this.Keys.chat_message]("\n\n\n\n\n\n\n\n\n\n\n<ROSE>/room *#records0" + this.tfm[this.Keys.player][this.Keys.player_name] + " bootcamp</ROSE>");
                  }
               }
               chat_instance[this.Keys.event_chat_text](event);
               stage.focus = this.tfm;
               return;
            }
            if (event.shiftKey && stage.focus != chat_container)
            {
               chat_instance[this.Keys.chat_shift](!_loc_3[this.Keys.chat_is_upper]);
            }
            else if (!(Boolean(stage.focus) && stage.focus is TextField && (stage.focus as TextField).type == TextFieldType.INPUT))
            {
               stage.focus = chat_text_field;
            }
         }
         else
         {
            chat_instance[this.Keys.event_chat_text](event);
         }
      }

      public function mouse_down(param1:MouseEvent):void
      {
         this.txt_container.startDrag();
      }

      public function mouse_up(param1:MouseEvent):void
      {
         this.txt_container.stopDrag();
      }

      public function on_socket_data(param1:ProgressEvent = null, param2:Boolean = false, param3:String = null):void
      {
         var _loc6_:* = 0;
         var _loc4_:* = undefined;
         if (param3 == "main")
         {
            _loc4_ = this.Keys.socket_class[this.Keys.main_socket_instance];
         }
         else
         {
            _loc4_ = this.Keys.socket_class[this.Keys.bulle_socket_instance];
         }
         var _loc5_:*;
         if (!(_loc5_ = _loc4_[this.Keys.socket_name]).bytesAvailable)
         {
            return;
         }
         if (param2)
         {
            ++ _loc4_[this.Keys.data_id];
         }
         else
         {
            _loc4_[this.Keys.data_id] = 0;
         }
         if (!_loc4_[this.Keys.read_data])
         {
            while (_loc5_.bytesAvailable)
            {
               _loc6_ = _loc5_.readByte() & 255;
               _loc4_[this.Keys.data_len] |= (_loc6_ & 127) << _loc4_[this.Keys.data_offset] * 7;
               ++_loc4_[this.Keys.data_offset];
               if ((_loc6_ & 128) == 128 && _loc4_[this.Keys.data_offset] < 5)
               {
                  continue;
               }
               _loc4_[this.Keys.read_data] = true;
            }
            return;
         }
         if (Boolean(_loc4_[this.Keys.read_data]) && _loc5_.bytesAvailable >= _loc4_[this.Keys.data_len])
         {
            _loc4_[this.Keys.socket_data].clear();
            try
            {
               _loc5_.readBytes(_loc4_[this.Keys.socket_data], 0, _loc4_[this.Keys.data_len]);
               this.handle_packet(_loc4_[this.Keys.socket_data], param3);
            }
            catch (e:Error)
            {
            }
            _loc4_[this.Keys.data_len] = 0;
            _loc4_[this.Keys.data_offset] = 0;
            _loc4_[this.Keys.read_data] = false;
            if (Boolean(_loc5_.connected) && Boolean(_loc5_.bytesAvailable))
            {
               if (_loc4_[this.Keys.data_id] < 200)
               {
                  this.on_socket_data(null, true, param3);
               }
               else
               {
                  this.on_socket_data(null, false, param3);
               }
            }
         }
      }

      public function close_main_socket(param1:Event):void
      {
         this.close_socket(param1, this.main_socket_data, this.close_main_socket);
      }

      public function close_bulle_socket(param1:Event):void
      {
         this.close_socket(param1, this.bulle_socket_data, this.close_bulle_socket);
      }

      public function close_socket(param1:Event, param2:Function, param3:Function):void
      {
         param1.currentTarget.removeEventListener(ProgressEvent.SOCKET_DATA, param2);
         param1.currentTarget.removeEventListener(Event.CLOSE, param3);
      }

      public function main_socket_data(param1:ProgressEvent):void
      {
         this.on_socket_data(null, false, "main");
      }

      public function bulle_socket_data(param1:ProgressEvent):void
      {
         this.on_socket_data(null, false, "bulle");
      }

      public function handle_packet(param1:ByteArray, param2:String):void
      {
         var _loc3_:* = null;
         var _loc4_:* = undefined;
         var _loc5_:* = 0;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = undefined;
         var _loc9_:* = false;
         var _loc10_:* = false;
         var _loc11_:* = 0;
         var _loc12_:* = false;
         var _loc13_:* = null;
         var _loc14_:* = 0;
         var _loc15_:* = 0;
         var _loc16_:* = 0;
         var _loc17_:* = null;
         var _loc18_:* = null;
         var _loc19_:* = 0;
         var _loc20_:* = false;
         var _loc21_:* = false;
         var _loc22_:* = NaN;
         var _loc23_:* = null;
         var _loc24_:* = null;
         var _loc25_:* = null;
         var _loc26_:* = 0;
         var _loc27_:* = false;
         var _loc28_:* = null;
         var _loc29_:* = null;
         var _loc30_:* = null;
         var _loc31_:* = 0;
         var _loc32_:* = 0;
         var _loc33_:* = 0;
         var _loc34_:* = 0;
         var _loc35_:* = 0;
         var _loc36_:* = null;
         var _loc37_:* = 0;
         var _loc38_:* = 0;
         var _loc39_:* = null;
         var _loc40_:* = null;
         var _loc41_:* = null;
         var _loc42_:* = 0;
         var _loc43_:* = false;
         var _loc44_:* = null;
         var _loc45_:* = null;
         var _loc46_:* = 0;
         var _loc47_:* = 0;
         _loc3_ = new ByteArray();
         _loc3_.writeObject(param1);
         _loc3_.position = 0;
         var _loc48_:*;
         var _loc49_:* = (_loc48_ = _loc3_.readObject()).readUnsignedByte();
         var _loc50_:* = _loc48_.readUnsignedByte();
         var _loc51_:* = true;
         if (this.tfm[this.Keys.player_list])
         {
            _loc4_ = this.tfm[this.Keys.player_list];
         }
         if (_loc49_ == 4)
         {
            if (_loc50_ == 4)
            {
               _loc5_ = _loc48_.readInt();
               if (_loc4_[_loc5_])
               {
                  _loc6_ = _loc4_[_loc5_][this.Keys.player_name];
                  if (this.stalked_players[_loc6_])
                  {
                     _loc48_.readInt();
                     (_loc7_ = {}).mr = _loc48_.readBoolean();
                     _loc7_.ml = _loc48_.readBoolean();
                     _loc7_.x = _loc48_.readInt();
                     _loc7_.y = _loc48_.readInt();
                     _loc7_.vx = _loc48_.readShort();
                     _loc7_.vy = _loc48_.readShort();
                     _loc7_.jump = _loc48_.readBoolean();
                     _loc7_.frame = _loc48_.readByte();
                     if (this.recording)
                     {
                        if (!this.preview_mode)
                        {
                           this.save_movement(_loc6_, _loc7_, "walk");
                        }
                     }
                     else if (_loc6_ == this.first_stalked_player || !this.auto_play)
                     {
                        if ((_loc8_ = this.tfm[this.Keys.player])[this.Keys.player_clip])
                        {
                           _loc9_ = _loc8_[this.Keys.player_moving_left];
                           _loc10_ = _loc8_[this.Keys.player_moving_right];
                           _loc8_[this.Keys.player_moving_left] = _loc7_.ml;
                           _loc8_[this.Keys.player_moving_right] = _loc7_.mr;
                           if (_loc7_.jump)
                           {
                              _loc8_[this.Keys.jump](true, _loc7_.frame);
                           }
                           else
                           {
                              _loc8_[this.Keys.jump](false);
                           }
                           if (_loc7_.mr)
                           {
                              if (!_loc10_)
                              {
                                 _loc8_[this.Keys.animation_course](true);
                              }
                           }
                           else if (_loc7_.ml)
                           {
                              if (!_loc9_)
                              {
                                 _loc8_[this.Keys.animation_course](false);
                              }
                           }
                           else if (_loc9_ || _loc10_)
                           {
                              _loc8_[this.Keys.static_animation](_loc10_);
                           }
                           this.Statements.move_player(_loc7_.x / 100 * 30, _loc7_.y / 100 * 30, 0, _loc7_.vx / 100 * 10, _loc7_.vy / 100 * 10, 0);
                        }
                     }
                  }
               }
            }
            else if (_loc50_ == 9)
            {
               _loc5_ = _loc48_.readInt();
               if (_loc4_[_loc5_])
               {
                  _loc6_ = _loc4_[_loc5_][this.Keys.player_name];
                  if (this.stalked_players[_loc6_])
                  {
                     _loc11_ = _loc48_.readByte();
                     if (this.recording)
                     {
                        if (!this.preview_mode)
                        {
                           this.save_movement(_loc6_, _loc11_, "crouch");
                        }
                     }
                     else if (_loc6_ == this.first_stalked_player || !this.auto_play)
                     {
                        if ((_loc8_ = this.tfm[this.Keys.player])[this.Keys.player_clip])
                        {
                           _loc12_ = _loc11_ != 0;
                           _loc8_[this.Keys.is_down] = _loc12_;
                           if (_loc12_)
                           {
                              _loc8_[this.Keys.crouch](_loc8_[this.Keys.static_side]);
                           }
                           else
                           {
                              _loc8_[this.Keys.crouch2](_loc8_[this.Keys.static_side]);
                           }
                           this.Statements.send_crouch_packet(_loc11_);
                        }
                     }
                  }
               }
            }
         }
         else if (_loc49_ == 5)
         {
            if (_loc50_ == 2)
            {
               this.Statements.disable_auto_play();
               clearTimeout(this.insta_death_timeout);
               clearTimeout(this.insta_win_timeout);
               this.born_period_executed = false;
               this.player_has_cheese = false;
               this.player_is_shaman = false;
               this.preview_mode = false;
               this.round_has_winner = false;
               this.current_map_data = "";
               this.current_map_xml = "";
               this.anim_exec = 0;
               this.last_victory_order = 0;
               this.last_victory_time2 = 666 * 666;
               this.round_start_time = getTimer();
               if (!this.Interface)
               {
                  this.Interface = new ChargeurTransformice_fla.Interface();
               }
               this.Interface.disable_ap_buttons(!this.maps_allowed);
               this.current_map_code_int = _loc48_.readInt();
               _loc13_ = "@" + this.current_map_code_int;
               this.current_map_code = _loc13_;
               _loc14_ = _loc48_.readShort();
               _loc15_ = _loc48_.readByte();
               this.current_round_code = _loc15_;
               _loc16_ = _loc48_.readInt();
               _loc17_ = "";
               if (_loc16_)
               {
                  _loc3_ = new ByteArray();
                  _loc48_.readBytes(_loc3_, 0, _loc16_);
                  _loc3_.uncompress("zlib");
                  _loc3_.position = 0;
                  _loc17_ = _loc3_.readUTFBytes(_loc3_.length);
               }
               this.current_map_xml = _loc17_;
               this.map_width = this.Statements.get_map_width(this.current_map_xml);
               if (this.get_map_xml)
               {
                  this.Keys.chat_class2[this.Keys.chat_message2]("<J>" + _loc13_ + " XML:</J> <BL>" + _loc17_.replace(/</g, "&lt;") + "</BL>");
               }
               _loc18_ = _loc48_.readUTF();
               _loc19_ = _loc48_.readByte();
               _loc20_ = _loc48_.readBoolean();
               this.reverse_map = _loc20_;
               if (this.protected_maps)
               {
                  _loc21_ = _loc13_ in this.protected_maps ? this.protected_maps[_loc13_] == _loc17_ : true;
               }
               if (this.check_anti_leve)
               {
                  if (_loc19_ == 38 || !_loc21_)
                  {
                     stage.addChild(this.txt_container);
                  }
                  else
                  {
                     this.Statements.remove_leve_check();
                  }
               }
               else
               {
                  this.Statements.remove_leve_check();
               }
               if (this.born_timer != null)
               {
                  this.born_timer.removeEventListener(TimerEvent.TIMER, this.Statements.handle_born_timer);
                  this.born_timer = null;
               }
               if (this.born_period)
               {
                  if (!this.born_period_executed)
                  {
                     this.born_period_executed = true;
                     this.born_timer = new Timer(Number(this.Interface.timer_input[this.Keys.text_field].text) * 1000);
                     this.born_timer.addEventListener(TimerEvent.TIMER, this.Statements.handle_born_timer);
                     this.born_timer.start();
                  }
               }
               if (this.soft_mode && Boolean(this.soft_list))
               {
                  if (_loc13_ in this.soft_list)
                  {
                     if (_loc21_)
                     {
                        if (_loc23_ = this.soft_list[_loc13_])
                        {
                           (_loc24_ = new ByteArray()).writeUTFBytes(_loc23_);
                           _loc24_.compress("zlib");
                           _loc25_ = this.Statements.new_soft_packet(this.current_map_code_int, _loc14_, _loc15_, _loc24_, _loc18_, _loc19_, _loc20_, _loc48_.readBoolean(), _loc48_.readBoolean(), _loc48_.readBoolean(), _loc48_.readInt());
                           this.Keys.packet_handler_class[this.Keys.packet_handler](_loc25_);
                           _loc51_ = false;
                        }
                     }
                  }
               }
               if (this.insta_death2)
               {
                  this.insta_death_timeout = setTimeout(this.Statements.player_death, Number(this.Interface.insta_death2_input[this.Keys.text_field].text) * 1000);
               }
               if (this.insta_win)
               {
                  this.insta_win_timeout = setTimeout(this.Statements.player_victory, Number(this.Interface.insta_win_input[this.Keys.text_field].text) * 1000);
               }
               if (this.recording)
               {
                  this.Interface.set_status("rec");
                  for (_loc6_ in this.stalked_players)
                  {
                     this.set_stalked_player(_loc6_, true);
                  }
               }
               else
               {
                  this.Interface.set_status();
               }
               if (_loc19_ == 17)
               {
                  if ((_loc26_ = this.p17_maps_list.indexOf(this.current_map_code)) > -1)
                  {
                     this.p17_map_index = _loc26_;
                  }
               }
               if (this.auto_play)
               {
                  if (_loc21_)
                  {
                     stage.addEventListener(Event.ENTER_FRAME, this.Statements.play_map);
                  }
               }
               if (this.maps_allowed && Boolean(this.Interface.del_button))
               {
                  this.Interface.del_button[this.Keys.set_button_state](_loc13_ in this.Keys.maps);
               }
               if (this.disable_scoreboard)
               {
                  this.Statements.chande_scoreboard_display();
               }
            }
            else if (_loc50_ == 21)
            {
               _loc48_.readBoolean();
               _loc28_ = _loc48_.readUTF();
               this.is_records_room = _loc28_.toLocaleLowerCase().indexOf("#records") != -1;
               this.is_bootcamp_room = _loc28_.toLocaleLowerCase().indexOf("bootcamp") != -1;
               if (!this.is_records_room)
               {
                  this.recording = false;
                  this.stalked_players = new Array();
                  this.Interface.set_status();
               }
            }
         }
         else if (_loc49_ == 6)
         {
            if (_loc50_ == 6)
            {
               _loc29_ = _loc48_.readUTF();
               _loc30_ = _loc48_.readUTF();
            }
            else if (_loc50_ == 9)
            {
               if (this.no_delay)
               {
                  if ((_loc30_ = _loc48_.readUTF()).indexOf("You beat map") != -1)
                  {
                     _loc51_ = false;
                  }
               }
            }
         }
         else if (_loc49_ == 8)
         {
            if (_loc50_ == 1)
            {
               if (this.anim_limit != -1)
               {
                  ++ this.anim_exec;
                  if (this.anim_exec >= this.anim_limit)
                  {
                     _loc51_ = false;
                  }
               }
               if (this.disable_animations)
               {
                  _loc51_ = false;
               }
            }
            else if (_loc50_ == 6)
            {
               this.round_has_winner = true;
               _loc31_ = _loc48_.readByte();
               _loc32_ = _loc48_.readInt();
               _loc33_ = _loc48_.readShort();
               _loc34_ = _loc48_.readByte();
               _loc35_ = _loc48_.readUnsignedShort();
               _loc5_ = this.tfm[this.Keys.player][this.Keys.player_id];
               if (_loc32_ == _loc5_)
               {
                  if (this.auto_play)
                  {
                     this.last_victory_time2 = _loc35_;
                  }
               }
               if (_loc4_[_loc32_])
               {
                  _loc6_ = _loc4_[_loc32_][this.Keys.player_name];
                  if (this.stalked_players[_loc6_])
                  {
                     if (this.recording)
                     {
                        if (!this.preview_mode)
                        {
                           if (this.reverse_map)
                           {
                              this.tfm[this.Keys.chat_message]("<R>" + this.Keys.translate("RI0") + "</R>");
                           }
                           else if (_loc35_ < this.last_victory_time2)
                           {
                              this.save_movement(_loc6_, 0, "hole");
                              this.current_map_data = JSONE.encode(this.stalked_players[_loc6_]["movements"]);
                              this.last_victory_time2 = _loc35_;
                              this.Interface.preview_button[this.Keys.set_button_state](this.maps_allowed);
                              this.Interface.save_button[this.Keys.set_button_state](this.maps_allowed);
                           }
                           this.set_stalked_player(_loc6_, true);
                        }
                     }
                     else if (_loc6_ == this.first_stalked_player || !this.auto_play)
                     {
                        this.Statements.send_hole_packet();
                     }
                  }
               }
               if (this.no_delay)
               {
                  if (this.last_victory_order == _loc34_)
                  {
                     _loc51_ = false;
                     if (_loc32_ != _loc5_)
                     {
                        _loc34_++;
                        _loc25_ = this.Statements.new_victory_packet(_loc31_, _loc32_, _loc33_, _loc34_, _loc35_);
                        this.Keys.packet_handler_class[this.Keys.packet_handler](_loc25_);
                     }
                  }
                  this.last_victory_order = _loc34_;
               }
            }
            else if (_loc50_ == 11)
            {
               _loc36_ = [_loc48_.readInt(), _loc48_.readInt()];
               this.player_is_shaman = _loc36_[0] == this.tfm[this.Keys.player][this.Keys.player_id] || _loc36_[1] == this.tfm[this.Keys.player][this.Keys.player_id];
            }
            else if (_loc50_ == 44)
            {
               if (this.disable_animations)
               {
                  _loc51_ = false;
               }
            }
         }
         else if (_loc49_ == 26)
         {
            if (_loc50_ == 2)
            {
               _loc48_.readInt();
               this.Statements.send_login_result(_loc48_.readUTF().replace("+", "%2B").replace("#", "%23"));
            }
            else if (_loc50_ == 3)
            {
               this.tfm[this.Keys.loader_url] = "app:/TransformiceAIR.swf/[[DYNAMIC]]/2/[[DYNAMIC]]/4";
            }
         }
         else if (_loc49_ == 60)
         {
            if (_loc50_ == 3)
            {
               if ((_loc42_ = _loc48_.readShort()) == 66)
               {
                  _loc29_ = _loc48_.readUTFBytes(_loc48_.readShort());
                  _loc48_.readInt();
                  _loc48_.readUTFBytes(_loc48_.readShort());
                  _loc30_ = _loc48_.readUTFBytes(_loc48_.readShort());
               }
            }
         }
         else if (_loc49_ == 144)
         {
            if (_loc50_ == 1)
            {
               this.Keys.packet_handler_class[this.Keys.packet_handler](param1);
               if (this.hide_players)
               {
                  this.Statements.hide_players();
               }
               if (this.l3v3_mode)
               {
                  this.Statements.set_player_bitmap();
               }
               _loc51_ = false;
            }
            else if (_loc50_ == 2)
            {
               _loc48_.readUTF();
               if (_loc43_ = _loc48_.readInt() == this.tfm[this.Keys.player][this.Keys.player_id])
               {
                  this.player_has_cheese = false;
                  if (this.is_bootcamp_room)
                  {
                     this.round_start_time = getTimer();
                  }
                  this.Statements.disable_auto_play();
                  clearTimeout(this.insta_death_timeout);
                  clearTimeout(this.insta_win_timeout);
                  if (this.insta_death2)
                  {
                     this.insta_death_timeout = setTimeout(this.Statements.player_death, Number(this.Interface.insta_death2_input[this.Keys.text_field].text) * 1000);
                  }
                  if (this.insta_win)
                  {
                     this.insta_win_timeout = setTimeout(this.Statements.player_victory, Number(this.Interface.insta_win_input[this.Keys.text_field].text) * 1000);
                  }
                  if (this.auto_play || this.preview_mode)
                  {
                     stage.addEventListener(Event.ENTER_FRAME, this.Statements.play_map);
                  }
                  if (this.l3v3_mode)
                  {
                     this.Keys.packet_handler_class[this.Keys.packet_handler](param1);
                     this.Statements.set_player_bitmap();
                     _loc51_ = false;
                  }
               }
               if (this.hide_players && _loc51_)
               {
                  _loc51_ = _loc43_;
               }
            }
            else if (_loc50_ == 6)
            {
               _loc5_ = this.tfm[this.Keys.player][this.Keys.player_id];
               if (_loc4_[_loc5_])
               {
                  _loc6_ = _loc4_[_loc5_][this.Keys.player_name];
                  if (this.stalked_players[_loc6_])
                  {
                     if (this.recording)
                     {
                        if (!this.preview_mode)
                        {
                           this.save_movement(_loc6_, 0, "cheese");
                        }
                     }
                     else if (_loc6_ == this.first_stalked_player || !this.auto_play)
                     {
                        this.Statements.send_cheese_packet();
                     }
                  }
               }
               if (this.no_delay)
               {
                  _loc51_ = _loc48_.readInt() != _loc5_;
               }
            }
         }
         else if (_loc49_ == 1)
         {
            if (_loc50_ == 1)
            {
               _loc46_ = (_loc45_ = (_loc44_ = _loc48_.readUTF().split(String.fromCharCode(1)))[0]).charCodeAt();
               _loc47_ = _loc45_.charCodeAt(1);
               if (_loc46_ == 8)
               {
                  if (_loc47_ == 5)
                  {
                     _loc5_ = _loc44_[1];
                     if (_loc4_[_loc5_])
                     {
                        _loc6_ = _loc4_[_loc5_][this.Keys.player_name];
                        if (this.stalked_players[_loc6_])
                        {
                           if (this.recording)
                           {
                              if (!this.preview_mode)
                              {
                                 this.set_stalked_player(_loc6_, true);
                              }
                           }
                           else
                           {
                              this.Statements.kill_player();
                           }
                        }
                     }
                  }
                  else if (_loc47_ == 23)
                  {
                     this.player_is_shaman = _loc44_[1] == this.tfm[this.Keys.player][this.Keys.player_id];
                  }
               }
            }
         }
         if (_loc51_)
         {
            this.Keys.packet_handler_class[this.Keys.packet_handler](param1);
         }
      }

      public function update_ping(param1:TimerEvent):void
      {
         this.ping = 5 + Math.floor(Math.random() * 13);
      }

      public function set_stalked_player(param1:String, param2:Boolean = false):void
      {
         if (!this.stalked_players[param1] || param2)
         {
            if (!this.first_stalked_player)
            {
               this.first_stalked_player = param1;
            }
            this.stalked_players[param1] = new Array();
            this.stalked_players[param1]["movements"] = new Array();
            this.stalked_players[param1]["last_movement_time"] = 0;
         }
      }

      public function save_movement(param1:String, param2:Object, param3:String):void
      {
         if (this.stalked_players[param1]["last_movement_time"] == 0)
         {
            this.stalked_players[param1]["last_movement_time"] = getTimer();
         }
         var _loc4_:* = getTimer() - this.stalked_players[param1]["last_movement_time"];
         this.stalked_players[param1]["last_movement_time"] = getTimer();
         this.stalked_players[param1]["movements"].push([param2, param3, _loc4_]);
      }

      public function invalid(param1:String):void
      {
         removeChild(this._S);
         if (Boolean(this.loader_swf) && Boolean(this.loader_swf.stage))
         {
            this.loader_swf.parent.removeChild(this.loader_swf);
         }
         var _loc2_:* = new Loader();
         addChild(_loc2_);
         _loc2_.load(new URLRequest(this.host_url + "transformice?error=" + param1));
      }
      private function dummyFunctionToIncludeJSONClasses():void
      {
         var jsonClass:Class = JSONE;
         var decoder:JSONDecoder = new JSONDecoder("");
         var encoder:JSONEncoder = new JSONEncoder(null);
         var error:JSONParseError = new JSONParseError();
         var token:JSONToken = new JSONToken();
         var tokenizer:JSONTokenizer = new JSONTokenizer("");
         var tokenType:JSONTokenType = new JSONTokenType();

      }

   }

}
