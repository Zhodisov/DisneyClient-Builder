package ChargeurTransformice_fla
{
   import flash.display.*;
   import flash.text.TextField;
   
   public dynamic class Timeline_5 extends MovieClip
   {
       
      
      public var Fromage:Boolean;
      
      public var textField:TextField;
      
      public function Timeline_5()
      {
         super();
         addFrameScript(0,this.frame1);
         textField = new TextField();
         textField.text = "Bonjour le monde!";
         textField.x = 100;
         textField.y = 100;
         this.addChild(textField);
      }
      
      internal function frame1() : *
      {
         this.Fromage = true;
      }
   }
}
