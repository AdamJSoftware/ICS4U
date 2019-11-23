/* 	Nom du programmeur: Adam Jasniewicz
	Date: Le 25 Novembre 2019
	Nom du fichier:  Main.as
	Description:  Le programme permet l'utilisateur a jouer un jeu de tic-tac-toe contre un robot ou un autre joueur. Avec des fonction avancées comme un scoreboard.
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

		public
		function Main(): void {
			// initialise l'array principal qui transportera les informations d'une fonction à une autre

			// Les rectangles sont utilisés pour crééer le terrain de jeu
			var rect1: MovieClip = new MovieClip();
			rect1.graphics.beginFill(0xFF0000);
			rect1.graphics.drawRect(160, 40, 10, 280);
			rect1.graphics.endFill();
			addChild(rect1);

			var rect2: MovieClip = new MovieClip();
			rect2.graphics.beginFill(0xFF0000);
			rect2.graphics.drawRect(320, 40, 10, 280);
			rect2.graphics.endFill();

			addChild(rect2);

			var rect3: MovieClip = new MovieClip();
			rect3.graphics.beginFill(0xFF0000);
			rect3.graphics.drawRect(50, 120, 360, 10);
			rect3.graphics.endFill();
			addChild(rect3);

			var rect4: MovieClip = new MovieClip();
			rect4.graphics.beginFill(0xFF0000);
			rect4.graphics.drawRect(50, 230, 360, 10);
			rect4.graphics.endFill();
			addChild(rect4);

			var rectArray: Array = new Array();
			// Organise touts les rectangles dans un array
			rectArray.push(rect1, rect2, rect3, rect4);


			//Ceci crée tous les formats différents qui seront utilisés
			var myFormat: TextFormat = new TextFormat();
			myFormat.size = 20;
			myFormat.align = TextFormatAlign.JUSTIFY;
			myFormat.font = "Arial"

			var myFormat2: TextFormat = new TextFormat();
			myFormat.size = 25;
			myFormat.align = TextFormatAlign.JUSTIFY;
			myFormat.font = "Arial"

			var myFormat3: TextFormat = new TextFormat();
			myFormat3.size = 15;
			myFormat3.align = TextFormatAlign.JUSTIFY;
			myFormat3.font = "Arial"
			var myFormat4: TextFormat = new TextFormat();
			myFormat4.size = 30;
			myFormat4.align = TextFormatAlign.JUSTIFY;
			myFormat4.font = "Arial"

			var formatArray: Array = new Array();
			// Organise tous les formats différents dans un array
			formatArray.push(myFormat, myFormat3, myFormat4);

			// Ajout du titre et configuration de toutes ses propriétés à l'aide d'une fonction personnalisée
			var lblTitre: TextField = createCustomTextField(140, 0, 250, 40, "TIC TAC TOE", myFormat4);
			// Configuration d'autres paramètres
			lblTitre.textColor = 0xFF0000;
			lblTitre.border = false;
			lblTitre.setTextFormat(myFormat4);
			addChild(lblTitre);

			// Ajout du titre et configuration de toutes ses propriétés à l'aide d'une fonction personnalisée
			var restart: TextField = createCustomTextField(250, 330, 240, 30, "NOUVELLE RONDE", myFormat4);
			// Configuration d'autres paramètres
			restart.textColor = 0xFF0000;
			restart.border = true;
			restart.setTextFormat(myFormat);
			addChild(restart);

			// Ajout du titre et configuration de toutes ses propriétés à l'aide d'une fonction personnalisée
			var ai_text: TextField = createCustomTextField(450, 150, 30, 40, "AI", myFormat4);
			// Configuration d'autres paramètres
			ai_text.border = true;
			ai_text.setTextFormat(myFormat4);
			addChild(ai_text);

			// Ajout du titre et configuration de toutes ses propriétés à l'aide d'une fonction personnalisée
			var reset_text: TextField = createCustomTextField(32, 330, 205, 30, "RECOMMENCER", myFormat2);
			// Configuration d'autres paramètres
			reset_text.border = true;
			reset_text.setTextFormat(myFormat);
			addChild(reset_text);

			// Organise les titres primaires dans un array
			var titleArray: Array = new Array();
			titleArray.push(lblTitre, restart);

			// Ajout des sous titres pour laisser le joueur savoir si c'est le tour de X ou Y
			var x_tour: TextField = createCustomTextField(40, 0, 300, 40, "X", myFormat3);
			// Configuration d'autres paramètres
			x_tour.textColor = 0xFF0000;
			x_tour.border = false;
			x_tour.setTextFormat(myFormat4);
			addChild(x_tour);

			// Ajout des sous titres pour laisser le joueur savoir si c'est le tour de X ou Y
			var o_tour: TextField = createCustomTextField(460, 0, 300, 40, "O", myFormat3);
			// Configuration d'autres paramètres
			o_tour.textColor = 0xFF0000;
			o_tour.border = false;
			o_tour.setTextFormat(myFormat4);
			addChild(o_tour);

			// Ajout d'un tableau de bord
			var x_points: TextField = createCustomTextField(40, 30, 300, 40, "0", myFormat3);
			// Configuration d'autres paramètres
			o_tour.textColor = 0xFF0000;
			o_tour.border = false;
			o_tour.setTextFormat(myFormat4);
			addChild(x_points);

			// Ajout d'un tableau de bord
			var o_points: TextField = createCustomTextField(460, 30, 300, 40, "0", myFormat3);
			// Configuration d'autres paramètres
			o_tour.textColor = 0xFF0000;
			o_tour.border = false;
			o_tour.setTextFormat(myFormat4);
			addChild(o_points);

			// Organise le tour de joueur dans un array
			var turnArray: Array = new Array(x_tour, o_tour);

			// Organise le ai_status dans un array
			var AIArray: Array = new Array(ai_text, false);
			// Organise le scoreboard dans un array
			var showPoints: Array = new Array(x_points, o_points);


			var x1y1: Loader;
			var x2y1: Loader;
			var x3y1: Loader;
			var x1y2: Loader;
			var x2y2: Loader;
			var x3y2: Loader;
			var x1y3: Loader;
			var x2y3: Loader;
			var x3y3: Loader;

			var clickableArray: Array = new Array();


			// Organize chaque case dans un tableau
			var spaceArray: Array = new Array(x1y1, x2y1, x3y1, x1y2, x2y2, x3y2, x1y3, x2y3, x3y3);

			//Laisse chaque case être cliqué
			for (var i: Number = 0; i < spaceArray.length; i++) {
				clickableArray.push(true);
			}
			//Placement dans chaque case
			var spacex: Array = new Array(70, 200, 340, 70, 200, 340, 70, 200, 340);
			var spacey: Array = new Array(40, 40, 40, 135, 135, 135, 240, 240, 240);
			var points: Array = new Array(0, 0);

			roundSetup(rectArray, formatArray, titleArray, turnArray, spaceArray, spacex, spacey, clickableArray, points, showPoints, AIArray, reset_text)


		}


		private function ai_func(setupArray: Array): void {
			//Fonction de AI qui trouve toute les cases no choisis et par la suite choisi un au hasard
			//Déclaration des varibles 
			var x_tour: TextField = setupArray[3][0];
			var o_tour: TextField = setupArray[3][1];
			var spacex: Array = setupArray[5][0];
			var spacey: Array = setupArray[5][1];
			var xSpaces: Array = setupArray[6][0];
			var oSpaces: Array = setupArray[6][1];
			var xselectedArray: Array = setupArray[7][0];
			var oselectedArray: Array = setupArray[7][1];
			var clickableArray: Array = setupArray[8];
			var titleArray: Array = setupArray[2];
			var points: Array = setupArray[9];
			var showPoints: Array = setupArray[10];
			var myTextFormat: TextFormat = new TextFormat();
			var ai_Text:TextField = setupArray[11][0];
			var ai_status:Boolean = setupArray[11][1];
			var number_array: Array = new Array(0, 1, 2, 3, 4, 5, 6, 7, 8);
			var newO: TextField = new TextField();
			var all_selected: Array = new Array();

			for (var m: Number = 0; m < setupArray[7][0][1].length; m++) {
				all_selected.push(setupArray[7][0][1][m])
			}

			//Vérifie si la case est déja choisi. Si non un nombre entre 1 et 2 et choisi au hasard. 
			//Si le nombre et égal a un le case est choisi. Toutefois le code s'assure que au moins un case et choisi
			for (var i: Number = 0; i < number_array.length; i++) {
				var already_selected: Boolean = false;
				for (var j: Number = 0; j < all_selected.length; j++) {

					if (number_array[i] == all_selected[j]) {
						already_selected = true;
					}
				}
				var a: Number = Math.floor(Math.random() * 2)
				if (a == 1) {
					if (already_selected == false) {
						setupArray[4][i].load(new URLRequest('files\\blackO.png'));
						addChild(newO);
						oSpaces.push(i);
						oselectedArray[0].push();
						oselectedArray[1].push(i);

						var status: Boolean = checkWinning(oSpaces, oselectedArray, "files\\greenO.png", setupArray, i, showPoints[1]);

						if (status) {}
						return;
					}

				}
				if (already_selected == false) {
					var last_Number: Number = i;
				}

			}
			//Si aucun case et choisi, choisir la dernière case
			if (!isNaN(last_Number)) {

				setupArray[4][last_Number].load(new URLRequest('files\\blackO.png'));
				addChild(newO);
				oSpaces.push(last_Number);
				oselectedArray[0].push();
				oselectedArray[1].push(last_Number);

				checkWinning(oSpaces, oselectedArray, "files\\greenO.png", setupArray, last_Number, showPoints[1]);

				return;
			}




		}


		private function handler(setupArray: Array, i: Number): void {
			//Ceci assure que la case choisi peut d'abord être choisi et par après change l'image
			// Déclariation des variables
			var x_tour: TextField = setupArray[3][0];
			var o_tour: TextField = setupArray[3][1];
			var space: Loader = setupArray[4][i];
			var spacex: Array = setupArray[5][0];
			var spacey: Array = setupArray[5][1];
			var xSpaces: Array = setupArray[6][0];
			var oSpaces: Array = setupArray[6][1];
			var xselectedArray: Array = setupArray[7][0];
			var oselectedArray: Array = setupArray[7][1];
			var clickableArray: Array = setupArray[8];
			var titleArray: Array = setupArray[2];
			var points: Array = setupArray[9];
			var showPoints: Array = setupArray[10];
			var myTextFormat: TextFormat = new TextFormat();
			var ai_Text:TextField = setupArray[11][0];
			var ai_status:Boolean = setupArray[11][1];
			myTextFormat.size = 70;
			myTextFormat.color = 0x000000;
			var x_color: int = x_tour.textColor;
			var o_color: int = o_tour.textColor;
			//Si la case peut être choisi
			if (clickableArray[i]) {
				clickableArray[i] = false;
				//vérifier si c'est le tour de X ou de O
				if (x_tour.textColor == 65280) {
					//Changer l'image et l'ajouter au array de case choisi
					space.load(new URLRequest('files\\blackX.png'));
					xSpaces.push(i);
					xselectedArray[0].push();
					xselectedArray[1].push(i);
					var status: Boolean = checkWinning(xSpaces, xselectedArray, "files\\greenX.png", setupArray, i, showPoints[0]);
					if (status) {
						resetDisplay(setupArray);


						x_tour.textColor = o_color;
						o_tour.textColor = x_color;
						return;
					}
					if (ai_status) {
						//Si le AI est choisi, changer au tour de AI
						ai_func(setupArray);
					} else {
						x_tour.textColor = o_color;
						o_tour.textColor = x_color;
					}

				} else {
					//Pareille pour O
					var newO: TextField = new TextField();
					space.load(new URLRequest('files\\blackO.png'));
					addChild(newO);
					oSpaces.push(i);
					oselectedArray[0].push();
					oselectedArray[1].push(i);

					checkWinning(oSpaces, oselectedArray, "files\\greenO.png", setupArray, i, showPoints[1]);

					if (!ai_status) {


						x_tour.textColor = o_color;
						o_tour.textColor = x_color;
					}
				}
			}
		}


		private function checkWinning(spaces: Array, selectedArray: Array, path: String, setupArray: Array, i: Number, points: TextField): Boolean {
			//Ce fonction vérifie si un joueur a gagné

			//Tous les possibilités gagnants possibles
			var config1: Array = new Array(0, 1, 2);
			var config2: Array = new Array(3, 4, 5);
			var config3: Array = new Array(6, 7, 8);
			var config4: Array = new Array(0, 3, 6);
			var config5: Array = new Array(1, 4, 7);
			var config6: Array = new Array(2, 5, 8);
			var config7: Array = new Array(0, 4, 8);
			var config8: Array = new Array(2, 4, 6);


			var winningConfigs: Array = new Array(config1, config2, config3, config4, config5, config6, config7, config8);

			//Ceci va à travers toutes le possibilités. Si le joueur a un de ces possibilités il gagne (return true)
			for (var p: Number = 0; p < winningConfigs.length; p++) {
				var totalpoints: Number = 0;
				for (var k: Number = 0; k < spaces.length; k++) {
					if (spaces[k] == winningConfigs[p][0] || spaces[k] == winningConfigs[p][1] || spaces[k] == winningConfigs[p][2]) {
						totalpoints++;
					}
					if (totalpoints == 3) {
						for (var h: Number = 0; h < winningConfigs[p].length; h++) {
							for (var j: Number = 0; j < selectedArray[1].length; j++) {
								if (winningConfigs[p][h] == selectedArray[1][j]) {
									setupArray[4][selectedArray[1][j]].load(new URLRequest(path));
								}
							}
						}
						points.text = String(Number(points.text) + 1);
						return true;
					}
				}
			}
			return false;
		}


		private function resetDisplay(setupArray: Array): void {
			// Cette fonction assure que chaque case et cliquable durant le nouvelle ronde
			for (var i: Number = 0; i < setupArray[8].length; i++) {
				setupArray[8][i] = false;
			}


		}


		private function roundSetup(rectArray: Array, formatArray: Array, titleArray: Array, turnArray: Array, spaceArray: Array, spacex: Array, spacey: Array, clickableArray: Array, points: Array, showPoints: Array, AIArray: Array, reset:TextField): void {
			//Ce fonction ajoute l'umage blank a chacun des cases et par la suite ajoute un event listener à toutes les cases qui va 
			//Lancer un fonction pour changer l'image du case
			var blank: String = "files\\blank.png"

			for (var i: Number = 0; i < spaceArray.length; i++) {
				spaceArray[i] = imageLoader(blank, spacex[i], spacey[i]);
				addChild(spaceArray[i]);
			}


			var spacexy: Array = new Array(spacex, spacey);


			var xSpaces: Array = new Array();
			var oSpaces: Array = new Array();

			var xoSpaces: Array = new Array(xSpaces, oSpaces);

			var textArray: Array = new Array();
			var positionArray: Array = new Array();

			var xselectedArray: Array = new Array(textArray, positionArray);
			var oselectedArray: Array = new Array(textArray, positionArray);

			var selectedArray: Array = new Array(xselectedArray, oselectedArray);

			var setupArray: Array = new Array();
			setupArray.push(rectArray, formatArray, titleArray, turnArray, spaceArray, spacexy, xoSpaces, selectedArray, clickableArray, points, showPoints, AIArray)
			setupArray[4][0].addEventListener(MouseEvent.CLICK, function (e: Event): void {
				handler(setupArray, 0)
			});
			setupArray[4][1].addEventListener(MouseEvent.CLICK, function (e: Event): void {
				handler(setupArray, 1)
			});
			setupArray[4][2].addEventListener(MouseEvent.CLICK, function (e: Event): void {
				handler(setupArray, 2)
			});
			setupArray[4][3].addEventListener(MouseEvent.CLICK, function (e: Event): void {
				handler(setupArray, 3)
			});
			setupArray[4][4].addEventListener(MouseEvent.CLICK, function (e: Event): void {
				handler(setupArray, 4)
			});
			setupArray[4][5].addEventListener(MouseEvent.CLICK, function (e: Event): void {
				handler(setupArray, 5)
			});
			setupArray[4][6].addEventListener(MouseEvent.CLICK, function (e: Event): void {
				handler(setupArray, 6)
			});
			setupArray[4][7].addEventListener(MouseEvent.CLICK, function (e: Event): void {
				handler(setupArray, 7)
			});
			setupArray[4][8].addEventListener(MouseEvent.CLICK, function (e: Event): void {
				handler(setupArray, 8)
			});
			setupArray[2][1].addEventListener(MouseEvent.CLICK, function (e: Event): void {
				roundReset(setupArray)
			});
			setupArray[11][0].addEventListener(MouseEvent.CLICK, function (e: Event): void {
				setupArray[11][1] = true;
			});
			//Ceci recommence le jeu complétement
			reset.addEventListener(MouseEvent.CLICK, function(e:Event): void{
				
				setupArray[11][1] = false;
				setupArray[10][0].text = 0;
				setupArray[10][1].text = 0;
				resetDisplay(setupArray);
				roundReset(setupArray);

				
			});

			setupArray[3][0].textColor = 0x00FF00;
		}

		private function roundReset(setupArray: Array): void {
			// Cette fonction commence une nouvelle ronde
			var blank: String = "files\\blank.png"

			for (var i: Number = 0; i < setupArray[4].length; i++) {
				setupArray[4][i].load(new URLRequest(blank));
			}

			setupArray[6][0].splice(0);
			setupArray[6][1].splice(0);

			setupArray[7][0][0].splice(0);
			setupArray[7][0][1].splice(0);
			setupArray[7][1][0].splice(0);
			setupArray[7][1][1].splice(0);

			for (var l: Number = 0; l < setupArray[8].length; l++) {
				setupArray[8][l] = true;
			}

			setupArray[3][0].textColor = 0x00FF00;
			setupArray[3][1].textColor = 0x000000;
		}




		private function createCustomTextField(x: Number, y: Number, width: Number, height: Number, text: String, myFormat: TextFormat): TextField {
			//Cette fonction récupère une série de variables spécifiées par l'utilisateur et les définit comme une propriété de zone de texte pour économiser de l'espace.
			var result: TextField = new TextField();
			result.defaultTextFormat = myFormat;
			result.x = x;
			result.y = y;
			result.text = text;
			result.width = width;
			result.height = height;

			return result;
		}

		private function imageLoader(path: String, x: Number, y: Number): Loader {
			//Cette fonction change ou ajoute l'image d'un case
			var myLoader: Loader = new Loader();
			myLoader.scaleX = 0.4;
			myLoader.scaleY = 0.4;
			myLoader.y = y;
			myLoader.x = x;
			myLoader.load(new URLRequest(path));
			return myLoader;
		}
	}
}