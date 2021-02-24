using System;
using System.Text;

namespace ProgFundamentals2  //DO NOT change the namespace name
{
    public class Program      //DO NOT change the class name
    {
        public static void Main(string[] args)     //DO NOT change the 'Main' method signature
        {
            Console.WriteLine("Enter the number of teams:");
            int teams = Convert.ToInt32(Console.ReadLine());
            int[][] teamData = new int[teams][];

            for (int i = 0; i < teams; ++i)
            {
                Console.WriteLine("No.of attempts for team " + (i + 1) + ":");
                teamData[i] = new int[Convert.ToInt32(Console.ReadLine())];
            }
            for (int i = 0; i < teams; ++i)
            {
                Console.WriteLine("Enter the score for team " + (i + 1) + ":");
                for (int j = 0; j < teamData[i].Length; ++j)
                {
                    teamData[i][j] = Convert.ToInt32(Console.ReadLine());
                }

            }
            Console.WriteLine(GetTotalScore(teamData));

        }
        public static String GetTotalScore(int[][] teamData)
        {
            int[] scores = new int[teamData.Length];
            for(int i=0;i<teamData.Length;++i)
            {
                int temp = 0;
                for (int j = 0; j < teamData[i].Length; ++j)
                    temp += teamData[i][j];
                scores[i] = temp;
            }
            var scoreOP = new StringBuilder();
            for (int i = 0; i < scores.Length; ++i)
                scoreOP.Append($"Team {i+1} Total Score is {scores[i]} . ");
            return scoreOP.ToString();
        }
    }
}
