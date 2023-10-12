package ChargeurTransformice_fla
{
   import flash.events.*;
   import flash.system.*;
   import flash.text.*;
   import flash.ui.*;


   public class KeyboardHandler
   {
       
      
      public var main_instance:ChargeurTransformice_fla.MainTimeline;
      
      public var keys_instance:ChargeurTransformice_fla.Keys;
      
      private var keys_pressed:Array;
      
      public var pressing_up_key:Boolean;
      
      public var pressing_w_key:Boolean;
      
      public var focusing:Object = null;
      
      public var keys_codes:Object;
      
      public var shortcuts:Object;
      
      public function KeyboardHandler()
      {
         super();
         this.main_instance = ChargeurTransformice_fla.MainTimeline.instance;
         this.keys_instance = this.main_instance.Keys;
         this.keys_pressed = new Array();
         this.keys_codes = {
            0:"Unidentified",
            8:"Backspace",
            9:"Tab",
            12:"Clear",
            13:"Enter",
            16:"Shift",
            17:"Ctrl",
            18:"Alt",
            19:"Pause/Break",
            20:"CapsLock",
            27:"Escape",
            32:"SpaceBar",
            33:"PageUp",
            34:"PageDown",
            35:"End",
            36:"Home",
            37:"LeftArrow",
            38:"UpArrow",
            39:"RightArrow",
            40:"DownArrow",
            41:"Select",
            42:"Print",
            43:"Execute",
            44:"PrintScreen/Snapshot",
            45:"Insert",
            46:"Delete",
            47:"Help",
            48:"0",
            49:"1",
            50:"2",
            51:"3",
            52:"4",
            53:"5",
            54:"6",
            55:"7",
            56:"8",
            57:"9",
            65:"A",
            66:"B",
            67:"C",
            68:"D",
            69:"E",
            70:"F",
            71:"G",
            72:"H",
            73:"I",
            74:"J",
            75:"K",
            76:"L",
            77:"M",
            78:"N",
            79:"O",
            80:"P",
            81:"Q",
            82:"R",
            83:"S",
            84:"T",
            85:"U",
            86:"V",
            87:"W",
            88:"X",
            89:"Y",
            90:"Z",
            91:"LeftWindow/Meta/OSKey",
            92:"RightWindow/Meta/OSKey",
            93:"ContextMenu",
            96:"Numpad0",
            97:"Numpad1",
            98:"Numpad2",
            99:"Numpad3",
            100:"Numpad4",
            101:"Numpad5",
            102:"Numpad6",
            103:"Numpad7",
            104:"Numpad8",
            105:"Numpad9",
            106:"Multiply",
            107:"Add",
            108:"KeypadEnter",
            109:"Subtract",
            110:"DecimalPoint",
            111:"Divide",
            112:"F1",
            113:"F2",
            114:"F3",
            115:"F4",
            116:"F5",
            117:"F6",
            118:"F7",
            119:"F8",
            120:"F9",
            121:"F10",
            122:"F11",
            123:"F12",
            124:"F13",
            125:"F14",
            126:"F15",
            127:"F16",
            128:"F17",
            129:"F18",
            130:"F19",
            131:"F20",
            132:"F21",
            133:"F22",
            134:"F23",
            135:"F24",
            136:"F25",
            137:"F26",
            138:"F27",
            139:"F28",
            140:"F29",
            141:"F30",
            142:"F31",
            143:"F32",
            144:"NumLock",
            145:"ScrollLock",
            166:"Navigate/PageBack",
            167:"Navigate/PageForward",
            168:"Reload/RefreshPage",
            174:"AudioVolumeDown",
            175:"AudioVolumeUp",
            186:"Semi-colon",
            187:"EqualSign",
            188:"Comma",
            189:"Dash",
            190:"Period",
            191:"ForwardSlash",
            192:"GraveAccent",
            219:"OpenBracket",
            220:"BackSlash",
            221:"CloseBracket",
            222:"SingleQuote"
         };
         this.shortcuts = {};
      }
      
      public function parse_key_down(param1:KeyboardEvent) : void
      {
         var _loc2_:* = null;
         if(!this.main_instance.game_loaded)
         {
            return;
         }
         var _loc3_:* = param1.keyCode;
         var _loc4_:* = this.keys_codes[_loc3_];
         if(this.keys_pressed.indexOf(_loc4_) < 0)
         {
            this.keys_pressed.push(_loc4_);
         }
         if(this.main_instance.stage.focus is TextField && this.main_instance.stage.focus.type == TextFieldType.INPUT)
         {
            return;
         }
         switch(_loc3_)
         {
            case Keyboard.UP:
            case Keyboard.W:
               this[_loc4_ == "W" ? "pressing_w_key" : "pressing_up_key"] = true;
            case Keyboard.A:
            case Keyboard.S:
            case Keyboard.D:
            case Keyboard.LEFT:
            case Keyboard.RIGHT:
            case Keyboard.DOWN:
               if(this.main_instance.auto_play_disable_on_move && this.main_instance.Statements.current_timeout > -1)
               {
                  this.main_instance.Statements.disable_auto_play();
               }
               break;
            case Keyboard.ESCAPE:
               if(this.main_instance.Interface)
               {
                  if(this.focusing == null)
                  {
                     this.main_instance.Interface.close_menu();
                     this.main_instance.Statements.remove_leve_check();
                  }
               }
         }
         var _loc5_:* = this.main_instance.Statements.trim(this.keys_pressed.join(" ").toUpperCase());
         if(this.main_instance.Statements.trim(this.keys_pressed.join(" ").toUpperCase()) == this.keys_instance.open_menu_sc)
         {
            if(this.main_instance.Interface)
            {
               if(!this.main_instance.Interface.keys.open_menu.using_shortcut)
               {
                  return;
               }
            }
            else
            {
               this.main_instance.Interface = new Interface();
            }
            if(this.keys_instance.main_ui_class)
            {
               this.keys_instance.main_ui_class[this.keys_instance.add_ui](this.main_instance.Interface.menu_ui);
            }
            this.main_instance.Interface.change_menu_tab(this.main_instance.Interface.last_tab);
         }
         else if(this.main_instance.Interface)
         {
            if(_loc5_ in this.shortcuts)
            {
               _loc2_ = this.shortcuts[_loc5_];
            }
            else if(_loc4_.toUpperCase() in this.shortcuts)
            {
               _loc2_ = this.shortcuts[_loc4_.toUpperCase()];
            }
            if(_loc2_)
            {
               if(_loc2_.using_shortcut)
               {
                  if(_loc2_.state != undefined)
                  {
                     if(_loc2_.name == "death")
                     {
                        if(this.main_instance.quick_death)
                        {
                           this.main_instance.Statements.kill_player();
                        }
                     }
                     else
                     {
                        _loc2_.ui[this.keys_instance.check_button_exec](new MouseEvent("mouseDown"));
                     }
                  }
                  else if(_loc2_.name == "window_align")
                  {
                     if(this.main_instance.stage.align != "B")
                     {
                        this.main_instance.stage.align = "B";
                        this.main_instance.Interface.window_align[this.keys_instance.select_item](1);
                     }
                     else
                     {
                        this.main_instance.stage.align = "";
                        this.main_instance.Interface.window_align[this.keys_instance.select_item](0);
                     }
                  }
               }
            }
         }
      }
      
      public function parse_key_up(param1:KeyboardEvent) : void
      {
         if(!this.main_instance.game_loaded)
         {
            return;
         }
         var _loc2_:* = param1.keyCode;
         var _loc3_:* = this.keys_codes[_loc2_];
         var _loc4_:* = this.keys_pressed.indexOf(_loc3_);
         if(this.keys_pressed.indexOf(_loc3_) > -1)
         {
            this.keys_pressed.splice(_loc4_,1);
         }
         if(_loc2_ == Keyboard.UP)
         {
            this.pressing_up_key = false;
         }
         else if(_loc2_ == Keyboard.W)
         {
            this.pressing_w_key = false;
         }
      }
   }
}
