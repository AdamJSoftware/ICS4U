/* 	Nom du programmeur: Adam Jasniewicz
	Date: Le 18 septembre 2019
	Nom du fichier:  Main.as
	Description:  Ce programme calcule la monnaie pour n’importe quelle valeur monétaire
*/

   
   
package {
	//importer toutes les dépendances
	import flash.display.*;
	import flash.text.*;
	import flash.events.MouseEvent;
	import flash.net.URLRequest;
	import flash.text.TextField;
	import flash.events.Event;
	import flash.text.TextFormatAlign;
	import flash.text.TextFormat;

	public class Main extends Sprite {

		public function Main():void
		{
			// Création de deux formats de texte différents
			var myFormat:TextFormat = new TextFormat();	
			myFormat.size = 20;
			myFormat.align = TextFormatAlign.JUSTIFY;
			myFormat.font = "Arial"
			var myFormat2:TextFormat = new TextFormat();	
			myFormat2.size = 20;
			myFormat2.align = TextFormatAlign.CENTER;
			myFormat.font = "Arial"

			// Ajout du titre et configuration de toutes ses propriétés à l'aide d'une fonction personnalisée
			var lblTitre:TextField = createCustomTextField(130, 0, 250, 40, "Menue Monnaie", myFormat);
			// Configuration d'autres paramètres
			lblTitre.textColor = 0xFF0000;
			lblTitre.border = false;
			lblTitre.setTextFormat(myFormat2);
			addChild(lblTitre);

			// Ajout d'un 'input field' et configuration de toutes ses propriétés à l'aide d'une fonction personnalisée
			var inputNombre:TextField = createCustomInputField()
			// Configuration d'autres paramètres
			inputNombre.y = 80;
			inputNombre.x = 260;
			inputNombre.defaultTextFormat = myFormat;
        	addChild(inputNombre);

			// Ajout d<un  sous-titre et configuration de toutes ses propriétés à l'aide d'une fonction personnalisée
			var Text1:TextField = createCustomTextField(0, 85, 260, 100, "Inscrire un montant (xxx.xx):", myFormat);
			addChild(Text1)

			//Ajouter un bloc de texte de résultat et configurer ses propriétés avec une fonction personnalisée
			var Result:TextField = createCustomTextField(0, 150, 499, 200, "Montant à transformer en monnaie:", myFormat);
			// Configuration d'autres paramètres
			Result.background = true;
			Result.backgroundColor = 0xD3D3D3;
			Result.border = true;
			Result.borderColor = 000000;
			addChild(Result);

			//Créer une variable de chargement pour ajouter une image et configurer ses propriétés
			var myLoader:Loader = new Loader();
			myLoader.scaleX = .05;
			myLoader.scaleY = .05;
			myLoader.y= 80;
			myLoader.x = 370;
			myLoader.load(new URLRequest('files\\button.png'));
			addChild(myLoader);
			
			//Ajouter un écouteur à la variable loader qui est lié à la 'fonction calcule monnaie'
			myLoader.addEventListener(MouseEvent.CLICK, function(e: Event):void{calculeMonnaie(inputNombre, Result)})

		}


		
		private function calculeMonnaie(montant:TextField, Result:TextField):void {
			//Cette fonction saisit la valeur du champ de saisie. Calculer la quantité de changement qui sera donnée à l'aide des divisions et du module
			//Ensuite, le résultat est affiché dans la zone de texte du résultat.

			var somme:Number;
			var totalCents:int;
			var pieces2dollars:int = 0;
			var pieces1dollar:int=0;
			var pieces25Cents:int=0;
			var pieces10Cents:int=0;
			var pieces5Cents:int=0;
			var pieces1Cent:int=0;
			var restant:int=0;
			var nouvMessage:String;

			somme = Number(montant.text);
			totalCents = int(somme * 100);

			pieces2dollars = totalCents / 200;
			restant= totalCents % 200;

			pieces1dollar = restant / 100;
			restant= restant % 100;

			pieces25Cents = restant / 25;
			restant= restant % 25;

			pieces10Cents = restant  / 10;
			restant = restant % 10;

			pieces5Cents = restant / 5;
			restant = restant % 5;

			pieces1Cent = restant;
			

			nouvMessage =("Montant à transformer en monnaie: " + somme + "$" + 
						  "\n\n2 dollar: " + pieces2dollars +
						  "\n1 dollar: " + pieces1dollar +
						  "\n25 cents: " + pieces25Cents + 
						  "\n10 cents: " + pieces10Cents + 
						  "\n5 cents: " + pieces5Cents + 
						  "\n1 cent: " + pieces1Cent);

			Result.text=nouvMessage;

		}
		private function createCustomTextField(x:Number, y:Number, width:Number, height:Number, text:String, myFormat:TextFormat):TextField {
			//Cette fonction récupère une série de variables spécifiées par l'utilisateur et les définit comme une propriété de zone de texte pour économiser de l'espace.
            var result:TextField = new TextField();
			result.defaultTextFormat = myFormat;
            result.x = x; result.y = y;
			result.text = text;
            result.width = width; 
			result.height = height;

            return result;
        }
		private function createCustomInputField():TextField {
			//Cette fonction récupère une série de variables spécifiées par l'utilisateur et les définit comme une propriété de zone de texte (input) pour économiser de l'espace.
            var result:TextField = new TextField();
            result.type = TextFieldType.INPUT;
        	result.border = true;
        	result.width = 100;
        	result.height = 40;
        	result.borderColor=0x006666;
            return result;
        }
	}
}