import java.util.*;
import java.io.*;

class Data
{
	final public static int MAX_ROW = 718;
	final public static int MAX_COL = 5;

	public static int[] computeRowSums(int[][] arr, int row, int col)
	{
		int[] rowSum = new int[row];
		
		for (int i=0; i<row; i++)
		{
			for (int j=0; j<col; j++)
			{
				rowSum[i] += arr[i][j];
			}
		}

		return rowSum;
	}

	

	public static void main(String[] args)
	{
		int[] city = new int[] {3963,26693,2595,2726,10770,120545,12380,9989,2839,8334,7546,3391,27975,7029,5846,11477};
		int[] dogbites = new int[]{15,68,4,10,26,172,26,16,5,28,14,5,54,24,18,34};
		int[] catbites = new int[] {1,45,0,2,6,74,6,8,1,10,4,1,19,2,2,17};
		int [] unvacDogs = new int[] {5,14,3,6,9,51,3,6,6,7,4,2,19,11,8,14};
		int []  unvacAnimals = new int[] {5,36,3,7,11,91,6,8,6,16,3,2,31,13,9,22};
		int[] unvacCats= new int[16];
		int[] animalbites= new int [16];
		
		Random r = new Random();
		Random r2 = new Random();
		for(int i=0;i<16;i++){
			unvacCats[i]= unvacAnimals[i] - unvacDogs[i];
		}
		for(int i=0;i<16;i++){
			animalbites[i]= dogbites[i] + catbites[i];
		}
		int[][] results = new int[MAX_ROW][MAX_COL];
		int count =0;
		
		for(int i=0;i<16;i++){
			int Animalbites= animalbites[i];
			int Dogbites = dogbites[i];
			int UnvacDogs = unvacDogs [i];
			//Gender Species Season VaccinationStatus  Municipality
			for(int j=0; j<Animalbites; j++){
				if (Dogbites!=0){
					// 1 = Dog, 0 = Cat
					results[count][1]= 1;
					Dogbites--;
				}
				else{
					results[count][1]= 0;
				}
				
				if (UnvacDogs!=0){
					// 1 = Vaccinated, 0 = Unvaccinated
					results[count][3]= 0;
					UnvacDogs--;
				}
				else{
					results[count][3]= 1;
				}
				
				int gender = r.nextInt(90) +1;
				// Male = 1, Female = 2 , Unknown = 3
				if(gender<=45)
					results[count][0]=1;
				else if (gender<= 67)
					results[count][0]=2;
				else
					results[count][0]=3;
					
				int season = r2.nextInt(100)+1;
				
				// Spring=1, Summer=2, Autumn=3, Winter=4
				if(season<=28)
					results[count][2]=1;
				else if (season<=61)
					results[count][2]=2;
				else if (season<= 82)
					results[count][2]=3;
				else 
					results[count][2]=4;
					
				
				results[count][4]=i+1;
				count++;
			}
			
		}
		
		try{
		PrintWriter writer = new PrintWriter("rabiesData.csv", "UTF-8");
		
		writer.println("Gender"+"," + "Species" +","+"Season"+"," + "Vaccination"+","+ "Municipality");
			
		for (int i=0; i<718; i++){
			writer.println(String.valueOf(results[i][0])+"," + String.valueOf(results[i][1])+"," 
			+String.valueOf(results[i][2])+"," + String.valueOf(results[i][3])+","+ String.valueOf(results[i][4]));
		}
		
		writer.close();
		
		}
		
		catch(IOException ex){
		}
		
		System.out.println("Done!!!!");

	}
}
