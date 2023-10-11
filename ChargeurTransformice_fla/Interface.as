package ChargeurTransformice_fla
{
   import flash.display.*;
   import flash.events.*;
   import flash.geom.*;
   import flash.system.*;
   import flash.ui.*;
   import flash.utils.*;

   public class Interface extends MovieClip
   {
      
      public static var config:Object;
       
      
      public var bot_ui:Object;
      
      public var ai_ui:Object;
      
      public var commands_ui:Object;
      
      public var lsmaps_ui:Object;
      
      public var farm_ui:Object;
      
      public var general_ui:Object;
      
      public var keys_ui:Object;
      
      public var menu_ui:Object;
      
      public var settings_ui:Object;
      
      public var side_ui:Object;
      
      public var options_ui:Object;
      
      public var bot_button:Object;
      
      public var bot_stop_button:Object;
      
      public var farm_button:Object;
      
      public var farm_sprite:Object;
      
      public var mouse_button:Object;
      
      public var mouse_sprite:Object;
      
      public var keys_button:Object;
      
      public var ai_button:Object;
      
      public var settings_button:Object;
      
      public var config_button:Object;
      
      public var ls_cmd_button:Object;
      
      public var ls_maps_button:Object;
      
      public var auto_play_check_box:Object;
      
      public var stop_play_check_box:Object;
      
      public var death_check_box:Object;
      
      public var delay_check_box:Object;
      
      public var anti_leve_check_box:Object;
      
      public var jump_speed_check_box:Object;
      
      public var soft_check_box:Object;
      
      public var animations_check_box:Object;
      
      public var jump_check_box:Object;
      
      public var jump2_check_box:Object;
      
      public var hide_players_check_box:Object;
      
      public var macro_check_box:Object;
      
      public var mass_check_box:Object;
      
      public var movement_check_box:Object;
      
      public var objects_check_box:Object;
      
      public var ping_check_box:Object;
      
      public var scoreboard_check_box:Object;
      
      public var shortcuts_check_box:Object;
      
      public var timer_check_box:Object;
      
      public var insta_death_check_box:Object;
      
      public var insta_death2_check_box:Object;
      
      public var insta_win_check_box:Object;
      
      public var bot_delay_input:Object;
      
      public var insta_death2_input:Object;
      
      public var insta_win_input:Object;
      
      public var jump_input:Object;
      
      public var jump2_input:Object;
      
      public var jump_speed_input:Object;
      
      public var macro_input:Object;
      
      public var mass_input:Object;
      
      public var movement_input:Object;
      
      public var timer_input:Object;
      
      public var window_align:Object;
      
      public var menu_x:int = 100;
      
      public var menu_y:int = 105;
      
      public var status_field:Object;
      
      public var rec_button:Object;
      
      public var save_button:Object;
      
      public var del_button:Object;
      
      public var preview_button:Object;
      
      public var last_tab:String = "general";
      
      public var idle_status:String;
      
      public var rec_status:String;
      
      public var err_status:String;
      
      public var err1_status:String;
      
      public var unv_status:String;
      
      public var wait_status:String;
      
      public var keys:Object;
      
      public var main_instance:ChargeurTransformice_fla.TransformiceChargeur;
      
      public var keys_instance:ChargeurTransformice_fla.Keys;
      
      public function Interface()
      {
         var ap_text:String;
         var is_plat:*;
         var is_gold:*;
         var is_gold_II:*;
         var is_silver:*;
         var is_bronze:*;
         var elements:Array;
         var emoji_list:*;
         var list_obj:*;
         var timer_obj:*;
         var blinkTimer:Timer;
         var i:uint = 0;
         var y:uint = 0;
         var obj:Object = null;
         var elem:* = undefined;
         var l3v3_mode_list:* = undefined;
         var macro_obj:* = undefined;
         var version_ui:* = undefined;
         var ui:* = undefined;
         var sm_text:String = null;
         var mass_obj:* = undefined;
         var movement_obj:* = undefined;
         var jump_obj:* = undefined;
         var insta_win_obj:Object = null;
         var insta_d2_obj:Object = null;
         var discord_ui:* = undefined;
         var discord_sprite:* = undefined;
         var discord_sprite2:* = undefined;
         var discord_sprite3:* = undefined;
         var discord_sprite4:* = undefined;
         var discord_txt:* = undefined;
         var discord_txt2:* = undefined;
         var discord_txt3:* = undefined;
         var discord_txt4:* = undefined;
         var txt:* = undefined;
         var reset_keys:* = undefined;
         var _loc_2:* = undefined;
         var name:String = null;
         var is_sprite:Boolean = false;
         var last_elem:String = null;
         var btn:* = undefined;
         super();
         ap_text = "Autoplay";
         this.keys = {};
         this.main_instance = ChargeurTransformice_fla.TransformiceChargeur.instance;
         this.keys_instance = this.main_instance.Keys;
         is_plat = this.main_instance.premium_level == "PLATINUM";
         is_gold = this.main_instance.premium_level == "GOLD";
         is_gold_II = this.main_instance.premium_level == "GOLD_II";
         is_silver = this.main_instance.premium_level == "SILVER";
         is_bronze = this.main_instance.premium_level == "BRONZE";
         this.idle_status = "<font color=\'#FFA500\'>Status: " + this.keys_instance.translate("IDLE0") + "</font>";
         this.rec_status = "<font color=\'#2ECF73\'>Status: " + this.keys_instance.translate("REC0") + "</font>";
         this.err_status = "<font color=\'#0000FF\'>Status: " + this.keys_instance.translate("ERR0") + "</font>";
         this.err1_status = "<font color=\'#0000FF\'>Status: " + this.keys_instance.translate("ERR1") + "</font>";
         this.wait_status = "<font color=\'#C2C2DA\'>Status: " + this.keys_instance.translate("WT0") + " </font>";
         this.unv_status = "<font color=\'#C2C2DA\'>Status: " + this.keys_instance.translate("ERR5") + " </font>";
         this.menu_ui = new this.keys_instance.ui_element_class(600,320);
         this.menu_ui[this.keys_instance.set_prep_ui](this.keys_instance.prep_ui_class[this.keys_instance.prep_ui1_instance],30);
         this.menu_ui.x = this.menu_x;
         this.menu_ui.y = this.menu_y;
         this.menu_ui[this.keys_instance.set_box]("SafeMarket",this.close_menu,11);
         this.side_ui = new this.keys_instance.ui_element_class(60,320);
         this.side_ui[this.keys_instance.set_prep_ui](this.keys_instance.prep_ui_class[this.keys_instance.prep_ui4_instance],15);
         this.side_ui[this.keys_instance.set_scrollable](true);
         this.options_ui = new this.keys_instance.ui_element_class(525,300);
         this.menu_ui[this.keys_instance.add_ui_element](this.side_ui,this.options_ui);
         this.options_ui.x -= 20;
         this.menu_ui[this.keys_instance.set_shape](62,0,false,320);
         this.menu_ui[this.keys_instance.set_draggable]();
         if(is_gold_II || is_plat)
         {
            this.farm_button = new this.keys_instance.ui_sprite2_class(this.main_instance.host_url + "images/cheese.png",30,30);
            this.farm_button[this.keys_instance.on_mouse_click](function():*
            {
               change_menu_tab("farm");
            });
            this.keys_instance.ui_manager_class[this.keys_instance.on_mouse_box](this.farm_button,"Farm");
         }
         this.mouse_button = new this.keys_instance.ui_sprite2_class(this.main_instance.host_url + "images/house.png",30,30);
         this.mouse_button[this.keys_instance.on_mouse_click](function():*
         {
            change_menu_tab("general");
         });
         this.keys_instance.ui_manager_class[this.keys_instance.on_mouse_box](this.mouse_button,this.keys_instance.translate("GE0"));
         this.ai_button = new this.keys_instance.ui_sprite2_class(this.main_instance.host_url + "images/ai.png",30,30);
         this.ai_button[this.keys_instance.on_mouse_click](function():*
         {
            change_menu_tab("AI");
         });
         this.keys_instance.ui_manager_class[this.keys_instance.on_mouse_box](this.ai_button,"AI");
         if(!is_bronze)
         {
            this.bot_button = new this.keys_instance.ui_sprite2_class(this.main_instance.host_url + "images/bot.png",30,30);
            this.bot_button[this.keys_instance.on_mouse_click](function():*
            {
               change_menu_tab("bot");
            });
            this.keys_instance.ui_manager_class[this.keys_instance.on_mouse_box](this.bot_button,"Bot");
         }
         this.keys_button = new this.keys_instance.ui_sprite2_class(this.main_instance.host_url + "images/keyboard.png",30,30);
         this.keys_button[this.keys_instance.on_mouse_click](function():*
         {
            change_menu_tab("keyboard");
         });
         this.keys_instance.ui_manager_class[this.keys_instance.on_mouse_box](this.keys_button,this.keys_instance.translate("SC1"));
         this.settings_button = new this.keys_instance.ui_sprite2_class(this.main_instance.host_url + "images/settings.png",30,30);
         this.settings_button[this.keys_instance.on_mouse_click](function():*
         {
            change_menu_tab("settings");
         });
         this.keys_instance.ui_manager_class[this.keys_instance.on_mouse_box](this.settings_button,this.keys_instance.translate("SE0"));
         y = 30;
         elements = ["mouse_button","farm_button","ai_button","bot_button","keys_button","settings_button"];
         for(i in elements)
         {
            name = String(elements[i]);
            elem = this[name];
            if(elem)
            {
               this.side_ui[this.keys_instance.add_ui_element](elem);
               is_sprite = name.indexOf("_sprite") != -1;
               elem.x = is_sprite ? 30 : 3;
               if(elements[i - 1])
               {
                  last_elem = String(elements[i - 1]);
                  if(last_elem.indexOf("_sprite") != -1)
                  {
                     y += is_sprite ? 15 : -15;
                  }
                  else if(last_elem.indexOf("_button") != -1)
                  {
                     y += 18;
                  }
               }
               elem.y = y;
               y += 30;
            }
         }
         discord_ui = new this.keys_instance.ui_element_class(this.options_ui.width,24);
         discord_ui[this.keys_instance.set_prep_ui](this.keys_instance.prep_ui_class[this.keys_instance.prep_ui1_instance],2);
         discord_sprite = new this.keys_instance.ui_sprite2_class(this.main_instance.host_url + "images/discord.png",20,20);
         discord_sprite2 = new this.keys_instance.ui_sprite2_class(this.main_instance.host_url + "images/discord.png",20,20);
         discord_sprite3 = new this.keys_instance.ui_sprite2_class(this.main_instance.host_url + "images/discord.png",20,20);
         discord_sprite4 = new this.keys_instance.ui_sprite2_class(this.main_instance.host_url + "images/discord.png",20,20);
         discord_txt = new this.keys_instance.ui_text_field_class();
         discord_txt.htmlText = "Jodis";
         discord_txt.mouseEnabled = true;
         discord_txt.selectable = true;
         discord_txt2 = new this.keys_instance.ui_text_field_class();
         discord_txt2.htmlText = "BlancSnz";
         discord_txt2.mouseEnabled = true;
         discord_txt2.selectable = true;
         discord_txt3 = new this.keys_instance.ui_text_field_class();
         discord_txt3.htmlText = "Bialysnz";
         discord_txt3.mouseEnabled = true;
         discord_txt3.selectable = true;
         discord_txt4 = new this.keys_instance.ui_text_field_class();
         discord_txt4.htmlText = "Norshin";
         discord_txt4.mouseEnabled = true;
         discord_txt4.selectable = true;
         discord_ui[this.keys_instance.add_ui_element](discord_sprite,discord_txt,discord_sprite2,discord_txt2,discord_sprite3,discord_txt3,discord_sprite4,discord_txt4);
         this.config_button = new this.keys_instance.ui_button_class(this.keys_instance.translate("SC0"),50,function():*
         {
            main_instance.Statements.save_config();
         });
         this.menu_ui[this.keys_instance.add_ui_element](discord_ui,this.config_button);
         discord_ui.x = 70;
         discord_ui.y = 300;
         this.config_button.x = 550;
         this.config_button.y = 298;
         this.farm_ui = new this.keys_instance.ui_element_class(525,300);
         this.farm_ui[this.keys_instance.set_prep_ui](this.keys_instance.prep_ui_class[this.keys_instance.prep_ui4_instance]);
         this.farm_ui[this.keys_instance.set_scrollable](true);
         this.general_ui = new this.keys_instance.ui_element_class(525,300);
         this.general_ui[this.keys_instance.set_prep_ui](this.keys_instance.prep_ui_class[this.keys_instance.prep_ui4_instance]);
         this.general_ui[this.keys_instance.set_scrollable](true);
         this.ai_ui = new this.keys_instance.ui_element_class(525,300);
         this.ai_ui[this.keys_instance.set_prep_ui](this.keys_instance.prep_ui_class[this.keys_instance.prep_ui4_instance]);
         this.ai_ui[this.keys_instance.set_scrollable](true);
         this.bot_ui = new this.keys_instance.ui_element_class(525,300);
         this.bot_ui[this.keys_instance.set_prep_ui](this.keys_instance.prep_ui_class[this.keys_instance.prep_ui4_instance]);
         this.bot_ui[this.keys_instance.set_scrollable](true);
         this.settings_ui = new this.keys_instance.ui_element_class(525,300);
         this.settings_ui[this.keys_instance.set_prep_ui](this.keys_instance.prep_ui_class[this.keys_instance.prep_ui4_instance]);
         this.settings_ui[this.keys_instance.set_scrollable](true);
         this.keys_ui = new this.keys_instance.ui_element_class(525,300);
         this.keys_ui[this.keys_instance.set_prep_ui](this.keys_instance.prep_ui_class[this.keys_instance.prep_ui4_instance]);
         this.keys_ui[this.keys_instance.set_scrollable](true);
         this.shortcuts_check_box = this.create_check_button(this.keys_instance.translate("SC2"),this.keys_ui,function(param1:Boolean):*
         {
            var _loc2_:* = undefined;
            var _loc3_:* = undefined;
            for each(_loc2_ in keys)
            {
               if(_loc2_.button)
               {
                  do
                  {
                     _loc3_ = _loc2_.button;
                     _loc3_[keys_instance.check_button_exec](new MouseEvent("mouseDown"));
                  }
                  while(_loc3_[keys_instance.is_selected] != param1);
                  
               }
            }
         }).check_button;
         this.save_key_config({
            "name":"shortcuts",
            "state":true,
            "ui":this.shortcuts_check_box
         });
         txt = new this.keys_instance.ui_text_field_class(this.keys_instance.translate("SC3"),460,0,null,true);
         txt.mouseEnabled = true;
         txt.selectable = true;
         reset_keys = new this.keys_instance.ui_button_class(this.keys_instance.translate("RK0"),100,function():*
         {
            reset_shortcut(null,true);
         });
         this.keys_ui[this.keys_instance.add_ui_element](txt,reset_keys);
         this.save_key_config({
            "name":"open_menu",
            "description":this.keys_instance.translate("OM0"),
            "shortcut":this.keys_instance.open_menu_sc
         });
         if(is_gold_II || is_plat)
         {
            l3v3_mode_list = this.create_items_list("L3v3 mode",this.settings_ui,true,function(param1:Boolean):*
            {
               main_instance.l3v3_mode = param1;
               main_instance.Statements.set_player_bitmap();
            },100).list;
            _loc_2 = l3v3_mode_list;
            _loc_2[this.keys_instance.add_to_list]("abelha",function():*
            {
               main_instance.Statements.set_player_bitmap("abelha");
            },null);
            _loc_2 = l3v3_mode_list;
            _loc_2[this.keys_instance.add_to_list]("ajeita",function():*
            {
               main_instance.Statements.set_player_bitmap("ajeita");
            },null);
            _loc_2 = l3v3_mode_list;
            _loc_2[this.keys_instance.add_to_list]("banho",function():*
            {
               main_instance.Statements.set_player_bitmap("banho");
            },null,true);
            _loc_2 = l3v3_mode_list;
            _loc_2[this.keys_instance.add_to_list]("grau",function():*
            {
               main_instance.Statements.set_player_bitmap("grau");
            },null);
            _loc_2 = l3v3_mode_list;
            _loc_2[this.keys_instance.add_to_list]("apenasl3v3",function():*
            {
               main_instance.Statements.set_player_bitmap("apenasl3v3");
            },null);
            _loc_2 = l3v3_mode_list;
            _loc_2[this.keys_instance.add_to_list]("classico",function():*
            {
               main_instance.Statements.set_player_bitmap("classico");
            },null);
            _loc_2 = l3v3_mode_list;
            _loc_2[this.keys_instance.add_to_list]("ftnyrel",function():*
            {
               main_instance.Statements.set_player_bitmap("ftnyrel");
            },null);
            _loc_2 = l3v3_mode_list;
            _loc_2[this.keys_instance.add_to_list]("femea",function():*
            {
               main_instance.Statements.set_player_bitmap("femea");
            },null);
            _loc_2 = l3v3_mode_list;
            _loc_2[this.keys_instance.add_to_list]("roubo",function():*
            {
               main_instance.Statements.set_player_bitmap("roubo");
            },null);
            _loc_2 = l3v3_mode_list;
            _loc_2[this.keys_instance.add_to_list]("roubofemea",function():*
            {
               main_instance.Statements.set_player_bitmap("roubofemea");
            },null);
            _loc_2 = l3v3_mode_list;
            _loc_2[this.keys_instance.add_to_list]("queda",function():*
            {
               main_instance.Statements.set_player_bitmap("queda");
            },null);
            _loc_2 = l3v3_mode_list;
            _loc_2[this.keys_instance.add_to_list]("praia",function():*
            {
               main_instance.Statements.set_player_bitmap("praia");
            },null);
            _loc_2 = l3v3_mode_list;
            _loc_2[this.keys_instance.add_to_list]("tornado",function():*
            {
               main_instance.Statements.set_player_bitmap("tornado");
            },null);
            _loc_2 = l3v3_mode_list;
            _loc_2[this.keys_instance.add_to_list]("tortuguita",function():*
            {
               main_instance.Statements.set_player_bitmap("tortuguita");
            },null);
            _loc_2.x += 5;
         }
         emoji_list = this.create_items_list("Auto emoji ",this.settings_ui,true,function(param1:Boolean):*
         {
            if(param1)
            {
               main_instance.Statements.send_emoji_packet(main_instance.Statements.selected_emoji);
               main_instance.Statements.emoji_interval = setInterval(main_instance.Statements.send_emoji_packet,3000);
            }
            else
            {
               clearInterval(main_instance.Statements.emoji_interval);
            }
         },50).list;
         _loc_2 = emoji_list;
         _loc_2[this.keys_instance.add_to_list]("0",function():*
         {
            main_instance.Statements.selected_emoji = 9;
         },null,true);
         _loc_2 = emoji_list;
         _loc_2[this.keys_instance.add_to_list]("1",function():*
         {
            main_instance.Statements.selected_emoji = 0;
         },null);
         _loc_2 = emoji_list;
         _loc_2[this.keys_instance.add_to_list]("2",function():*
         {
            main_instance.Statements.selected_emoji = 1;
         },null);
         _loc_2 = emoji_list;
         _loc_2[this.keys_instance.add_to_list]("3",function():*
         {
            main_instance.Statements.selected_emoji = 2;
         },null);
         _loc_2 = emoji_list;
         _loc_2[this.keys_instance.add_to_list]("4",function():*
         {
            main_instance.Statements.selected_emoji = 3;
         },null);
         _loc_2 = emoji_list;
         _loc_2[this.keys_instance.add_to_list]("5",function():*
         {
            main_instance.Statements.selected_emoji = 4;
         },null);
         _loc_2 = emoji_list;
         _loc_2[this.keys_instance.add_to_list]("6",function():*
         {
            main_instance.Statements.selected_emoji = 5;
         },null);
         _loc_2 = emoji_list;
         _loc_2[this.keys_instance.add_to_list]("7",function():*
         {
            main_instance.Statements.selected_emoji = 6;
         },null);
         _loc_2 = emoji_list;
         _loc_2[this.keys_instance.add_to_list]("8",function():*
         {
            main_instance.Statements.selected_emoji = 7;
         },null);
         _loc_2 = emoji_list;
         _loc_2[this.keys_instance.add_to_list]("9",function():*
         {
            main_instance.Statements.selected_emoji = 8;
         },null);
         if(!is_bronze)
         {
            macro_obj = this.create_check_button("Macro",this.settings_ui,function(param1:Boolean):*
            {
               main_instance.macro = param1;
               if(param1)
               {
                  if(macro_input)
                  {
                     if(macro_input[keys_instance.text_field].text == "" || Boolean(isNaN(Number(macro_input[keys_instance.text_field].text))))
                     {
                        macro_input[keys_instance.text_field].text = "100";
                     }
                  }
               }
            },true,5);
            this.macro_check_box = macro_obj.check_button;
            this.macro_input = macro_obj.input;
            this.save_key_config({
               "name":"macro",
               "ui":this.macro_check_box,
               "ui_input":this.macro_input,
               "state":false,
               "value":"100",
               "shortcut":"CTRL F8"
            });
         }
         this.ls_cmd_button = new this.keys_instance.ui_button_class(this.keys_instance.translate("LS1"),180,this.ls_commands);
         this.settings_ui[this.keys_instance.add_ui_element](this.ls_cmd_button);
         if(this.main_instance.outdated)
         {
            version_ui = new this.keys_instance.ui_element_class(this.general_ui.width,24);
            version_ui[this.keys_instance.set_prep_ui](this.keys_instance.prep_ui_class[this.keys_instance.prep_ui1_instance]);
            version_ui[this.keys_instance.add_ui_element](new this.keys_instance.ui_text_field_class("<J>PUBLIC VERSION - SAFEMARKET.XYZ</J>",360,0,null,true));
            this.general_ui[this.keys_instance.add_ui_element](version_ui);
         }
         list_obj = this.create_items_list(this.keys_instance.translate("WA0"),this.general_ui);
         this.window_align = list_obj.list;
         _loc_2 = this.window_align;
         _loc_2[this.keys_instance.add_to_list](this.keys_instance.translate("AL0"),function():*
         {
            main_instance.stage.align = "";
         },null,true);
         _loc_2 = this.window_align;
         _loc_2[this.keys_instance.add_to_list](this.keys_instance.translate("AL1"),function():*
         {
            main_instance.stage.align = "B";
         },null);
         _loc_2 = this.window_align;
         _loc_2[this.keys_instance.add_to_list](this.keys_instance.translate("AL2"),function():*
         {
            main_instance.stage.align = "BL";
         },null);
         _loc_2 = this.window_align;
         _loc_2[this.keys_instance.add_to_list](this.keys_instance.translate("AL3"),function():*
         {
            main_instance.stage.align = "BR";
         },null);
         _loc_2 = this.window_align;
         _loc_2[this.keys_instance.add_to_list](this.keys_instance.translate("AL4"),function():*
         {
            main_instance.stage.align = "L";
         },null);
         _loc_2 = this.window_align;
         _loc_2[this.keys_instance.add_to_list](this.keys_instance.translate("AL5"),function():*
         {
            main_instance.stage.align = "R";
         },null);
         _loc_2 = this.window_align;
         _loc_2[this.keys_instance.add_to_list](this.keys_instance.translate("AL6"),function():*
         {
            main_instance.stage.align = "T";
         },null);
         _loc_2 = this.window_align;
         _loc_2[this.keys_instance.add_to_list](this.keys_instance.translate("AL7"),function():*
         {
            main_instance.stage.align = "TL";
         },null);
         _loc_2 = this.window_align;
         _loc_2[this.keys_instance.add_to_list](this.keys_instance.translate("AL8"),function():*
         {
            main_instance.stage.align = "TR";
         },null);
         this.save_key_config({
            "name":"window_align",
            "ui":list_obj.txt,
            "shortcut":"F1"
         });
         if(this.bot_button)
         {
            if(this.keys_instance.maps_len > 0)
            {
               ap_text = "Autoplay (" + this.keys_instance.maps_len + ")";
            }
            this.auto_play_check_box = this.create_check_button(ap_text,this.bot_ui,function(param1:Boolean):*
            {
               main_instance.auto_play = param1;
               if(!param1)
               {
                  main_instance.Statements.disable_auto_play();
                  if(Boolean(main_instance.tfm) && Boolean(main_instance.tfm[keys_instance.player]))
                  {
                     if(main_instance.tfm[keys_instance.player][keys_instance.player_clip])
                     {
                        main_instance.tfm[keys_instance.player][keys_instance.player_moving_right] = false;
                        main_instance.tfm[keys_instance.player][keys_instance.player_moving_left] = false;
                     }
                  }
               }
            }).check_button;
            this.save_key_config({
               "name":"auto_play",
               "ui":this.auto_play_check_box,
               "state":false,
               "shortcut":"F2"
            });
            this.bot_delay_input = this.create_input(this.keys_instance.translate("AP4"),this.bot_ui,"10");
            this.stop_play_check_box = this.create_check_button(this.keys_instance.translate("DA1"),this.bot_ui,function(param1:Boolean):*
            {
               main_instance.auto_play_disable_on_move = param1;
            }).check_button;
            this.save_key_config({
               "name":"stop_play",
               "ui":this.stop_play_check_box,
               "state":true
            });
            this.status_field = new this.keys_instance.ui_text_field_class();
            this.set_status();
            this.bot_ui[this.keys_instance.add_ui_element](this.status_field);
            ui = new this.keys_instance.ui_element_class(_loc_2.width,24);
            ui[this.keys_instance.set_prep_ui](this.keys_instance.prep_ui_class[this.keys_instance.prep_ui1_instance]);
            this.rec_button = new this.keys_instance.ui_button_class("REC",40,this.main_instance.Statements.handle_rec_btn);
            this.save_button = new this.keys_instance.ui_button_class("SAVE",45,this.main_instance.Statements.handle_save_btn);
            this.del_button = new this.keys_instance.ui_button_class("DELETE",57,this.main_instance.Statements.handle_del_btn);
            this.preview_button = new this.keys_instance.ui_button_class("PREVIEW",65,this.main_instance.Statements.handle_preview_btn);
            this.disable_ap_buttons();
            ui[this.keys_instance.add_ui_element](this.rec_button,this.save_button,this.del_button,this.preview_button);
            this.ls_maps_button = new this.keys_instance.ui_button_class(this.keys_instance.translate("LS0"),120,this.ls_maps);
            this.bot_ui[this.keys_instance.add_ui_element](ui,this.ls_maps_button);
         }
         timer_obj = this.create_check_button(this.keys_instance.translate("SD0"),this.general_ui,function(param1:Boolean):*
         {
            main_instance.born_period = param1;
            if(param1)
            {
               if(timer_input)
               {
                  if(timer_input[keys_instance.text_field].text == "" || Boolean(isNaN(Number(timer_input[keys_instance.text_field].text))))
                  {
                     timer_input[keys_instance.text_field].text = "3.0";
                  }
               }
            }
         },true);
         this.timer_check_box = timer_obj.check_button;
         this.timer_input = timer_obj.input;
         this.save_key_config({
            "name":"timer",
            "ui":this.timer_check_box,
            "ui_input":this.timer_input,
            "state":false,
            "value":"3.0",
            "shortcut":"F3"
         });
         if(is_plat)
         {
            sm_text = this.keys_instance.translate("SM0");
            if(this.keys_instance.soft_len > 0)
            {
               sm_text = this.keys_instance.translate("SM0") + " (" + this.keys_instance.soft_len + ")";
            }
            this.soft_check_box = this.create_check_button(sm_text,this.general_ui,function(param1:Boolean):*
            {
               main_instance.soft_mode = param1;
            }).check_button;
            this.save_key_config({
               "name":"soft",
               "ui":this.soft_check_box,
               "state":false,
               "shortcut":"F4"
            });
            btn = new this.keys_instance.ui_button_class(this.keys_instance.translate("LS0"),120,this.ls_soft);
            this.general_ui[this.keys_instance.add_ui_element](btn);
         }
         this.hide_players_check_box = this.create_check_button(this.keys_instance.translate("HP0"),this.general_ui,function(param1:Boolean):*
         {
            main_instance.hide_players = param1;
            if(param1)
            {
               main_instance.Statements.hide_players();
            }
         }).check_button;
         this.save_key_config({
            "name":"hide_players",
            "ui":this.hide_players_check_box,
            "state":false,
            "shortcut":"F5"
         });
         this.objects_check_box = this.create_check_button(this.keys_instance.translate("HO0"),this.general_ui,function(param1:Boolean):*
         {
            main_instance.disable_objects = param1;
            if(param1)
            {
               main_instance.Statements.hide_objects();
            }
         }).check_button;
         this.save_key_config({
            "name":"objects",
            "ui":this.objects_check_box,
            "state":false,
            "shortcut":"F6"
         });
         this.animations_check_box = this.create_check_button(this.keys_instance.translate("DA0"),this.general_ui,function(param1:Boolean):*
         {
            main_instance.disable_animations = param1;
         }).check_button;
         this.save_key_config({
            "name":"animations",
            "ui":this.animations_check_box,
            "state":false,
            "shortcut":"F7"
         });
         this.scoreboard_check_box = this.create_check_button(this.keys_instance.translate("DS0"),this.general_ui,function(param1:Boolean):*
         {
            main_instance.disable_scoreboard = param1;
            main_instance.Statements.chande_scoreboard_display(!param1);
         }).check_button;
         this.save_key_config({
            "name":"scoreboard",
            "ui":this.scoreboard_check_box,
            "state":false,
            "shortcut":"F8"
         });
         if(is_bronze || is_gold || is_gold_II || is_plat)
         {
            if(!is_bronze && !is_gold)
            {
               mass_obj = this.create_check_button(this.keys_instance.translate("RM0"),this.general_ui,function(param1:Boolean):*
               {
                  main_instance.mass_reduction = param1;
                  if(param1)
                  {
                     if(mass_input)
                     {
                        if(mass_input[keys_instance.text_field].text == "" || Boolean(isNaN(Number(mass_input[keys_instance.text_field].text))))
                        {
                           mass_input[keys_instance.text_field].text = "0";
                        }
                     }
                  }
               },true);
               this.mass_check_box = mass_obj.check_button;
               this.mass_input = mass_obj.input;
               this.save_key_config({
                  "name":"mass",
                  "ui":this.mass_check_box,
                  "ui_input":this.mass_input,
                  "state":false,
                  "value":"0",
                  "shortcut":"F9"
               });
               movement_obj = this.create_check_button(this.keys_instance.translate("MS0"),this.general_ui,function(param1:Boolean):*
               {
                  main_instance.change_movement_speed = param1;
                  if(param1)
                  {
                     if(movement_input)
                     {
                        if(movement_input[keys_instance.text_field].text == "" || Boolean(isNaN(Number(movement_input[keys_instance.text_field].text))))
                        {
                           movement_input[keys_instance.text_field].text = "3.45";
                        }
                     }
                  }
               },true);
               this.movement_check_box = movement_obj.check_button;
               this.movement_input = movement_obj.input;
               this.save_key_config({
                  "name":"movement",
                  "ui":this.movement_check_box,
                  "ui_input":this.movement_input,
                  "state":false,
                  "value":"3.45",
                  "shortcut":"CTRL F1"
               });
               jump_obj = this.create_check_button(this.keys_instance.translate("JH0"),this.general_ui,function(param1:Boolean):*
               {
                  main_instance.change_jump_height = param1;
                  if(param1)
                  {
                     if(jump_input)
                     {
                        if(jump_input[keys_instance.text_field].text == "" || Boolean(isNaN(Number(jump_input[keys_instance.text_field].text))))
                        {
                           jump_input[keys_instance.text_field].text = "1";
                        }
                     }
                  }
                  else
                  {
                     keys_instance.mouse_info_class[keys_instance.mouse_info_instance][keys_instance.jump_height] = 1;
                  }
               },true);
               this.jump_check_box = jump_obj.check_button;
               this.jump_input = jump_obj.input;
               this.save_key_config({
                  "name":"jump",
                  "ui":this.jump_check_box,
                  "ui_input":this.jump_input,
                  "state":false,
                  "value":"1",
                  "shortcut":"F11"
               });
               insta_win_obj = this.create_check_button(this.keys_instance.translate("IW0"),this.farm_ui,function(param1:Boolean):*
               {
                  main_instance.insta_win = param1;
                  if(param1)
                  {
                     if(insta_win_input)
                     {
                        if(insta_win_input[keys_instance.text_field].text == "" || Boolean(isNaN(Number(insta_win_input[keys_instance.text_field].text))))
                        {
                           insta_win_input[keys_instance.text_field].text = "5.0";
                        }
                     }
                  }
                  else
                  {
                     clearTimeout(main_instance.insta_win_timeout);
                  }
               },true);
               this.insta_win_check_box = insta_win_obj.check_button;
               this.insta_win_input = insta_win_obj.input;
               this.save_key_config({
                  "name":"insta_win",
                  "ui":this.insta_win_check_box,
                  "ui_input":this.insta_win_input,
                  "state":false,
                  "value":"5.0",
                  "shortcut":"CTRL F9"
               });
               insta_d2_obj = this.create_check_button(this.keys_instance.translate("IM0"),this.farm_ui,function(param1:Boolean):*
               {
                  main_instance.insta_death2 = param1;
                  if(param1)
                  {
                     if(insta_death2_input)
                     {
                        if(insta_death2_input[keys_instance.text_field].text == "" || Boolean(isNaN(Number(insta_death2_input[keys_instance.text_field].text))))
                        {
                           insta_death2_input[keys_instance.text_field].text = "5.0";
                        }
                     }
                  }
                  else
                  {
                     clearTimeout(main_instance.insta_death_timeout);
                  }
               },true);
               this.insta_death2_check_box = insta_d2_obj.check_button;
               this.insta_death2_input = insta_d2_obj.input;
               this.save_key_config({
                  "name":"insta_death2",
                  "ui":this.insta_death2_check_box,
                  "ui_input":this.insta_death2_input,
                  "state":false,
                  "value":"5.0",
                  "shortcut":"CTRL F11"
               });
            }
            if(!is_bronze)
            {
               this.anti_leve_check_box = this.create_check_button(this.keys_instance.translate("CA0"),this.general_ui,function(param1:Boolean):*
               {
                  main_instance.check_anti_leve = param1;
                  if(!param1)
                  {
                     main_instance.Statements.remove_leve_check();
                  }
               }).check_button;
               this.save_key_config({
                  "name":"anti_leve",
                  "state":false,
                  "ui":this.anti_leve_check_box
               });
            }
            this.ping_check_box = this.create_check_button(this.keys_instance.translate("LP0") + " (VISUAL)",this.general_ui,function(param1:Boolean):*
            {
               main_instance.low_ping = param1;
            }).check_button;
            this.save_key_config({
               "name":"ping",
               "state":false,
               "ui":this.ping_check_box
            });
            this.delay_check_box = this.create_check_button(this.keys_instance.translate("ND0") + " (VISUAL)",this.general_ui,function(param1:Boolean):*
            {
               main_instance.no_delay = param1;
            }).check_button;
            this.save_key_config({
               "name":"delay",
               "state":false,
               "ui":this.delay_check_box
            });
         }
         if(!is_bronze)
         {
            this.death_check_box = this.create_check_button(this.keys_instance.translate("QD0"),this.general_ui,function(param1:Boolean):*
            {
               main_instance.quick_death = param1;
            }).check_button;
            this.save_key_config({
               "name":"death",
               "state":false,
               "ui":this.death_check_box,
               "shortcut":"DELETE"
            });
            this.insta_death_check_box = this.create_check_button(this.keys_instance.translate("DI0"),this.general_ui,function(param1:Boolean):*
            {
               main_instance.insta_death = param1;
            }).check_button;
            this.save_key_config({
               "name":"insta_death",
               "state":false,
               "ui":this.insta_death_check_box
            });
         }
         for each(obj in this.keys)
         {
            if(obj.state != undefined && Boolean(obj.ui))
            {
               do
               {
                  obj.ui[this.keys_instance.check_button_exec](new MouseEvent("mouseDown"));
               }
               while(obj.ui[this.keys_instance.is_selected] != obj.state);
               
            }
         }
         if(config)
         {
            this.load_config();
         }
      }
      
      private function update_shortcut_text(param1:Object) : void
      {
         var _loc2_:* = undefined;
         if(param1.ui)
         {
            _loc2_ = param1.state != undefined ? param1.ui[this.keys_instance.text_field2] : param1.ui;
            if(param1.using_shortcut)
            {
               if(_loc2_.text.search(/\s?\[.*?\]/) < 0)
               {
                  _loc2_.text += " [" + param1.shortcut + "]";
               }
            }
            else
            {
               _loc2_.text = _loc2_.text.replace(/\s?\[.*?\]/,"");
            }
            if(param1.ui_input)
            {
               param1.ui_input.x = param1.ui.x + param1.ui.width + 10;
            }
         }
         if(param1.input)
         {
            param1.input[this.keys_instance.text_field].text = param1.shortcut;
         }
      }
      
      private function set_shortcut_state(param1:Object, param2:Boolean = true) : void
      {
         if(param1.shortcut)
         {
            param1.using_shortcut = param2;
            if(param1.input)
            {
               param1.input.mouseChildren = param2;
               if(param2)
               {
                  param1.input.transform.colorTransform = new ColorTransform();
               }
               else
               {
                  param1.input.transform.colorTransform = new ColorTransform(0.8,0.8,0.8);
               }
            }
            this.update_shortcut_text(param1);
         }
      }
      
      private function reset_shortcut(param1:*, param2:Boolean) : void
      {
         var _loc3_:* = null;
         if(param2)
         {
            for each(_loc3_ in this.keys)
            {
               if(_loc3_.shortcut)
               {
                  _loc3_.input[this.keys_instance.text_field].text = _loc3_.default_sc;
                  _loc3_.shortcut = _loc3_.default_sc;
               }
            }
         }
         else if(param1.shortcut)
         {
            param1.input[this.keys_instance.text_field].text = _loc3_.default_sc;
            param1.shortcut = _loc3_.default_sc;
         }
      }
      
      private function save_key_config(param1:Object, param2:Boolean = false) : void
      {
         var txt2:String = null;
         var box:Object = null;
         var obj:Object = null;
         obj = param1;
         if(obj.shortcut != undefined)
         {
            if(obj.ui)
            {
               if(obj.ui.hasOwnProperty("text"))
               {
                  txt2 = String(obj.ui.text);
               }
               else if(obj.ui[this.keys_instance.text_field2])
               {
                  txt2 = String(obj.ui[this.keys_instance.text_field2].text);
               }
               else
               {
                  txt2 = String(obj.description);
               }
            }
            else
            {
               txt2 = String(param1.description);
            }
            box = this.create_check_button(txt2.replace(/\s?\[.*/,"").replace(/\s?\(.*?\)/,""),this.keys_ui,function(param1:Boolean):*
            {
               set_shortcut_state(obj,param1);
            },true,"",120,255);
            obj.button = box.check_button;
            obj.input = box.input;
            obj.input[this.keys_instance.text_field].restrict = "";
            obj.input[this.keys_instance.text_field].text = obj.shortcut;
            this.set_shortcut_state(obj);
            obj.default_sc = obj.shortcut;
            obj.input.addEventListener(KeyboardEvent.KEY_DOWN,function(param1:KeyboardEvent):*
            {
               var _loc2_:* = null;
               var _loc3_:* = null;
               var _loc4_:* = obj.shortcut;
               var _loc5_:*;
               if((_loc5_ = param1.keyCode) == Keyboard.ESCAPE)
               {
                  obj.shortcut = obj.default_sc;
               }
               else
               {
                  if(obj.input[keys_instance.text_field].text == obj.default_sc)
                  {
                     _loc2_ = new Array();
                  }
                  else
                  {
                     _loc2_ = _loc4_.split(" ");
                  }
                  _loc3_ = main_instance.KeyboardHandler.keys_codes[_loc5_];
                  if(_loc2_.length <= 2 && _loc2_.indexOf(_loc3_.toUpperCase()) < 0)
                  {
                     _loc2_.push(_loc3_);
                     obj.shortcut = _loc2_.join(" ").toUpperCase();
                  }
               }
               obj.shortcut = main_instance.Statements.trim(obj.shortcut);
               if(obj.name == "open_menu")
               {
                  keys_instance.open_menu_sc = obj.shortcut;
               }
               obj.input[keys_instance.text_field].text = obj.shortcut;
               if(_loc4_ in main_instance.KeyboardHandler.shortcuts)
               {
                  delete main_instance.KeyboardHandler.shortcuts[_loc4_];
               }
               main_instance.KeyboardHandler.shortcuts[obj.shortcut] = obj;
            });
            obj.input.addEventListener(FocusEvent.FOCUS_IN,function(param1:FocusEvent):*
            {
               main_instance.KeyboardHandler.focusing = obj.input[keys_instance.text_field];
            });
            obj.input.addEventListener(FocusEvent.FOCUS_OUT,function(param1:FocusEvent):*
            {
               if(obj.input[keys_instance.text_field].text == "")
               {
                  reset_shortcut(obj);
               }
               main_instance.KeyboardHandler.focusing = null;
            });
            this.main_instance.KeyboardHandler.shortcuts[obj.shortcut] = obj;
         }
         this.keys[param1.name] = obj;
      }
      
      public function ls_commands() : void
      {
         var ui:* = undefined;
         var txt:* = undefined;
         if(!this.commands_ui)
         {
            this.commands_ui = new this.keys_instance.ui_element_class(380,190);
            this.commands_ui[this.keys_instance.set_box](this.keys_instance.translate("LS1"),function():*
            {
               if(commands_ui.parent)
               {
                  commands_ui.parent.removeChild(commands_ui);
               }
            });
            this.commands_ui.x = 210;
            this.commands_ui.y = 205;
            this.commands_ui[this.keys_instance.set_draggable]();
            ui = new this.keys_instance.ui_element_class(380,190);
            this.commands_ui[this.keys_instance.set_scrollable](true);
            txt = new this.keys_instance.ui_text_field_class(this.keys_instance.translate("CL0"),380,0,null,true);
            txt.mouseEnabled = true;
            txt.selectable = true;
            ui[this.keys_instance.add_ui_element](txt);
            this.commands_ui[this.keys_instance.add_ui_element](ui);
         }
         if(!this.commands_ui.parent)
         {
            this.keys_instance.main_ui_class[this.keys_instance.add_ui](this.commands_ui);
         }
      }
      
      public function ls_maps() : void
      {
         var ui:*;
         var arr:*;
         var code:String = null;
         var txt:* = undefined;
         if(Boolean(this.lsmaps_ui) && Boolean(this.lsmaps_ui.parent))
         {
            this.lsmaps_ui.parent.removeChild(this.lsmaps_ui);
            this.lsmaps_ui = null;
         }
         this.lsmaps_ui = new this.keys_instance.ui_element_class(600,380);
         this.lsmaps_ui[this.keys_instance.set_box](this.keys_instance.translate("LS0") + " (" + this.keys_instance.maps_len + ")",function():*
         {
            if(lsmaps_ui.parent)
            {
               lsmaps_ui.parent.removeChild(lsmaps_ui);
            }
         });
         this.lsmaps_ui.x = 100;
         this.lsmaps_ui.y = 100;
         this.lsmaps_ui[this.keys_instance.set_draggable]();
         ui = new this.keys_instance.ui_element_class(600,380);
         ui[this.keys_instance.set_scrollable](true);
         arr = new Array();
         for(code in this.keys_instance.maps)
         {
            arr.push(code);
         }
         txt = new this.keys_instance.ui_text_field_class(arr.join(", "),600,0,null,true);
         txt.mouseEnabled = true;
         txt.selectable = true;
         ui[this.keys_instance.add_ui_element](txt);
         this.lsmaps_ui[this.keys_instance.add_ui_element](ui);
         if(!this.lsmaps_ui.parent)
         {
            this.keys_instance.main_ui_class[this.keys_instance.add_ui](this.lsmaps_ui);
         }
      }
      
      public function ls_soft() : void
      {
         var ui:*;
         var arr:*;
         var txt:* = undefined;
         var code:String = null;
         if(Boolean(this.lsmaps_ui) && Boolean(this.lsmaps_ui.parent))
         {
            this.lsmaps_ui.parent.removeChild(this.lsmaps_ui);
            this.lsmaps_ui = null;
         }
         this.lsmaps_ui = new this.keys_instance.ui_element_class(600,380);
         this.lsmaps_ui[this.keys_instance.set_box](this.keys_instance.translate("LS0") + " (" + this.keys_instance.soft_len + ")",function():*
         {
            if(lsmaps_ui.parent)
            {
               lsmaps_ui.parent.removeChild(lsmaps_ui);
            }
         });
         this.lsmaps_ui.x = 100;
         this.lsmaps_ui.y = 100;
         this.lsmaps_ui[this.keys_instance.set_draggable]();
         ui = new this.keys_instance.ui_element_class(600,380);
         ui[this.keys_instance.set_scrollable](true);
         arr = new Array();
         for(code in this.main_instance.soft_list)
         {
            arr.push(code);
         }
         txt = new this.keys_instance.ui_text_field_class(arr.join(", "),600,0,null,true);
         txt.mouseEnabled = true;
         txt.selectable = true;
         ui[this.keys_instance.add_ui_element](txt);
         this.lsmaps_ui[this.keys_instance.add_ui_element](ui);
         if(!this.lsmaps_ui.parent)
         {
            this.keys_instance.main_ui_class[this.keys_instance.add_ui](this.lsmaps_ui);
         }
      }
      
      public function close_menu() : void
      {
         if(this.menu_ui.parent)
         {
            this.menu_ui.parent.removeChild(this.menu_ui);
         }
      }
      
      private function create_check_button(param1:String, param2:*, param3:Function, param4:Boolean = false, param5:String = "", param6:uint = 50, param7:uint = 5) : Object
      {
         var _loc8_:*;
         (_loc8_ = new this.keys_instance.ui_element_class(param2.width,24))[this.keys_instance.set_prep_ui](this.keys_instance.prep_ui_class[this.keys_instance.prep_ui1_instance]);
         param2[this.keys_instance.add_ui_element](_loc8_);
         var _loc9_:*;
         (_loc9_ = new this.keys_instance.ui_check_button_class(param3))[this.keys_instance.text_field2].text = param1;
         _loc8_[this.keys_instance.add_ui_element](_loc9_);
         var _loc10_:* = null;
         if(param4)
         {
            (_loc10_ = new this.keys_instance.ui_input_class(param6))[this.keys_instance.text_field].maxChars = param7;
            _loc10_[this.keys_instance.text_field].text = param5;
            _loc8_[this.keys_instance.add_ui_element](_loc10_);
         }
         return {
            "check_button":_loc9_,
            "input":_loc10_
         };
      }
      
      private function create_items_list(param1:String, param2:*, param3:Boolean = false, param4:Function = null, param5:int = -1) : Object
      {
         var _loc6_:* = undefined;
         var _loc7_:*;
         (_loc7_ = new this.keys_instance.ui_element_class(param2.width,24))[this.keys_instance.set_prep_ui](this.keys_instance.prep_ui_class[this.keys_instance.prep_ui1_instance]);
         param2[this.keys_instance.add_ui_element](_loc7_);
         if(param3)
         {
            (_loc6_ = new this.keys_instance.ui_check_button_class(param4))[this.keys_instance.text_field2].text = param1;
         }
         else
         {
            _loc6_ = new this.keys_instance.ui_text_field_class(param1);
         }
         var _loc8_:* = new this.keys_instance.ui_items_list_class(param5 != -1 ? param5 : 180);
         _loc7_[this.keys_instance.add_ui_element](_loc6_,_loc8_);
         return {
            "ui":_loc7_,
            "txt":_loc6_,
            "list":_loc8_
         };
      }
      
      private function create_input(param1:String, param2:*, param3:String = "", param4:uint = 2, param5:uint = 50) : *
      {
         var _loc6_:*;
         (_loc6_ = new this.keys_instance.ui_element_class(param2.width,24))[this.keys_instance.set_prep_ui](this.keys_instance.prep_ui_class[this.keys_instance.prep_ui1_instance]);
         param2[this.keys_instance.add_ui_element](_loc6_);
         var _loc7_:* = new this.keys_instance.ui_text_field_class(param1);
         var _loc8_:*;
         (_loc8_ = new this.keys_instance.ui_input_class(param5))[this.keys_instance.text_field].maxChars = param4;
         _loc8_[this.keys_instance.text_field].text = param3;
         _loc6_[this.keys_instance.add_ui_element](_loc7_,_loc8_);
         return _loc8_;
      }
      
      public function change_menu_tab(param1:String = "general") : void
      {
         this.options_ui[this.keys_instance.reset_ui]();
         if(param1 == "general")
         {
            this.options_ui[this.keys_instance.add_ui_element](this.general_ui);
         }
         else if(param1 == "farm")
         {
            if(this.farm_ui)
            {
               this.options_ui[this.keys_instance.add_ui_element](this.farm_ui);
            }
         }
         else if(param1 == "bot")
         {
            this.options_ui[this.keys_instance.add_ui_element](this.bot_ui);
         }
         else if(param1 == "settings")
         {
            this.options_ui[this.keys_instance.add_ui_element](this.settings_ui);
         }
         else if(param1 == "keyboard")
         {
            this.options_ui[this.keys_instance.add_ui_element](this.keys_ui);
         }
         this.last_tab = param1;
      }
      
      public function disable_ap_buttons(param1:Boolean = false) : void
      {
         if(this.rec_button)
         {
            if(param1)
            {
               this.rec_button[this.keys_instance.set_button_state](false);
            }
            this.del_button[this.keys_instance.set_button_state](false);
            this.preview_button[this.keys_instance.set_button_state](false);
            this.save_button[this.keys_instance.set_button_state](false);
         }
      }
      
      public function set_status(param1:String = "idle") : void
      {
         if(!this.main_instance.maps_allowed)
         {
            param1 = "unv";
         }
         if(Boolean(this.status_field) && Boolean(this[param1 + "_status"]))
         {
            this.status_field.htmlText = this[param1 + "_status"];
         }
      }
      
      public function update_ap_text() : void
      {
         this.auto_play_check_box[this.keys_instance.text_field2].text = this.auto_play_check_box[this.keys_instance.text_field2].text.replace(/\(\d+\)/,"(" + this.keys_instance.maps_len + ")");
      }
      
      public function load_config() : void
      {
         var _loc1_:* = undefined;
         var _loc2_:* = undefined;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = 0;
         for(_loc1_ in config)
         {
            _loc2_ = config[_loc1_];
            _loc3_ = this.keys[_loc1_];
            if(_loc1_ == "menu_x" || _loc1_ == "menu_y")
            {
               this[_loc1_] = _loc2_;
               this[_loc1_.replace("menu_","")] = _loc2_;
            }
            else if(_loc1_ == "window_align")
            {
               _loc4_ = new Array("","B","BL","BR","L","R","T","TL","TR");
               _loc5_ = new Array("CENTER","BOTTOM","BOTTOM_LEFT","BOTTOM_RIGHT","LEFT","RIGHT","TOP","TOP_LEFT","TOP_RIGHT");
               if((_loc6_ = _loc4_.indexOf(_loc2_) > -1 ? _loc4_.indexOf(_loc2_ is String ? _loc2_ : _loc2_.value) : _loc5_.indexOf(_loc2_ is String ? _loc2_ : _loc2_.value)) == -1)
               {
                  _loc6_ = 0;
               }
               this[_loc1_][this.keys_instance.select_item](_loc6_);
               this.main_instance.stage.align = _loc4_[_loc6_];
               if(_loc3_)
               {
                  _loc3_.ui.text = _loc3_.ui.text.replace(/\[.*?]/,_loc2_.shortcut);
               }
            }
            else if(_loc1_ == "open_menu")
            {
               this.keys_instance.open_menu_sc = _loc2_.shortcut;
               _loc3_.shortcut = _loc2_.shortcut;
               do
               {
                  _loc3_.button[this.keys_instance.check_button_exec](new MouseEvent("mouseDown"));
               }
               while(_loc3_.button[this.keys_instance.is_selected] != _loc2_.using_shortcut);
               
            }
            else if(_loc3_)
            {
               _loc3_.shortcut = _loc2_.shortcut || _loc3_.default_sc;
               if(_loc3_.button)
               {
                  do
                  {
                     _loc3_.button[this.keys_instance.check_button_exec](new MouseEvent("mouseDown"));
                  }
                  while(_loc3_.button[this.keys_instance.is_selected] != (_loc2_.using_shortcut != undefined ? _loc2_.using_shortcut : true));
                  
               }
               if(_loc3_.ui_input)
               {
                  _loc3_.ui_input[this.keys_instance.text_field].text = _loc2_.value;
               }
               if(_loc3_.state != undefined)
               {
                  do
                  {
                     _loc3_.ui[this.keys_instance.check_button_exec](new MouseEvent("mouseDown"));
                  }
                  while(_loc3_.ui[this.keys_instance.is_selected] != _loc2_.state);
                  
               }
            }
         }
      }
   }
}
