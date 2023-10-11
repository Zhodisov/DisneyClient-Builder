package ChargeurTransformice_fla
{
   import com.adobe.serialization.json.*;

   import flash.display.*;
   import flash.events.*;
   import flash.net.*;
   import flash.system.*;
   import flash.utils.*;
   import com.hurlant.util.*;
   public dynamic class Keys
   {
       
      
      public var main_instance:ChargeurTransformice_fla.TransformiceChargeur;
      
      public var app_domain:LoaderInfo;
      
      public var maps_len:uint = 0;
      
      public var soft_len:uint = 0;
      
      public var open_menu_sc:String = "CTRL TAB";
      
      public var maps:Array;
      
      public var locales:Object;
      
      public function Keys()
      {
         super();
         this.main_instance = ChargeurTransformice_fla.TransformiceChargeur.instance;
         this.maps = new Array();
         this.locales = {
            "en":{
               "AL0":"Center",
               "AL1":"Bottom",
               "AL2":"Bottom left",
               "AL3":"Bottom right",
               "AL4":"Left",
               "AL5":"Right",
               "AL6":"Top",
               "AL7":"Top left",
               "AL8":"Top right",
               "AP0":"Players being copied",
               "AP1":"No player being copied",
               "AP2":"Unable to copy yourself",
               "AP3":"Unable to record due to no players being copied. Type <V>/stalk Player#tag</V> to copy a player",
               "AP4":"Reduced delay of Autoplay (ms):",
               "AP5":"List of maps (expires in 5 minutes): ",
               "CA0":"Check anti-leve",
               "CC0":"You have been disconnected by main server, but the client can keep your connection to the room stable, noting that the server can also close it",
               "CFG0":"Config saved",
               "CL0":"<J>/xml -</J> Display XML of running map. Use <J>/xml auto</J> to enable auto display mode\n<J>/stalk [Player#tag] -</J> Insert player into list of copied players. Use <J>/stalk clear</J> to empty list\n<J>/setmenu [x, y] -</J> Set menu display coordinates\n<J>/save | /saveconfig -</J> Save\n<J>/ajuda | /help | /commands | /comandos</J> Display command list\n<J>/rec [@code] -</J> Display the best time made on a specific map. Available categories: P3, P5, P6, P7, P9, P13, P17, P18, P19, V and WJ\n<J>/prev -</J> Return to the previous map from the P17 docs (#records). Use a number if you want to go back more than 1 map. Example: <J>/prev 2</J>\n<J>/next -</J> Skip to the next map from the P17 docs (#records). Use a number if you want to skip more than 1 map. Example: <J>/next 2</J>\n<J>/mapindex -</J> Show which position of P17 docs is selected in the system\n<J>/setindex -</J> Select a position from P17 docs",
               "DA0":"Disable animations",
               "DA1":"Stop with a move key (WASD/arrow keys)",
               "DS0":"Disable scoreboard",
               "DI0":"Die instantly if someone has won",
               "ERR0":"failed",
               "ERR1":"failed (expired token)",
               "ERR2":"Unable to get list",
               "ERR3":"Map not registered",
               "ERR4":"Outdated version",
               "ERR5":"unavailable temporarily",
               "GE0":"General",
               "HO0":"Hide objects",
               "HP0":"Hide players",
               "IDLE0":"idle",
               "IM0":"Auto mort",
               "IW0":"Auto win",
               "JD0":"Reduced delay of jump",
               "JH0":"Jump height",
               "LD0":"loading",
               "LP0":"Low ping",
               "LS0":"List of maps",
               "LS1":"Command list",
               "LS2":"Soft list",
               "MS0":"Movement speed",
               "ND0":"No delay",
               "OM0":"Open menu",
               "REC0":"recording",
               "REC1":"best time » ",
               "REC2":"There\'s no record",
               "REC3":"Map not registered",
               "RI0":"Unable to save the current run. Map is reversed",
               "RI1":"reversed",
               "RK0":"Reset all",
               "RM0":"Reduce mass by %",
               "SC0":"Save",
               "SC1":"Keyboad shortcuts",
               "SC2":"Use keyboard shortcuts",
               "SC3":"Once you disable a keyboard shortcut, you\'ll only be able to use its function manually (by clicking). If the option <J>\"Open menu\"</J> is disabled, it won\'t be possible to reopen menu after it\'s closed <B>until you use command /menu on</B>\nTo change a keyboard shortcut, you must select its box and press the wanted keys or <J>ESC</J> to reset it",
               "SD0":"Spawn delay",
               "SE0":"Settings",
               "SM0":"Soft mode",
               "QD0":"Quick death",
               "WA0":"Window align",
               "WT0":"waiting"
            },
            "es":{
               "AL0":"Centro",
               "AL1":"Inferior",
               "AL2":"Inferior izquierdo",
               "AL3":"Inferior derecho",
               "AL4":"Izquierda",
               "AL5":"Derecha",
               "AL6":"Superior",
               "AL7":"Superior izquierdo",
               "AL8":"Superior derecho",
               "AP0":"Jugadores que están siendo copiados",
               "AP1":"No hay jugador siendo copiado",
               "AP2":"Incapaz de copiarte a ti mismo",
               "AP3":"No se puede grabar, no hay jugador siendo copiado. Escribe <V>/stalk Player#tag</V> para copiar un jugador",
               "AP4":"Delay de Autoplay reducido (ms):",
               "AP5":"Lista de mapas (expirará en 5 minutos): ",
               "CA0":"Verificar anti-leve",
               "CFG0":"Configuración guardada",
               "CL0":"<J>/xml -</J> Mostrar XML del mapa actual. Usa <J>/xml auto</J> para activar la visualización automática\n<J>/stalk [Player#tag] -</J> Insertar un jugador en la lista de jugadores que están siendo copiados. Use <J>/stalk clear</J> para vaciar la lista\n<J>/setmenu [x, y] -</J> Cambiar las coordenadas del menú\n<J>/save | /saveconfig -</J> Guardar\n<J>/ajuda | /help | /commands | /comandos -</J> Mostrar lista de comandos\n<J>/rec [@code] -</J> Mostrar el tiempo registrado más corto del mapa. Categorías disponibles: P3, P5, P6, P7, P9, P13, P17, P18, P19, V y WJ\n<J>/prev -</J> Vuelve al mapa anterior de los docs P17 (#records). Utilice un número si desea volver más de 1 mapa. Ejemplo: <J>/prev 2</J>\n<J>/next -</J> Saltar al siguiente mapa de los docs P17 (#records). Utilice un número si desea saltar más de 1 mapa. Ejemplo: <J>/next 2</J>\n<J>/mapindex -</J> Mostrar qué posición de P17 docs está seleccionada en el sistema\n<J>/setindex -</J> Seleccionar una posicion de los docs P17",
               "DA0":"Desactivar animaciones",
               "DA1":"Parar con una tecla de movimiento (WASD/flechas)",
               "DS0":"Desactivar marcador",
               "DI0":"Muere si alguien ha ganado",
               "ERR0":"fallido",
               "ERR1":"fallido (token expirado)",
               "ERR2":"Lista no disponible",
               "ERR3":"Mapa no registrado",
               "ERR4":"Versión desactualizada",
               "ERR5":"indisponible temporalmente",
               "GE0":"General",
               "HO0":"Ocultar objetos",
               "HP0":"Ocultar jugadores",
               "IDLE0":"ausente",
               "JD0":"Delay de salto reducido",
               "JH0":"Altura de salto",
               "LD0":"cargando",
               "LP0":"Ping bajo",
               "LS0":"Lista de mapas",
               "LS1":"Lista de comandos",
               "LS2":"Lista de soft",
               "MS0":"Velocidad de movimiento",
               "ND0":"Sin delay",
               "OM0":"Abrir menú",
               "REC0":"grabando",
               "REC1":"mejor tiempo » ",
               "REC2":"No hay registro",
               "REC2":"Mapa no registrado",
               "RI0":"No se pudo guardar, el mapa está invertido",
               "RI1":"invertido",
               "RK0":"Resetear todo",
               "RM0":"Reducir masa en %",
               "SC0":"Guardar",
               "SC1":"Atajos de teclado",
               "SC2":"Usar atajos de teclado",
               "SC3":"Cuando desactivas un atajo de teclado, solo podrás utilizar su función manualmente (con clics). Si la opción <J>\"Abrir menu\"</J> es desactivada, no será más posible abrir el menú cuando cerrarlo <B>hasta utilizar el comando /menu on</B>\nPara cambiar un atajo de teclado, debes seleccionar su casilla y presionar las teclas deseadas o <J>ESC</J> para resetear",
               "SD0":"Delay para nacer",
               "SE0":"Ajustes",
               "SM0":"Modo suave",
               "QD0":"Muerte rápida",
               "WA0":"Alineación",
               "WT0":"esperando"
            },
            "pt":{
               "AL0":"Centro",
               "AL1":"Inferior",
               "AL2":"Inferior esquerdo",
               "AL3":"Inferior direito",
               "AL4":"Esquerdo",
               "AL5":"Direito",
               "AL6":"Superior",
               "AL7":"Superior esquerdo",
               "AL8":"Superior direito",
               "AP0":"Jogadores sendo copiados",
               "AP1":"Nenhum jogador sendo copiado",
               "AP2":"Não é possível copiar a si mesmo",
               "AP3":"Não é possível gravar, não há jogador sendo copiado. Use o comando <V>/stalk Player#tag</V> para copiar um jogador",
               "AP4":"Delay reduzido do Autoplay (ms):",
               "AP5":"Lista de mapas (expira em 5 minutos): ",
               "CA0":"Verificar anti-leve",
               "CFG0":"Configuração salva",
               "CL0":"<J>/xml -</J> Mostrar XML do mapa atual. Use <J>/xml auto</J> para ativar a exibição automática\n<J>/stalk [Player#tag] -</J> Inserir jogador na lista de jogadores copiados. Use <J>/stalk clear</J> para esvaziar a lista\n<J>/setmenu [x, y] -</J> Alterar as coordenadas do menu\n<J>/save | /saveconfig -</J> Salvar\n<J>/ajuda | /help | /commands | /comandos -</J> Mostrar lista de comandos\n<J>/rec [@code] -</J> Mostrar o menor tempo registrado do mapa. Categorias disponíveis: P3, P5, P6, P7, P9, P13, P17, P18, P19, V e WJ\n<J>/prev -</J> Voltar para o mapa anterior da docs P17 (#records). Use um número se quiser voltar mais de 1 mapa. Exemplo: <J>/prev 2</J>\n<J>/next -</J> Pular para o próximo mapa da docs P17 (#records). Use um número de quiser pular mais de 1 mapa. Exemplo: <J>/next 2</J>\n<J>/mapindex -</J> Ver qual posição da docs P17 está selecionada no sistema\n<J>/setindex [número]-</J> Selecionar uma posição da docs P17",
               "DA0":"Desativar animações",
               "DA1":"Parar com uma tecla de movimento (WASD/setas)",
               "DS0":"Desativar placar",
               "DI0":"Morrer quando alguém entrar na toca",
               "ERR0":"falhou",
               "ERR1":"falhou (token expirado)",
               "ERR2":"Lista indisponível",
               "ERR3":"Mapa não registrado",
               "ERR4":"Versão desatualizada",
               "ERR5":"indisponível temporariamente",
               "GE0":"Geral",
               "HO0":"Esconder objetos",
               "HP0":"Esconder jogadores",
               "IDLE0":"ausente",
               "JD0":"Delay reduzido do pulo",
               "JH0":"Altura do pulo",
               "LD0":"carregando",
               "LP0":"Ping baixo",
               "LS0":"Lista de mapas",
               "LS1":"Lista de comandos",
               "LS2":"Lista de soft",
               "MS0":"Velocidade de movimento",
               "ND0":"Sem delay",
               "OM0":"Abrir menu",
               "REC0":"gravando",
               "REC1":"melhor tempo » ",
               "REC2":"Nenhum registro",
               "REC3":"Mapa não registrado",
               "RI0":"Não foi possível salvar, o mapa está invertido",
               "RI1":"invertido",
               "RK0":"Resetar tudo",
               "RM0":"Reduzir massa em %",
               "SC0":"Salvar",
               "SC1":"Teclas de atalho",
               "SC2":"Usar teclas de atalho",
               "SC3":"Ao desativar uma tecla de atalho, você só poderá usar sua função manualmente (clicando). Se a opção <J>\"Abrir menu\"</J> estiver desativada, não será mais possível abrir o menu depois que estiver fechado <B>até que use o comando /menu on</B>\nPara mudar uma tecla de atalho, selecione sua caixa e pressione as teclas desejadas ou <J>ESC</J> para resetar",
               "SD0":"Delay para nascer",
               "SE0":"Configuração",
               "SM0":"Modo suave",
               "QD0":"Morte rápida",
               "WA0":"Alinhamento",
               "WT0":"esperando"
            }
         };
         var _loc1_:* = new URLLoader();
         _loc1_.addEventListener(Event.COMPLETE,this.keys_loaded);
         _loc1_.load(new URLRequest(this.main_instance.host_url + "get_keys?access_token=" + this.main_instance.access_token + "&flash_token=" + this.main_instance.tfmdisney.data.flash_token + "&d=" + new Date().time));
      }
      
      public function parse_classes() : void
      {
         var _loc1_:* = undefined;
         for(_loc1_ in this)
         {
            if(_loc1_.indexOf("class_name") > -1)
            {
               this[_loc1_.replace("class_name","class")] = this.get_class(this[_loc1_]);
            }
         }
      }
      
      private function get_class(param1:String) : Class
      {
         if(param1)
         {
            try
            {
               return this.app_domain.applicationDomain.getDefinition(param1) as Class;
            }
            catch(e:Error)
            {
            }
         }
         return null;
      }
      
      public function translate(param1:String) : String
      {
         var _loc2_:* = !!this.locales[Capabilities.language] ? Capabilities.language : "en";
         var _loc3_:* = this.locales[_loc2_][param1] || this.locales["en"][param1];
         return _loc3_ || param1;
      }
      
      private function keys_loaded(param1:Event) : void
      {
         var _loc15_:ByteArray = null;
         var _loc16_:Object = null;
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = undefined;
         var _loc12_:* = NaN;
         var _loc13_:* = null;
         var _loc14_:*;
         if((_loc14_ = JSONE.decode(param1.target.data))["error"])
         {
            this.main_instance.invalid(_loc14_["error"]);
         }
         else if(_loc14_["keys"])
         {
            (_loc15_ = Base64.decodeToByteArray(_loc14_["keys"])).uncompress("zlib");
            _loc16_ = JSONE.decode(_loc15_.readUTFBytes(_loc15_.length));
            for(_loc2_ in _loc16_)
            {
               _loc7_ = _loc16_[_loc2_] || "";
               _loc8_ = "";
               _loc10_ = (_loc9_ = /./g).exec(_loc7_);
               while(_loc10_ != null)
               {
                  _loc12_ = Number(_loc10_) || _loc10_.toString().charCodeAt();
                  _loc8_ += String.fromCharCode(_loc12_);
                  _loc10_ = _loc9_.exec(_loc7_);
               }
               _loc11_ = _loc8_ || _loc7_;
               if(_loc2_ == "premium_level")
               {
                  this.main_instance.premium_level = _loc11_;
               }
               else if(_loc2_ == "discord")
               {
                  this[_loc2_] = _loc16_[_loc2_];
               }
               else if(_loc2_ == "maps_allowed")
               {
                  this.main_instance.maps_allowed = _loc16_[_loc2_];
               }
               else if(_loc2_ == "client_version")
               {
                  this.main_instance.outdated = this.main_instance.version != _loc7_;
               }
               else
               {
                  this[_loc2_] = _loc11_;
               }
            }
            this.main_instance.load_swf();
            this.main_instance.is_premium = !!this.main_instance.premium_level ? this.main_instance.premium_level != "FREE" : false;
            _loc3_ = new URLLoader();
            _loc3_.addEventListener(ProgressEvent.PROGRESS,this.maps_loading);
            _loc3_.addEventListener(Event.COMPLETE,this.maps_loaded);
            _loc3_.load(new URLRequest(this.main_instance.host_url + "mapstorage?access_token=" + this.main_instance.access_token + "&flash_token=" + this.main_instance.tfmdisney.data.flash_token + "&d=" + new Date().time));
            (_loc4_ = new URLLoader()).addEventListener(Event.COMPLETE,this.protected_loaded);
            _loc4_.load(new URLRequest(this.main_instance.host_url + "data?access_token=" + this.main_instance.access_token + "&flash_token=" + this.main_instance.tfmdisney.data.flash_token + "&d=" + new Date().time + "&protected"));
            if(this.main_instance.premium_level == "PLATINUM")
            {
               (_loc13_ = new URLLoader()).addEventListener(ProgressEvent.PROGRESS,this.soft_loading);
               _loc13_.addEventListener(Event.COMPLETE,this.soft_loaded);
               _loc13_.load(new URLRequest(this.main_instance.host_url + "data?access_token=" + this.main_instance.access_token + "&flash_token=" + this.main_instance.tfmdisney.data.flash_token + "&d=" + new Date().time + "&soft"));
            }
            (_loc5_ = new URLLoader()).addEventListener(Event.COMPLETE,this.config_loaded);
            _loc5_.load(new URLRequest(this.main_instance.host_url + "data?access_token=" + this.main_instance.access_token + "&flash_token=" + this.main_instance.tfmdisney.data.flash_token + "&d=" + new Date().time + "&config"));
            (_loc6_ = new URLLoader()).addEventListener(Event.COMPLETE,this.record_list_loaded);
            _loc6_.load(new URLRequest(this.main_instance.host_url + "data?access_token=" + this.main_instance.access_token + "&flash_token=" + this.main_instance.tfmdisney.data.flash_token + "&d=" + new Date().time + "&record_list"));
         }
      }
      
      private function config_loaded(param1:Event) : void
      {
         var _loc2_:* = undefined;
         try
         {
            _loc2_ = JSONE.decode(param1.target.data);
            Interface.config = _loc2_;
            if(Interface.config.open_menu)
            {
               this.open_menu_sc = !!Interface.config.open_menu.using_shortcut ? String(Interface.config.open_menu.shortcut) : null;
            }
            if(this.main_instance.Interface)
            {
               this.main_instance.Interface.load_config();
            }
         }
         catch(error:Error)
         {
         }
      }
      
      private function record_list_loaded(param1:Event) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = undefined;
         var _loc5_:* = null;
         try
         {
            _loc2_ = Base64.decodeToByteArray(param1.target.data);
            _loc2_.uncompress("zlib");
            _loc3_ = _loc2_.readUTFBytes(_loc2_.length);
            this.main_instance.record_list = JSONE.decode(_loc3_);
            for(_loc4_ in this.main_instance.record_list["new"])
            {
               if((_loc5_ = _loc_7[_loc4_]).cat == "P17")
               {
                  this.main_instance.p17_maps_list.push(_loc4_);
               }
            }
         }
         catch(e:Error)
         {
         }
      }
      
      private function maps_loading(param1:ProgressEvent) : void
      {
         var _loc2_:* = 0;
         var _loc3_:* = 0;
         if(this.main_instance.Interface && this.main_instance.Interface.auto_play_check_box && Boolean(this.text_field2))
         {
            _loc2_ = param1.bytesLoaded;
            _loc3_ = param1.bytesTotal;
            this.main_instance.Interface.auto_play_check_box[this.text_field2].text = "Autoplay (" + this.translate("LD0") + "... " + Math.round(Number(_loc2_ / _loc3_) * 100) + "%)";
         }
      }
      
      private function locales_loaded(param1:Event) : void
      {
         var _loc2_:* = undefined;
         var _loc3_:* = JSONE.decode(param1.target.data);
         for(_loc2_ in _loc3_)
         {
            this.locales[_loc2_] = _loc3_[_loc2_];
         }
      }
      
      private function maps_loaded(param1:Event) : void
      {
         param1.target.removeEventListener(ProgressEvent.PROGRESS,this.maps_loading);
         var _loc2_:* = Base64.decodeToByteArray(param1.target.data);
         _loc2_.uncompress("zlib");
         var _loc3_:* = _loc2_.readUTFBytes(_loc2_.length);
         var _loc4_:*;
         if((_loc4_ = this.decode_data(_loc3_)).arr)
         {
            this.maps = _loc4_.arr;
            this.maps_len = _loc4_.len;
            if(this.main_instance.Interface && this.main_instance.Interface.auto_play_check_box && Boolean(this.text_field2))
            {
               this.main_instance.Interface.update_ap_text();
            }
         }
         else if(this.main_instance.Interface && this.main_instance.Interface.auto_play_check_box && Boolean(this.text_field2))
         {
            this.main_instance.Interface.auto_play_check_box[this.text_field2].text = "Autoplay";
         }
      }
      
      private function soft_loading(param1:ProgressEvent) : void
      {
         var _loc2_:* = 0;
         var _loc3_:* = 0;
         if(this.main_instance.Interface && this.main_instance.Interface.soft_check_box && Boolean(this.text_field2))
         {
            _loc2_ = param1.bytesLoaded;
            _loc3_ = param1.bytesTotal;
            this.main_instance.Interface.soft_check_box[this.text_field2].text = this.translate("SM0") + " (" + this.translate("LD0") + "... " + Math.round(Number(_loc2_ / _loc3_) * 100) + "%)";
         }
      }
      
      private function soft_loaded(param1:Event) : void
      {
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         var _loc4_:* = undefined;
         _loc2_ = undefined;
         _loc3_ = undefined;
         param1.target.removeEventListener(ProgressEvent.PROGRESS,this.soft_loading);
         try
         {
            _loc2_ = Base64.decodeToByteArray(param1.target.data);
            _loc2_.uncompress("zlib");
            _loc3_ = _loc2_.readUTFBytes(_loc2_.length);
            _loc4_ = JSONE.decode(_loc3_);
            this.main_instance.soft_list = _loc4_;
            for(_loc3_ in _loc4_)
            {
               ++this.soft_len;
            }
            if(this.main_instance.Interface && this.main_instance.Interface.soft_check_box && Boolean(this.text_field2))
            {
               this.main_instance.Interface.soft_check_box[this.text_field2].text = this.translate("SM0") + " (" + this.soft_len + ") [F4]";
            }
         }
         catch(error:Error)
         {
         }
      }
      
      private function protected_loaded(param1:Event) : void
      {
         var _loc2_:* = Base64.decodeToByteArray(param1.target.data);
         _loc2_.uncompress("zlib");
         var _loc3_:* = _loc2_.readUTFBytes(_loc2_.length);
         this.main_instance.protected_maps = JSONE.decode(_loc3_);
      }
      
      private function decode_data(param1:String) : Object
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = 0;
         if(param1.indexOf("@") != -1 && param1.indexOf(":") != -1)
         {
            _loc2_ = new Array();
            _loc3_ = param1.split("#");
            while(_loc5_ < _loc3_.length)
            {
               if((_loc4_ = (_loc3_[_loc5_] as String).match(/(.*?):(.*)/)) != null)
               {
                  _loc2_[_loc4_[1]] = _loc4_[2];
               }
               _loc5_ += 1;
            }
         }
         return {
            "arr":_loc2_,
            "len":_loc5_
         };
      }
   }
}
