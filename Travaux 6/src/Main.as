/* 	Nom du programmeur: Adam Jasniewicz
	Date: Le 25 octobre 2019
	Nom du fichier:  Main.as
	Description:  Le programme calculent le resultats des exposants. Exposant négatif, nombre choisis -> 0. Exposant positif, 0 -> nombre choisis
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
			var myFormat3:TextFormat = new TextFormat();	
			myFormat3.size = 15;
			myFormat3.align = TextFormatAlign.JUSTIFY;
			myFormat3.font = "Arial"
			var myFormat4:TextFormat = new TextFormat();	
			myFormat4.size = 30;
			myFormat4.align = TextFormatAlign.JUSTIFY;
			myFormat4.font = "Arial"

			// Ajout du titre et configuration de toutes ses propriétés à l'aide d'une fonction personnalisée
			var lblTitre:TextField = createCustomTextField(140, 0, 300, 40, "PUISSANCES", myFormat4);
			// Configuration d'autres paramètres
			lblTitre.textColor = 0xFF0000;
			lblTitre.border = false;
			lblTitre.setTextFormat(myFormat4);
			addChild(lblTitre);

			// Ajout d'un 'input field' et configuration de toutes ses propriétés à l'aide d'une fonction personnalisée
			var inputJour:TextField = createCustomInputField(260, 50, myFormat)
			inputJour.border = true;
        	addChild(inputJour);

			// Ajout d'un 'input field' et configuration de toutes ses propriétés à l'aide d'une fonction personnalisée
			var inputMois:TextField = createCustomInputField(260, 100, myFormat)
        	addChild(inputMois);
			
			// Ajout d'un sous-titre et configuration de toutes ses propriétés à l'aide d'une fonction personnalisée
			var hauteurText:TextField = createCustomTextField(0, 50, 250, 30, "Inscrire la base: ", myFormat);
			addChild(hauteurText)

			// Ajout d'un sous-titre et configuration de toutes ses propriétés à l'aide d'une fonction personnalisée
			var dosText:TextField = createCustomTextField(0, 100, 250, 30, "Inscrire l'exponant: ", myFormat);
			addChild(dosText)

			//Ajouter d'un bloc de texte de résultat et configurer ses propriétés avec une fonction personnalisée
			var Result:TextField = createCustomTextField(0, 140, 499, 220, "Resultat:", myFormat3);
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
			myLoader.y= 75;
			myLoader.x = 430;
			myLoader.load(new URLRequest('files\\button.png'));
			addChild(myLoader);
			
			//Ajouter un écouteur à la variable loader qui est lié à la 'fonction calcule monnaie'
			myLoader.addEventListener(MouseEvent.CLICK, function(e: Event):void{calcule(inputJour, inputMois, Result)})

		}


		
		private function calcule(base:TextField, exposant:TextField, result:TextField):void {
			var base_num:Number = Number(base.text);
			//Variable integer cree, egale a la valeur determiner par l'utilisateur
			var exposant_num:Number = Number(exposant.text);
			//Variable integer cree, egale a la valeur determiner par l'utilisateur
			var result_text:String = "";
			//variable string qui est utilisée pour stocker tous les résultats et ensuite l'ajouter au texte du résultat
			if (exposant_num % 1 == 0 && !isNaN(base_num)){
				//vérifier si exposant est un entier et si la base est un nombre
				if (exposant_num > 0){
					//Si l'exposant est supérieur à 0. Créez une boucle for qui calculera l'exposant de 0 au nombre spécifié. A chaque fois, ajouter le résultat à la variable string
				for (var i:int=1;i<=exposant_num;i++){
				result_text = result_text + base_num + " exposant " + i + " = " + Math.pow(base_num, i) + "\n"
				}
			}
			if (exposant_num == 0){
				//Si l'exposant est 0. Calcule la puissance une foi set l'ajouter à la variable de string
				result_text = result_text + base_num + " exposant " + 0 + " = " + Math.pow(base_num, 0) + "\n"
			}
			if(exposant_num < 0){
				//Si le nombre d'exposants est inférieur à 0. Commencez par le nombre spécifié et comptez jusqu'à 0.
				for (i=exposant_num;i<=0;i++){
				result_text = result_text + base_num + " exposant " + i + " = " + Math.pow(base_num, i) + "\n"
				}			
			}
			}
			else{
				result_text = "L'exposant doit etre un integer et le base doit etre un nombre"
			}
			
			// Définir la zone de texte de résultat égale à la variable string spécifiée en premier
			result.text = result_text

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
		private function createCustomInputField(x:Number, y:Number, myFormat:TextFormat):TextField {
			//Cette fonction récupère une série de variables spécifiées par l'utilisateur et les définit comme une propriété de zone de texte (input) pour économiser de l'espace.
            var result:TextField = new TextField();
			result.x = x;
			result.y = y;
			result.defaultTextFormat = myFormat;
            result.type = TextFieldType.INPUT;
        	result.border = true;
        	result.width = 150;
        	result.height = 30;
        	result.borderColor=0x006666;
            return result;
        }
	}
}