<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Arrays,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	// Una class Race per guardar informació del race
	class Race {

		public final String[] caracs = { "FUE", "DES", "CON", "INT", "SAB", "CAR" };
		String nom;
		String race;
		String imatge;
		int carac[];
		int mod[];
		int pv;
		int pm;

		//Constructor
		Race() {
			this.nom = null;
			this.race = null;
			this.imatge = null;
			this.carac = null;
			this.mod = null;
			this.pv = 0;
			this.pm = 0;
		}

		//Un mètode per generar els valors de race aleatòriament
		void iniAleatori() {
			//Aleatori de un posicio
			int pos = (int) (Math.random() * 6 + 0);

			//Els noms de Races
			String[] nomRaces = { "Elfs", "Nans", "Gnom", "Mitjans", "Semi-Orc", "humans" };
			this.race = nomRaces[pos];

			//La ruta de l'imatge
			this.imatge = "./img-races/" + pos + ".png";

			//Mètode per generar modificadors
			//list de mods de diferents races
			int[] modElfs = { 0, 2, -2, 2, 0, 0 };
			int[] modNans = { 0, 0, 2, 0, 2, -2 };
			int[] modGnom = { 0, 0, 2, 0, 0, 2 };
			int[] modMitjans = { 0, 2, 0, 0, 0, 0 };
			int[] modSemiorc = { 2, 0, 0, -2, 0, -2 };
			int[] modHumans = { 0, 0, 0, 0, 0, 0 };

			List<int[]> list = new ArrayList<int[]>();
			list.add(modElfs);
			list.add(modNans);
			list.add(modGnom);
			list.add(modMitjans);
			list.add(modSemiorc);
			list.add(modHumans);

			this.mod = list.get(pos);

			//Mètode per generar de les característiques
			int[] carac = new int[6];
			for (int i = 0; i < carac.length; i++) {
		int valor[] = new int[4];
		for (int j = 0; j < 4; j++) {
			valor[j] = (int) (Math.random() * 6 + 1);
		}
		Arrays.sort(valor);
		for (int k = 1; k < valor.length; k++) {
			carac[i] += valor[k];
		}
			}
			this.carac = carac;

			//Mètode per generar punts de la vida
			this.pv = this.carac[2] * (int) (Math.random() * 8 + 1);

			//Mètode per generar punts de la mana

			int mitjana = (int) Math.floor((this.carac[3] + this.carac[4]) / 2);
			this.pm = mitjana * (int) (Math.random() * 4 + 1);

		}

		//Mètode per obtenir un nou valor de la vida
		int canviarPV(int carac[]) {
			return carac[2] * (int) (Math.random() * 8 + 1);
		}

		//Mètode per obtenir un nou valor de la mana
		int canviarPM(int carac[]) {
			int mitjana = (int) Math.floor((carac[3] + carac[4]) / 2);
			return mitjana * (int) (Math.random() * 4 + 1);
		}

	}
	%>
</body>
</html>