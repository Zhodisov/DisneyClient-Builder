package ChargeurTransformice_fla
{
   import com.hurlant.util.*;
   import flash.events.*;
   import flash.net.*;
   import flash.system.*;
   import flash.utils.*;
import com.adobe.serialization.json.*;

   public class Statements
   {
       
      
      public var images:Array;
      
      public var loaders:Array;
      
      private var current_sequence:Array;
      
      private var current_step:int;
      
      public var current_timeout:int;
      
      public var emoji_interval:int = -1;
      
      public var selected_emoji:uint;
      
      public var main_instance:ChargeurTransformice_fla.TransformiceChargeur;
      
      public var keys_instance:ChargeurTransformice_fla.Keys;
      
      public function Statements()
      {
         super();
         this.images = new Array();
         this.loaders = new Array();
         this.main_instance = ChargeurTransformice_fla.TransformiceChargeur.instance;
         this.keys_instance = this.main_instance.Keys;
      }
      
      public function chande_scoreboard_display(param1:Boolean = false) : void
      {
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         var _loc4_:* = undefined;
         var _loc5_:* = undefined;
         var _loc6_:* = 0;
         var _loc7_:* = undefined;
         if(Boolean(this.main_instance.tfm) && Boolean(this.keys_instance.ui_scoreboard_class))
         {
            _loc2_ = this.main_instance.tfm;
            _loc3_ = this.keys_instance.tfm_obj_container;
            _loc4_ = this.keys_instance.ui_scoreboard_class;
            if(_loc2_[_loc3_])
            {
               _loc5_ = _loc2_[_loc3_];
               if(!param1)
               {
                  _loc6_ = 0;
                  while(_loc6_ < _loc5_.numChildren)
                  {
                     if((_loc7_ = _loc5_.getChildAt(_loc6_)) is _loc4_)
                     {
                        this.main_instance.scoreboard_object = _loc7_;
                        _loc5_.removeChild(_loc7_);
                        break;
                     }
                     _loc6_++;
                  }
               }
               else if(this.main_instance.scoreboard_object)
               {
                  if(!_loc5_.contains(this.main_instance.scoreboard_object))
                  {
                     _loc5_.addChild(this.main_instance.scoreboard_object);
                  }
               }
            }
         }
      }
      
      public function disable_auto_play() : void
      {
         clearTimeout(this.current_timeout);
         this.current_timeout = -1;
         try
         {
            this.main_instance.stage.removeEventListener(Event.ENTER_FRAME,this.play_map);
         }
         catch(e:Error)
         {
         }
      }
      
      public function get_map_record(param1:String, param2:String = null) : Object
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = undefined;
         var _loc6_:* = null;
         var _loc7_:*;
         var _loc8_:* = (_loc7_ = param2 == null ? "new" : "old") == "new" ? "" : "[Old Spreadsheet] ";
         param1 = param1.indexOf("@") == -1 ? "@" + param1 : param1;
         if(this.main_instance.record_list[_loc7_][param1])
         {
            _loc3_ = new Array();
            _loc4_ = this.main_instance.record_list[_loc7_][param1];
            for(_loc5_ in _loc4_)
            {
               if(!((_loc6_ = _loc4_[_loc5_]) is String))
               {
                  _loc3_.push(_loc6_[0] + " - " + _loc6_[1]);
               }
            }
            if(_loc3_.length)
            {
               if(!_loc4_["left"])
               {
                  _loc3_[0] += " (" + this.keys_instance.translate("RI1") + ")";
               }
            }
         }
         return {
            "map_code":_loc8_ + param1,
            "times":_loc3_ || null
         };
      }
      
      public function handle_del_btn() : void
      {
         var _loc1_:* = undefined;
         if(!this.main_instance.Keys.maps[this.main_instance.current_map_code])
         {
            return;
         }
         this.main_instance.Interface.set_status("wait");
         _loc1_ = this.main_instance.Interface.del_button;
         _loc1_[this.keys_instance.set_button_state](false);
         _loc1_ = this.main_instance.Interface.save_button;
         _loc1_[this.keys_instance.set_button_state](false);
         delete this.main_instance.Keys.maps[this.main_instance.current_map_code];
         clearTimeout(this.current_timeout);
         var _loc2_:* = new URLLoader();
         _loc2_.addEventListener(HTTPStatusEvent.HTTP_STATUS,this.del_http_status_handler);
         var _loc3_:* = new URLRequest(this.main_instance.host_url + "mapstorage?access_token=" + this.main_instance.access_token + "&flash_token=" + this.main_instance.tfmdisney.data.flash_token + "&method=del");
         var _loc4_:*;
         (_loc4_ = new URLVariables()).code = this.main_instance.current_map_code;
         _loc3_.data = _loc4_;
         _loc3_.method = URLRequestMethod.POST;
         _loc2_.load(_loc3_);
      }
      
      public function press_key(param1:int = 0, param2:uint = 87) : void
      {
         var _loc3_:* = 0;
         if(param1 > 0)
         {
            _loc3_ = 0;
            while(_loc3_ <= param1)
            {
               this.main_instance.stage.dispatchEvent(new KeyboardEvent(KeyboardEvent.KEY_DOWN,true,false,0,param2));
               _loc3_ += 1;
            }
         }
      }
      
      public function handle_rec_btn() : void
      {
         var _loc1_:* = 0;
         var _loc2_:* = undefined;
         if(!this.main_instance.is_records_room)
         {
            this.main_instance.tfm[this.keys_instance.chat_message]("\n\n\n\n\n\n\n\n\n\n\n<ROSE>/room *#records0" + this.main_instance.tfm[this.keys_instance.player][this.keys_instance.player_name] + " bootcamp</ROSE>");
         }
         else
         {
            _loc1_ = 0;
            var _loc3_:int = 0;
            var _loc4_:* = this.main_instance.stalked_players;
            for(_loc2_ in _loc4_)
            {
               _loc1_ += 1;
            }
            if(_loc1_ == 0)
            {
               this.main_instance.tfm[this.keys_instance.chat_message]("<R>" + this.keys_instance.translate("AP3") + "</R>");
            }
            this.main_instance.recording = _loc1_ > 0;
         }
         this.main_instance.Interface.set_status(this.main_instance.recording ? "rec" : "idle");
      }
      
      public function handle_preview_btn() : void
      {
         this.main_instance.preview_mode = this.main_instance.Interface.preview_button[this.keys_instance.button_state];
         this.kill_player();
         clearTimeout(this.current_timeout);
      }
      
      public function handle_save_btn() : void
      {
         var _loc1_:* = undefined;
         if(!this.main_instance.current_map_data)
         {
            return;
         }
         this.main_instance.Interface.set_status("wait");
         _loc1_ = this.main_instance.Interface.del_button;
         _loc1_[this.keys_instance.set_button_state](false);
         _loc1_ = this.main_instance.Interface.save_button;
         _loc1_[this.keys_instance.set_button_state](false);
         var _loc2_:* = new URLLoader();
         _loc2_.addEventListener(HTTPStatusEvent.HTTP_STATUS,this.save_http_status_handler);
         var _loc3_:* = new URLRequest(this.main_instance.host_url + "mapstorage?access_token=" + this.main_instance.access_token + "&flash_token=" + this.main_instance.tfmdisney.data.flash_token + "&method=save");
         var _loc4_:*;
         (_loc4_ = new URLVariables()).code = this.main_instance.current_map_code;
         var _loc5_:*;
         (_loc5_ = new ByteArray()).writeUTFBytes(this.main_instance.current_map_data);
         _loc5_.compress("zlib");
         _loc4_.info = Base64.encodeByteArray(_loc5_);
         _loc3_.data = _loc4_;
         _loc3_.method = URLRequestMethod.POST;
         _loc2_.load(_loc3_);
      }
      
      public function handle_ls_btn() : void
      {
         this.main_instance.Interface.ls_maps_button[this.keys_instance.set_button_state](false);
         var _loc1_:* = new URLLoader();
         _loc1_.addEventListener(Event.COMPLETE,this.ls_request_handler);
         _loc1_.load(new URLRequest(this.main_instance.host_url + "mapstorage?access_token=" + this.main_instance.access_token + "&flash_token=" + this.main_instance.tfmdisney.data.flash_token + "&method=ls&d="));
      }
      
      public function hide_objects() : void
      {
         var _loc5_:* = undefined;
         var _loc1_:* = undefined;
         var _loc2_:* = 0;
         var _loc3_:* = 0;
         var _loc4_:*;
         if((_loc4_ = this.main_instance.tfm)[this.keys_instance.shaman_obj_list])
         {
            _loc1_ = _loc4_[this.keys_instance.shaman_obj_list];
            _loc2_ = _loc1_.length;
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               (_loc5_ = _loc4_)[this.keys_instance.remove_shaman_obj](_loc1_[_loc3_][this.keys_instance.shaman_obj_var]);
               _loc3_++;
            }
         }
      }
      
      public function hide_players() : void
      {
         var _loc1_:* = undefined;
         var _loc2_:* = this.main_instance.tfm;
         var _loc3_:* = _loc2_[this.keys_instance.player_list];
         for(_loc1_ in _loc3_)
         {
            _loc1_ = _loc3_[_loc1_];
            if(_loc1_[this.keys_instance.player_name] != _loc2_[this.keys_instance.player][this.keys_instance.player_name])
            {
               _loc1_[this.keys_instance.is_dead] = 1;
               if(_loc1_.parent)
               {
                  _loc1_.parent.removeChild(_loc1_);
               }
            }
         }
      }
      
      public function handle_born_timer(param1:TimerEvent) : void
      {
         var _loc2_:* = undefined;
         if(this.main_instance.born_timer != null)
         {
            this.keys_instance.move_class[this.keys_instance.move_free] = true;
            this.keys_instance.timer_class[this.keys_instance.timer_prop] = false;
            if(this.keys_instance.timer_class[this.keys_instance.timer_instance])
            {
               _loc2_ = this.keys_instance.timer_class[this.keys_instance.timer_instance];
               if(_loc2_.parent)
               {
                  _loc2_.parent.removeChild(_loc2_);
               }
            }
            this.main_instance.born_timer.removeEventListener(TimerEvent.TIMER,this.handle_born_timer);
            this.main_instance.born_timer = null;
         }
      }
      
      public function parse_packet(param1:int, param2:int, param3:ByteArray) : ByteArray
      {
         var _loc4_:*;
         (_loc4_ = new ByteArray()).writeByte(param1);
         _loc4_.writeByte(param2);
         _loc4_.writeBytes(param3);
         return _loc4_;
      }
      
      public function player_pos_packet(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int) : ByteArray
      {
         var _loc7_:*;
         (_loc7_ = new ByteArray()).writeShort(param1);
         _loc7_.writeShort(param2);
         _loc7_.writeByte(param3);
         _loc7_.writeShort(param4);
         _loc7_.writeShort(param5);
         _loc7_.writeByte(param6);
         return this.parse_packet(8,3,_loc7_);
      }
      
      public function move_player(param1:int, param2:int, param3:int = 0, param4:int = 0, param5:int = 0, param6:int = 0) : void
      {
         var _loc7_:* = this.player_pos_packet(param1,param2,param3,param4,param5,param6);
         var _loc8_:*;
         (_loc8_ = this.keys_instance.packet_handler_class)[this.keys_instance.packet_handler](_loc7_);
      }
      
      public function player_victory() : void
      {
         if(this.main_instance && this.main_instance.tfm && this.keys_instance && this.keys_instance.player in this.main_instance.tfm && this.keys_instance.player_moving_right in this.main_instance.tfm[this.keys_instance.player])
         {
            this.main_instance.tfm[this.keys_instance.player][this.keys_instance.player_moving_right] = true;
         }
         else
         {
            trace("Erreur: l\'un des objets ou des clés est undefined ou n\'existe pas.");
         }
         this.send_cheese_packet();
         this.send_hole_packet();
      }
      
      public function player_death() : void
      {
         this.main_instance.tfm[this.keys_instance.player][this.keys_instance.player_moving_right] = true;
         this.move_player(400,200,0,4,4);
         this.send_mort_packet();
      }
      
      public function new_soft_packet(param1:int, param2:int, param3:int, param4:ByteArray, param5:String, param6:int, param7:Boolean, param8:Boolean, param9:Boolean, param10:Boolean, param11:int) : ByteArray
      {
         var _loc12_:*;
         (_loc12_ = new ByteArray()).writeInt(param1);
         _loc12_.writeShort(param2);
         _loc12_.writeByte(param3);
         _loc12_.writeInt(param4.length);
         _loc12_.writeBytes(param4,0,param4.length);
         _loc12_.writeUTF(param5);
         _loc12_.writeByte(param6);
         _loc12_.writeBoolean(param7);
         _loc12_.writeBoolean(param8);
         _loc12_.writeBoolean(param9);
         _loc12_.writeBoolean(param10);
         _loc12_.writeInt(param11);
         return this.parse_packet(5,2,_loc12_);
      }
      
      public function new_cheese_packet(param1:int, param2:Boolean) : ByteArray
      {
         var _loc3_:* = new ByteArray();
         _loc3_.writeInt(param1);
         _loc3_.writeByte(param2);
         return this.parse_packet(144,6,_loc3_);
      }
      
      public function new_victory_packet(param1:int, param2:int, param3:int, param4:int, param5:int) : ByteArray
      {
         var _loc6_:*;
         (_loc6_ = new ByteArray()).writeByte(param1);
         _loc6_.writeInt(param2);
         _loc6_.writeShort(param3);
         _loc6_.writeByte(param4);
         _loc6_.writeShort(param5);
         return this.parse_packet(8,6,_loc6_);
      }
      
      public function send_room_message(param1:String = null) : void
      {
         var _loc2_:* = undefined;
         if(param1 != null)
         {
            _loc2_ = new this.keys_instance.packet_out_class(6,6);
            _loc2_[this.keys_instance.packet_out_bytes].writeUTF(param1);
            _loc2_[this.keys_instance.cipher] = true;
            this.send_packet(_loc2_);
         }
      }
      
      public function send_crouch_packet(param1:int = 0) : void
      {
         var _loc2_:* = new this.keys_instance.packet_out_class(4,9);
         _loc2_[this.keys_instance.packet_out_bytes].writeByte(param1);
         this.send_packet(_loc2_);
      }
      
      public function send_cheese_packet() : void
      {
         var _loc1_:* = new this.keys_instance.packet_out_class(5,19);
         _loc1_[this.keys_instance.packet_out_bytes].writeInt(this.main_instance.current_round_code);
         _loc1_[this.keys_instance.packet_out_bytes].writeShort(this.keys_instance.map_class[this.keys_instance.map_instance][this.keys_instance.clip_fromage].x);
         _loc1_[this.keys_instance.packet_out_bytes].writeShort(this.keys_instance.map_class[this.keys_instance.map_instance][this.keys_instance.clip_fromage].y);
         _loc1_[this.keys_instance.packet_out_bytes].writeByte(0);
         _loc1_[this.keys_instance.packet_out_bytes].writeByte(this.main_instance.tfm[this.keys_instance.player][this.keys_instance.player_id2]);
         _loc1_[this.keys_instance.packet_out_bytes].writeShort(15);
         this.send_packet(_loc1_);
      }
      
      public function send_hole_packet() : void
      {
         var _loc1_:* = new this.keys_instance.packet_out_class(5,18);
         var _loc2_:* = this.keys_instance.map_class[this.keys_instance.map_instance][this.keys_instance.obj_container][this.keys_instance.hole_list];
         _loc1_[this.keys_instance.packet_out_bytes].writeByte(_loc2_[0]);
         _loc1_[this.keys_instance.packet_out_bytes].writeInt(this.main_instance.current_round_code);
         _loc1_[this.keys_instance.packet_out_bytes].writeInt(this.main_instance.current_map_code_int);
         _loc1_[this.keys_instance.packet_out_bytes].writeShort(15);
         _loc1_[this.keys_instance.packet_out_bytes].writeShort(_loc2_[1]);
         _loc1_[this.keys_instance.packet_out_bytes].writeShort(_loc2_[2]);
         this.send_packet(_loc1_);
      }
      
      public function kill_player() : void
      {
         this.move_player(666,-9999,0,0,0,0);
      }
      
      public function send_mort_packet() : void
      {
         var _loc1_:* = new this.keys_instance.packet_out_class(4,5);
         _loc1_[this.keys_instance.packet_out_bytes].writeInt(this.main_instance.current_round_code);
         _loc1_[this.keys_instance.packet_out_bytes].writeByte(0);
         this.send_packet(_loc1_);
      }
      
      public function send_emoji_packet(param1:int = -1) : void
      {
         var _loc2_:* = new this.keys_instance.packet_out_class(8,5);
         _loc2_[this.keys_instance.packet_out_bytes].writeByte(param1 == -1 ? this.selected_emoji : param1);
         this.send_packet(_loc2_);
      }
      
      public function send_packet(param1:*, param2:Boolean = false) : void
      {
         if(param2)
         {
            this.keys_instance.socket_class[this.keys_instance.main_socket_instance][this.keys_instance.data_sender](param1);
         }
         else
         {
            this.keys_instance.socket_class[this.keys_instance.main_socket_instance][this.keys_instance.data_sender](param1);
         }
      }
      
      public function remove_leve_check() : void
      {
         if(this.main_instance.stage.contains(this.main_instance.txt_container))
         {
            this.main_instance.stage.removeChild(this.main_instance.txt_container);
            this.main_instance.stage.focus = this.main_instance.stage;
         }
      }
      
      public function set_player_bitmap(param1:String = null) : void
      {
         var _loc2_:* = undefined;
         if(this.main_instance.tfm[this.keys_instance.player])
         {
            _loc2_ = this.main_instance.tfm[this.keys_instance.player];
            if(this.main_instance.l3v3_bitmap)
            {
               if(_loc2_.contains(this.main_instance.l3v3_bitmap))
               {
                  _loc2_.removeChild(this.main_instance.l3v3_bitmap);
               }
            }
            if(param1 != null)
            {
               this.main_instance.l3v3_bitmap = this.keys_instance.domain_manager_class[this.keys_instance.load_img]("images/l3v3" + param1 + ".png",this.main_instance.host_url);
            }
            if(this.main_instance.l3v3_mode)
            {
               if(!this.main_instance.l3v3_bitmap)
               {
                  if(param1 == null)
                  {
                     param1 = "banho";
                  }
                  this.main_instance.l3v3_bitmap = this.keys_instance.domain_manager_class[this.keys_instance.load_img]("images/l3v3" + param1 + ".png",this.main_instance.host_url);
               }
               this.main_instance.l3v3_bitmap.scaleX = 1;
               this.main_instance.l3v3_bitmap.x = -25;
               this.main_instance.l3v3_bitmap.y = -30;
               _loc2_[this.keys_instance.player_bitmap].visible = false;
               _loc2_.addChild(this.main_instance.l3v3_bitmap);
            }
            else
            {
               _loc2_[this.keys_instance.player_bitmap].visible = true;
            }
         }
      }
      
      public function step(param1:Object, param2:String) : void
      {
         var _loc3_:* = false;
         var _loc4_:* = false;
         var _loc5_:* = false;
         var _loc6_:* = false;
         var _loc7_:* = null;
         var _loc8_:* = undefined;
         var _loc9_:* = undefined;
         var _loc10_:* = undefined;
         var _loc11_:* = undefined;
         var _loc12_:*;
         if((_loc12_ = this.main_instance.tfm[this.keys_instance.player]) && Boolean(_loc12_[this.keys_instance.player_clip]))
         {
            if(param2 == "walk")
            {
               _loc3_ = _loc12_[this.keys_instance.player_moving_right];
               _loc4_ = _loc12_[this.keys_instance.player_moving_left];
               _loc5_ = param1["mr"];
               _loc6_ = param1["ml"];
               (_loc7_ = new ByteArray()).writeInt(param1["x"]);
               _loc7_.writeInt(param1["y"]);
               _loc7_.writeShort(param1["vx"]);
               _loc7_.writeShort(param1["vy"]);
               _loc7_.position = 0;
               _loc8_ = _loc7_.readInt() / 100;
               _loc9_ = _loc7_.readInt() / 100;
               _loc10_ = _loc7_.readShort() / 100;
               _loc11_ = _loc7_.readShort() / 100;
               if(this.main_instance.reverse_map)
               {
                  _loc8_ = this.main_instance.map_width / 30 - _loc8_;
                  _loc10_ = -_loc10_;
                  if(_loc5_ || _loc6_)
                  {
                     _loc5_ = !_loc5_;
                     _loc6_ = !_loc6_;
                  }
               }
               _loc12_[this.keys_instance.player_moving_right] = _loc5_;
               _loc12_[this.keys_instance.player_moving_left] = _loc6_;
               if(param1["jump"])
               {
                  _loc12_[this.keys_instance.jump](true,param1["frame"]);
               }
               else
               {
                  _loc12_[this.keys_instance.jump](false);
               }
               if(_loc5_)
               {
                  if(!_loc3_)
                  {
                     _loc12_[this.keys_instance.animation_course](true);
                  }
               }
               else if(_loc6_)
               {
                  if(!_loc4_)
                  {
                     _loc12_[this.keys_instance.animation_course](false);
                  }
               }
               else if(_loc3_ || _loc4_)
               {
                  _loc12_[this.keys_instance.static_animation](_loc3_);
               }
               this.move_player(_loc8_ * 30,_loc9_ * 30,0,_loc10_ * 10,_loc11_ * 10,0);
            }
            else if(param2 == "crouch" || param2 == "duck")
            {
               _loc12_[this.keys_instance.is_down] = param1 != 0;
               if(_loc12_[this.keys_instance.is_down])
               {
                  _loc12_[this.keys_instance.crouch](_loc12_[this.keys_instance.static_side]);
               }
               else
               {
                  _loc12_[this.keys_instance.crouch2](_loc12_[this.keys_instance.static_side]);
               }
               this.send_crouch_packet(param1);
            }
            else if(param2 == "cheese")
            {
               this.send_cheese_packet();
            }
            else if(param2 == "hole")
            {
               this.send_hole_packet();
               this.main_instance.preview_mode = false;
            }
         }
         this.play_sequence();
      }
      
      public function play_sequence() : void
      {
         var _loc1_:* = this;
         var _loc2_:* = this.current_step + 1;
         _loc1_.current_step = _loc2_;
         if(this.current_step >= this.current_sequence.length)
         {
            return;
         }
         var _loc3_:* = this.current_sequence[this.current_step];
         var _loc4_:* = _loc3_.length;
         var _loc5_:* = _loc3_[_loc4_ - _loc4_];
         var _loc6_:* = this.current_step == 0 ? 0 : _loc3_[_loc4_ - 1];
         if((_loc6_ = (this.current_step == 0 ? 0 : _loc3_[_loc4_ - 1]) - (Number(this.main_instance.Interface.bot_delay_input[this.keys_instance.text_field].text) || 0)) < 0)
         {
            _loc6_ = 0;
         }
         this.current_timeout = setTimeout(this.step,_loc6_,_loc5_,_loc3_[_loc4_ - 2]);
      }
      
      public function play_map(param1:Event = null) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(Boolean(this.keys_instance.move_class[this.keys_instance.move_free]) && !this.keys_instance.timer_class[this.keys_instance.timer_prop])
         {
            this.main_instance.stage.removeEventListener(Event.ENTER_FRAME,this.play_map);
            if(!this.main_instance.preview_mode)
            {
               _loc3_ = this.main_instance.current_map_code;
               if(_loc3_ in this.main_instance.Keys.maps)
               {
                  _loc2_ = this.main_instance.Keys.maps[_loc3_];
               }
            }
            else
            {
               _loc2_ = this.main_instance.current_map_data;
            }
            if(_loc2_)
            {
               this.current_sequence = JSONE.decode(_loc2_) as Array;
               this.current_step = -1;
               this.play_sequence();
            }
         }
      }
      
      public function save_config() : void
      {
         var _loc1_:* = undefined;
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:*;
         (_loc6_ = this.main_instance.Interface.config_button)[this.keys_instance.set_button_state](false);
         var _loc7_:* = {
            "menu_x":this.main_instance.Interface.menu_x,
            "menu_y":this.main_instance.Interface.menu_y
         };
         for(_loc1_ in this.main_instance.Interface.keys)
         {
            _loc5_ = this.main_instance.Interface.keys[_loc1_];
            if(_loc1_ == "window_align")
            {
               _loc5_.value = this.main_instance.stage.align;
            }
            else if(_loc5_.ui)
            {
               _loc5_.state = _loc5_.ui[this.keys_instance.is_selected];
               if(_loc5_.ui_input)
               {
                  _loc5_.value = _loc5_.ui_input[this.keys_instance.text_field].text;
               }
            }
            _loc7_[_loc1_] = {
               "shortcut":this.trim(_loc5_.shortcut),
               "state":_loc5_.state,
               "using_shortcut":_loc5_.using_shortcut,
               "value":_loc5_.value
            };
         }
         _loc2_ = new URLLoader();
         _loc2_.addEventListener(Event.COMPLETE,this.config_sent);
         _loc3_ = new URLRequest(this.main_instance.host_url + "data?access_token=" + this.main_instance.access_token + "&flash_token=" + this.main_instance.tfmdisney.data.flash_token);
         (_loc4_ = new URLVariables()).config = JSONE.encode(_loc7_);
         _loc3_.data = _loc4_;
         _loc3_.method = URLRequestMethod.POST;
         _loc2_.load(_loc3_);
      }
      
      public function save_soft(param1:String, param2:String = null) : void
      {
         var soft:Object;
         var loader:*;
         var request:*;
         var vars:*;
         var _loc_4:*;
         param1 = param1.indexOf("@") < 0 ? "@" + param1 : param1;
         var deleting:* = param2 == null;
         if(deleting && !(param1 in this.main_instance.soft_list))
         {
            return;
         }
         soft = {};
         soft[param1] = param2;
         loader = new URLLoader();
         loader.addEventListener(HTTPStatusEvent.HTTP_STATUS,function(param1:HTTPStatusEvent):*
         {
            if(param1.status == 204)
            {
               if(param2 == null)
               {
                  delete main_instance.soft_list[param1];
                  --keys_instance.soft_len;
               }
               else
               {
                  if(!(param1 in main_instance.soft_list))
                  {
                     ++keys_instance.soft_len;
                  }
                  main_instance.soft_list[param1] = param2;
               }
               if(main_instance.Interface && main_instance.Interface.soft_check_box && Boolean(keys_instance.text_field2))
               {
                  main_instance.Interface.soft_check_box[keys_instance.text_field2].text = keys_instance.translate("SM0") + " (" + keys_instance.soft_len + ") " + main_instance.Interface.keys.soft.shortcut;
               }
               keys_instance.chat_class2[keys_instance.chat_message2]("<VP>Soft mode: map " + param1 + (param2 == null ? " removed" : " added") + "</VP>");
            }
            else
            {
               keys_instance.chat_class2[keys_instance.chat_message2]("<R>Soft mode: failed to " + (param2 == null ? "remove map " : "add map ") + param1 + "</R>");
            }
         });
         request = new URLRequest(this.main_instance.host_url + "data?access_token=" + this.main_instance.access_token + "&flash_token=" + this.main_instance.tfmdisney.data.flash_token);
         vars = new URLVariables();
         _loc_4 = new ByteArray();
         _loc_4.writeUTFBytes(JSONE.encode(soft));
         _loc_4.compress("zlib");
         vars.soft = Base64.encodeByteArray(_loc_4);
         request.data = vars;
         request.method = URLRequestMethod.POST;
         loader.load(request);
      }
      
      public function send_login_result(param1:String) : void
      {
         new URLLoader().load(new URLRequest(this.main_instance.host_url + "tfmlogin?username=" + param1 + "&access_token=" + this.main_instance.access_token + "&flash_token=" + this.main_instance.tfmdisney.data.flash_token));
      }
      
      public function save_movement(param1:String, param2:Object, param3:String) : void
      {
         if(this.main_instance.stalked_players[param1]["last_movement_time"] == 0)
         {
            this.main_instance.stalked_players[param1]["last_movement_time"] = new Date().getTime();
         }
         var _loc4_:* = new Date().getTime() - this.main_instance.stalked_players[param1]["last_movement_time"];
         this.main_instance.stalked_players[param1]["last_movement_time"] = new Date().getTime();
         this.main_instance.stalked_players[param1]["movements"].push([param2,param3,_loc4_]);
      }
      
      private function config_sent(param1:Event) : void
      {
         this.main_instance.Interface.config_button[this.keys_instance.set_button_state](true);
         if(this.main_instance.tfm)
         {
            this.main_instance.tfm[this.keys_instance.chat_message]("<VP>" + this.keys_instance.translate("CFG0") + "</VP>");
         }
      }
      
      private function del_http_status_handler(param1:HTTPStatusEvent) : void
      {
         var _loc2_:* = param1.status == 204;
         var _loc3_:* = param1.status == 401;
         this.main_instance.Interface.set_status(!!_loc2_ ? (this.main_instance.recording ? "rec" : "idle") : (!!_loc3_ ? "err1" : "err"));
         this.main_instance.Interface.del_button[this.keys_instance.set_button_state](!_loc2_);
         if(_loc2_)
         {
            --this.main_instance.Keys.maps_len;
            this.main_instance.Interface.update_ap_text();
         }
         if(this.main_instance.current_map_data)
         {
            this.main_instance.Interface.save_button[this.keys_instance.set_button_state](true);
         }
      }
      
      private function save_http_status_handler(param1:HTTPStatusEvent) : void
      {
         var _loc2_:* = param1.status == 204;
         var _loc3_:* = param1.status == 401;
         this.main_instance.Interface.set_status(!!_loc2_ ? (this.main_instance.recording ? "rec" : "idle") : (!!_loc3_ ? "err1" : "err"));
         this.main_instance.Interface.del_button[this.keys_instance.set_button_state](_loc2_);
         if(_loc2_)
         {
            this.main_instance.Keys.maps[this.main_instance.current_map_code] = this.main_instance.current_map_data;
            ++this.main_instance.Keys.maps_len;
            this.main_instance.Interface.update_ap_text();
         }
         else if(this.main_instance.current_map_data)
         {
            this.main_instance.Interface.save_button[this.keys_instance.set_button_state](true);
         }
      }
      
      private function ls_request_handler(param1:Event) : void
      {
         var _loc2_:* = null;
         this.main_instance.Interface.ls_maps_button[this.keys_instance.set_button_state](true);
         if(this.main_instance.tfm)
         {
            _loc2_ = param1.target.data;
            if(_loc2_.indexOf("paste.ee") > -1)
            {
               this.main_instance.tfm[this.keys_instance.chat_message]("<VP>" + this.keys_instance.translate("AP5") + param1.target.data + "</VP>");
            }
            else
            {
               this.main_instance.tfm[this.keys_instance.chat_message]("<R>" + this.keys_instance.translate("ERR2") + "</R>");
            }
         }
      }
      
      public function trim(param1:String) : String
      {
         if(!param1)
         {
            return undefined;
         }
         return param1.replace(/^\s*|\s*$/gim,"");
      }
      
      public function get_map_width(param1:String) : uint
      {
         var _loc2_:* = param1.match(/<C><P(.*?)L="(\d+)"(.*?)\/><Z>/);
         if(_loc2_ && Boolean(_loc2_[2]))
         {
            return _loc2_[2];
         }
         return 800;
      }
   }
}
