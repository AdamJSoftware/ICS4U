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
	import flash.display.Shader;
	import flash.system.System;
	import flash.display.MovieClip;
	import flash.text.TextFieldAutoSize;
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.display.Loader;
	import flash.geom.Point;

	public class Main extends Sprite {

		public function Main():void
		{
			// Création de deux formats de texte différents
			var setupArray:Array = new Array();
			
			setDisplay();



			//Créer une variable de chargement pour ajouter une image et configurer ses propriétés
			
			//Ajouter un écouteur à la variable loader qui est lié à la 'fonction calcule monnaie'

		}


		private function ai_func(setupArray:Array):void{
			var x_tour:TextField = setupArray[3][0];
			var o_tour:TextField = setupArray[3][1];
			// var space:Loader = setupArray[4][i];
			var spacex:Array = setupArray[5][0];
			var spacey:Array = setupArray[5][1];
			var xSpaces:Array = setupArray[6][0];
			var oSpaces:Array = setupArray[6][1];
			var xselectedArray:Array = setupArray[7][0];
			var oselectedArray:Array = setupArray[7][1];
			var clickableArray:Array = setupArray[8];
			var titleArray:Array = setupArray[2];
			var points:Array = setupArray[9];
			var showPoints:Array = setupArray[10];
			var myTextFormat:TextFormat = new TextFormat();
			var ai_Text = setupArray[11][0];
			var ai_status = setupArray[11][1];
			var number_array:Array = new Array(0,1,2,3,4,5,6,7,8);
			// var all_selected:Array = setupArray[7][0].splice(0, 1); 
			var all_selected:Array = new Array();

			// trace("SETUP ARRAY: " + setupArray[7][0][1])
			for(var m:Number=0; m<setupArray[7][0][1].length; m++){
				// trace("ADDING: "+setupArray[7][0][1][m])
				all_selected.push(setupArray[7][0][1][m])
			}
			// for(var m:Number=0; m<setupArray[7][1].length-1; m++){
			// 	all_selected.push(setupArray[7][1][m+1])
			// }
			// trace("SETUPARRAY:" + setupArray[7][0])
			// all_selected.concat(setupArray[7][0]);
			// trace("ALL_SELECTED: " + all_selected[0])
			for (var i:Number=0; i<number_array.length; i++){
				var already_selected:Boolean = false;
				for(var j:Number=0; j<all_selected.length; j++){
					// trace("NUMBER ARRAY: " + number_array[i]);
					// trace("ALL SELECTED: " + all_selected[j]);
					if(number_array[i] == all_selected[j]){
						// trace("SELECTING: " + all_selected[j])
						already_selected = true;
					}
				}
				var a:Number = Math.floor( Math.random() * 2 )
				if (a == 1){
					if (already_selected == false){
					var newO:TextField = new TextField();
					setupArray[4][i].load(new URLRequest('files\\blackO.png'));
					addChild(newO);
					oSpaces.push(i);
					oselectedArray[0].push();
					oselectedArray[1].push(i);

					var status:Boolean = checkWinning(oSpaces, oselectedArray, "files\\greenO.png", setupArray, i, showPoints[1]);

					if (status){
					}
					return;
				}

				}
				if(already_selected == false){
var last_Number:Number = i;
				}

			}
			if (!isNaN(last_Number)){
				trace("LAST_NUMBER: " + last_Number)
			var newO:TextField = new TextField();
					setupArray[4][last_Number].load(new URLRequest('files\\blackO.png'));
					addChild(newO);
					oSpaces.push(last_Number);
					oselectedArray[0].push();
					oselectedArray[1].push(last_Number);

					var status:Boolean = checkWinning(oSpaces, oselectedArray, "files\\greenO.png", setupArray, last_Number, showPoints[1]);

					if (status){
						trace('O WON')
					}
					return;
			}




		}


		private function test(setupArray:Array, i:Number):void{
			var x_tour:TextField = setupArray[3][0];
			var o_tour:TextField = setupArray[3][1];
			var space:Loader = setupArray[4][i];
			var spacex:Array = setupArray[5][0];
			var spacey:Array = setupArray[5][1];
			var xSpaces:Array = setupArray[6][0];
			var oSpaces:Array = setupArray[6][1];
			var xselectedArray:Array = setupArray[7][0];
			var oselectedArray:Array = setupArray[7][1];
			var clickableArray:Array = setupArray[8];
			var titleArray:Array = setupArray[2];
			var points:Array = setupArray[9];
			var showPoints:Array = setupArray[10];
			var myTextFormat:TextFormat = new TextFormat();
			var ai_Text = setupArray[11][0];
			var ai_status = setupArray[11][1];
			myTextFormat.size = 70;
			myTextFormat.color = 0x000000;

if (clickableArray[i]){
				clickableArray[i] = false;
if (x_tour.textColor == 65280){
				space.load(new URLRequest('files\\blackX.png'));
				xSpaces.push(i);
				xselectedArray[0].push();
				xselectedArray[1].push(i);
				var status:Boolean = checkWinning(xSpaces, xselectedArray, "files\\greenX.png", setupArray, i, showPoints[0]);

				if (status){
					resetDisplay(setupArray);
					var x_color:int = x_tour.textColor;
					var o_color:int = o_tour.textColor;

					x_tour.textColor = o_color;
					o_tour.textColor = x_color;
					return;
					// var setupArray:Array = new Array();
					// setupArray = setDisplay();
					// listeners(setupArray);
				}
				if (ai_status){
					ai_func(setupArray);
				}
				else{
					var x_color:int = x_tour.textColor;
					var o_color:int = o_tour.textColor;

					x_tour.textColor = o_color;
					o_tour.textColor = x_color;
				}

			}
			else{
				var newO:TextField = new TextField();
				space.load(new URLRequest('files\\blackO.png'));
				addChild(newO);
				oSpaces.push(i);
				oselectedArray[0].push();
				oselectedArray[1].push(i);

				var status:Boolean = checkWinning(oSpaces, oselectedArray, "files\\greenO.png", setupArray, i, showPoints[1]);

				if (status){
					trace('O WON')
				}
				if (!ai_status){
					trace("Switching color")
					var x_color:int = x_tour.textColor;
					var o_color:int = o_tour.textColor;

					x_tour.textColor = o_color;
					o_tour.textColor = x_color;
				}
			}



			}

			
			
			// trace(xSpaces);


		}


		private function checkWinning(spaces:Array, selectedArray:Array, path:String, setupArray:Array, i:Number, points:TextField):Boolean{

			
			// setupArray[4][i].removeEventListener(MouseEvent.CLICK, test(setupArray, i));
			var config1:Array = new Array(0,1,2);
			var config2:Array = new Array(3,4,5);
			var config3:Array = new Array(6,7,8);
			var config4:Array = new Array(0,3,6);
			var config5:Array = new Array(1,4,7);
			var config6:Array = new Array(2,5,8);
			var config7:Array = new Array(0,4,8);
			var config8:Array = new Array(2,4,6);


			var winningConfigs:Array = new Array(config1, config2, config3, config4, config5, config6, config7, config8);

			for(var p:Number = 0; p<winningConfigs.length; p++){
				var totalpoints:Number = 0;
				for(var i:Number = 0; i<spaces.length; i++){
					if(spaces[i] == winningConfigs[p][0] || spaces[i] == winningConfigs[p][1] || spaces[i] == winningConfigs[p][2]){
						totalpoints++;
					}
					if (totalpoints == 3){
						for (var h:Number = 0; h<winningConfigs[p].length; h++){
							for (var j:Number = 0; j<selectedArray[1].length; j++){
								trace(winningConfigs[h]);
								trace(selectedArray[1])
								if (winningConfigs[p][h] == selectedArray[1][j]){
									setupArray[4][selectedArray[1][j]].load(new URLRequest(path));
									trace(path);
									
									// setupArray[4][selectedArray[1][j]].removeEventListener();
								}
							}
						}
						// textArray[winningConfigs[p][0]].textColor = 0x00FF00;
						// textArray[winningConfigs[p][1]].textColor = 0x00FF00;
						// textArray[winningConfigs[p][2]].textColor = 0x00FF00;
					points.text = String(Number(points.text) + 1);
					return true;
					}

				}
			}
			return false;
		}
		

		private function resetDisplay(setupArray:Array):void{
			for(var i:Number = 0; i<setupArray[8].length; i++){
				setupArray[8][i]=false;
			}
			

		}

		private function resetEverything(setupArray:Array):void{
			roundReset(setupArray);
		}


		private function roundSetup(rectArray: Array, formatArray:Array, titleArray:Array, turnArray:Array, spaceArray:Array, spacex:Array, spacey:Array, clickableArray:Array, points:Array, showPoints:Array, AIArray:Array):void{
			var blank:String = "files\\blank.png"

			for (var i:Number=0; i<spaceArray.length; i++){
				spaceArray[i] = imageLoader(blank, spacex[i], spacey[i]);
				addChild(spaceArray[i]);
			}


			var spacexy:Array = new Array(spacex, spacey);


			var xSpaces:Array = new Array();
			var oSpaces:Array = new Array();

			var xoSpaces:Array = new Array(xSpaces, oSpaces);

			var textArray:Array = new Array();
			var positionArray:Array = new Array();

			var xselectedArray:Array = new Array(textArray, positionArray);
			var oselectedArray:Array = new Array(textArray, positionArray);

			var selectedArray:Array = new Array(xselectedArray, oselectedArray);

			var setupArray:Array = new Array();
			setupArray.push(rectArray, formatArray, titleArray, turnArray, spaceArray, spacexy, xoSpaces, selectedArray, clickableArray, points, showPoints, AIArray)
			setupArray[4][0].addEventListener(MouseEvent.CLICK, function(e: Event):void{test(setupArray, 0)});
			setupArray[4][1].addEventListener(MouseEvent.CLICK, function(e: Event):void{test(setupArray, 1)});
			setupArray[4][2].addEventListener(MouseEvent.CLICK, function(e: Event):void{test(setupArray, 2)});
			setupArray[4][3].addEventListener(MouseEvent.CLICK, function(e: Event):void{test(setupArray, 3)});
			setupArray[4][4].addEventListener(MouseEvent.CLICK, function(e: Event):void{test(setupArray, 4)});
			setupArray[4][5].addEventListener(MouseEvent.CLICK, function(e: Event):void{test(setupArray, 5)});
			setupArray[4][6].addEventListener(MouseEvent.CLICK, function(e: Event):void{test(setupArray, 6)});
			setupArray[4][7].addEventListener(MouseEvent.CLICK, function(e: Event):void{test(setupArray, 7)});
			setupArray[4][8].addEventListener(MouseEvent.CLICK, function(e: Event):void{test(setupArray, 8)});
			setupArray[2][1].addEventListener(MouseEvent.CLICK, function(e: Event):void{resetEverything(setupArray)});
			setupArray[11][0].addEventListener(MouseEvent.CLICK, function(e: Event):void{setupArray[11][1] = true; trace('AI ON')});

			setupArray[3][0].textColor = 0x00FF00;
		}

		private function roundReset(setupArray:Array):void{
			trace("Running reset")
			var blank:String = "files\\blank.png"

			for (var i:Number=0; i<setupArray[4].length; i++){
				setupArray[4][i].load(new URLRequest(blank));
			}

			setupArray[6][0].splice(0);
			setupArray[6][1].splice(0);

			setupArray[7][0][0].splice(0);
			setupArray[7][0][1].splice(0);
			setupArray[7][1][0].splice(0);
			setupArray[7][1][1].splice(0);

			for(var i:Number=0; i<setupArray[8].length; i++){
				setupArray[8][i] = true;
			}

			setupArray[3][0].textColor = 0x00FF00;
			setupArray[3][1].textColor = 0x000000;
		}


		private function setDisplay():void{
			
			var rect1:MovieClip = new MovieClip();
			rect1.graphics.beginFill(0xFF0000);
			rect1.graphics.drawRect(160, 40, 10, 280);
			rect1.graphics.endFill();
			// rect1.x = 10;
			// rect1.y = 10;
			addChild(rect1);

			var rect2:MovieClip = new MovieClip();
			rect2.graphics.beginFill(0xFF0000);
			rect2.graphics.drawRect(320, 40, 10, 280);
			rect2.graphics.endFill();
			// rect2.x = 10;
			// rect2.y = 10;
			addChild(rect2);

			var rect3:MovieClip = new MovieClip();
			rect3.graphics.beginFill(0xFF0000);
			rect3.graphics.drawRect(50, 120, 360, 10);
			rect3.graphics.endFill();
			// rect3.x = 10;
			// rect3.y = 10;
			addChild(rect3);

			var rect4:MovieClip = new MovieClip();
			rect4.graphics.beginFill(0xFF0000);
			rect4.graphics.drawRect(50, 230, 360, 10);
			rect4.graphics.endFill();
			// rect3.x = 10;
			// rect3.y = 10;
			addChild(rect4);

			var rectArray:Array = new Array();

			rectArray.push(rect1, rect2, rect3, rect4);



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

			var formatArray:Array = new Array();

			formatArray.push(myFormat, myFormat3, myFormat4);
			// Ajout du titre et configuration de toutes ses propriétés à l'aide d'une fonction personnalisée
			var lblTitre:TextField = createCustomTextField(140, 0, 250, 40, "TIC TAC TOE", myFormat4);
			// Configuration d'autres paramètres
			lblTitre.textColor = 0xFF0000;
			lblTitre.border = false;
			lblTitre.setTextFormat(myFormat4);
			addChild(lblTitre);


			var restart:TextField = createCustomTextField(120, 330, 250, 40, "RECOMMENCER", myFormat4);
			// Configuration d'autres paramètres
			restart.textColor = 0xFF0000;
			restart.border = true;
			restart.setTextFormat(myFormat4);
			addChild(restart);

			var ai_text:TextField = createCustomTextField(450, 150, 30, 40, "AI", myFormat4);
			// Configuration d'autres paramètres
			// ai_text.textColor = 0xFF0000;
			ai_text.border = true;
			ai_text.setTextFormat(myFormat4);
			addChild(ai_text);


			var titleArray:Array = new Array();
			titleArray.push(lblTitre, restart);

			var x_tour:TextField = createCustomTextField(40, 0, 300, 40, "X", myFormat3);
			// Configuration d'autres paramètres
			x_tour.textColor = 0xFF0000;
			x_tour.border = false;
			x_tour.setTextFormat(myFormat4);
			addChild(x_tour);

			var o_tour:TextField = createCustomTextField(460, 0, 300, 40, "O", myFormat3);
			// Configuration d'autres paramètres
			o_tour.textColor = 0xFF0000;
			o_tour.border = false;
			o_tour.setTextFormat(myFormat4);
			addChild(o_tour);

			var x_points:TextField = createCustomTextField(40, 30, 300, 40, "0", myFormat3);
			// Configuration d'autres paramètres
			o_tour.textColor = 0xFF0000;
			o_tour.border = false;
			o_tour.setTextFormat(myFormat4);
			addChild(x_points);

			var o_points:TextField = createCustomTextField(460, 30, 300, 40, "0", myFormat3);
			// Configuration d'autres paramètres
			o_tour.textColor = 0xFF0000;
			o_tour.border = false;
			o_tour.setTextFormat(myFormat4);
			addChild(o_points);

			var turnArray:Array = new Array();

			var AIArray:Array = new Array(ai_text, false);

			var showPoints:Array = new Array(x_points, o_points);

			turnArray.push(x_tour, o_tour);

			
			// x1y1.addEventListener(MouseEvent.CLICK, function(e: Event):void{test()});
			var x1y1:Loader;
			var x2y1:Loader;
			var x3y1:Loader;
			var x1y2:Loader;
			var x2y2:Loader;
			var x3y2:Loader;
			var x1y3:Loader;
			var x2y3:Loader;
			var x3y3:Loader;

			var clickableArray:Array = new Array();



			var spaceArray:Array = new Array(x1y1, x2y1, x3y1, x1y2, x2y2, x3y2, x1y3, x2y3, x3y3);

			for(var i:Number=0; i<spaceArray.length; i++){
				clickableArray.push(true);
			}

			var spacex:Array = new Array(70, 200, 340, 70, 200, 340, 70, 200, 340);
			var spacey:Array = new Array(40, 40, 40, 135, 135, 135, 240, 240, 240);
			var points:Array = new Array(0,0);


			roundSetup(rectArray, formatArray, titleArray, turnArray, spaceArray, spacex, spacey, clickableArray, points, showPoints, AIArray)

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

		private function imageLoader(path:String, x:Number, y:Number):Loader{
			var myLoader:Loader = new Loader();
			myLoader.scaleX = 0.4;
			myLoader.scaleY = 0.4;
			myLoader.y= y;
			myLoader.x = x;
			myLoader.load(new URLRequest(path));
			return myLoader;
		}
	}
}