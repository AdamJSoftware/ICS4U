/* 	Nom du programmeur: Adam Jasniewicz
	Date: Le 18 septembre 2019
	Nom du fichier:  Main.as
	Description:  Ce programme le temps total que quelq'un a dormis
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
	import flash.globalization.DateTimeFormatter;

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
			var lblTitre:TextField = createCustomTextField(130, 0, 300, 30, "Manege - montagnes russes", myFormat);
			// Configuration d'autres paramètres
			lblTitre.textColor = 0xFF0000;
			lblTitre.border = false;
			lblTitre.setTextFormat(myFormat2);
			addChild(lblTitre);

			// Ajout d'un 'input field' et configuration de toutes ses propriétés à l'aide d'une fonction personnalisée
			var inputJour:TextField = createCustomInputField(260, 80, myFormat)
			inputJour.border = true;
        	addChild(inputJour);

			// Ajout d'un 'input field' et configuration de toutes ses propriétés à l'aide d'une fonction personnalisée
			var inputMois:TextField = createCustomInputField(260, 120, myFormat)
        	addChild(inputMois);

			// Ajout d'un 'input field' et configuration de toutes ses propriétés à l'aide d'une fonction personnalisée
			var inputAnnee:TextField = createCustomInputField(260, 160, myFormat)
        	addChild(inputAnnee);

			// Ajout d<un  sous-titre et configuration de toutes ses propriétés à l'aide d'une fonction personnalisée
			var Text1:TextField = createCustomTextField(0, 40, 300, 30, "Inscrire les renseignements relatifs au passager", myFormat);
			addChild(Text1)
			
			// Ajout d<un  sous-titre et configuration de toutes ses propriétés à l'aide d'une fonction personnalisée
			var hauteurText:TextField = createCustomTextField(0, 80, 250, 30, "Hauteur (cm)", myFormat);
			addChild(hauteurText)

			// Ajout d<un  sous-titre et configuration de toutes ses propriétés à l'aide d'une fonction personnalisée
			var dosText:TextField = createCustomTextField(0, 120, 250, 30, "Maux de dos? (O/N)", myFormat);
			addChild(dosText)

			// Ajout d<un  sous-titre et configuration de toutes ses propriétés à l'aide d'une fonction personnalisée
			var cardiqueText:TextField = createCustomTextField(0, 160, 250, 30, "Malaise cardiaque? (O/N)", myFormat);
			addChild(cardiqueText)

			//Ajouter un bloc de texte de résultat et configurer ses propriétés avec une fonction personnalisée
			var Result:TextField = createCustomTextField(0, 200, 499, 150, "Resultat:", myFormat);
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
			myLoader.y= 120;
			myLoader.x = 430;
			myLoader.load(new URLRequest('files\\button.png'));
			addChild(myLoader);
			
			//Ajouter un écouteur à la variable loader qui est lié à la 'fonction calcule monnaie'
			myLoader.addEventListener(MouseEvent.CLICK, function(e: Event):void{calcule(inputJour, inputMois, inputAnnee, Result)})

		}


		
		private function calcule(cm:TextField, dos_text:TextField, cardiaque_text:TextField, result:TextField):void {
			//Cette fonction saisit la valeur du champ de saisie. Calculer la quantité de changement qui sera donnée à l'aide des divisions et du module
			//Ensuite, le résultat est calcule (temps courent - temps donnee)  et apres affiché dans la zone de texte du résultat.

			//Calcule
			
			var hauteur:Number = Number(cm.text);
			var dos:String = dos_text.text;
			var cardiaque:String = cardiaque_text.text;

			if (122 <= hauteur && hauteur <= 188){
				if(dos == 'N' || dos == 'n'){
					if(cardiaque == 'N' || dos=='n'){
						result.text = 'Vous pouvez prendre place a bord. Bonne randonnee!';
						return;
					}
				}
			}
			result.text = "Desole! Ce n'est pas securitaire pour vous \nde prendre place a bord";

			


			// var df:Date = new Date();
			// var currentDate:Date = new Date(df.getFullYear(), df.getMonth(), df.getDate())
			// var df2:Date = new Date(annee.text, mois.text, jour.text);
			// var total:Number = Math.floor(currentDate.valueOf() - df2.valueOf());
			// trace(total/(24*60*+60*1000));
			// var totalDays:int = Math.floor(total/(24*60*+60*1000));
			// var totalHours:Number = total * 8;
			// //Ceci doit etre un nombre pour eviter un int overflow

			// //Affichage
			// var nouvMessage:String;
			// nouvMessage = "Tu es age de " + totalDays.toString() + " jours.\nTu as dormi " + totalHours.toString() + " heures depuis ta naissance.";
			// result.text=nouvMessage;

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