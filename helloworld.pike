int main() 
{
	write("Mancala The Video Game\n");						//print statement in pike
	write("*Made in Pike*\n");
	write("Would you like to play 1 or 2 player? (Enter 1 or 2)\n");
	string players = Stdio.stdin->gets();
	int numPlayers = (int) players;
	while(numPlayers <= 1 || numPlayers >= 2){
		write("Incorrect Entry, Please enter 1 for 1 player or 2 for 2 players\n");
		players = Stdio.stdin->gets();
		numPlayers = (int) players;
	}
	//if(numPlayers == 1){
	//	write("Enter Difficulty(Easy: 1\tMedium: 2\tHard: 3\n");
	//	string level = Stdio.stdin->gets();
	//	int CPUlevel = (int) level;
	//	while(CPUlevel < 1 || CPUlevel > 3){
	//		write("Incorrect Entry:\nPlease enter 1 for Easy, 2 for Medium, or 3 for Hard\n");
	//		level = stdio.stdin->gets();
	//		CPUlevel = (int) level;
	//	}
	//	write("Selected Difficulty: ");
	//	if(CPUlevel == 1)
	//		write("Easy\n");
	//	else if(CPUlevel == 2)
	//		write("Medium\n");
	//	else if(CPUlevel == 3)
	//		write("Hard\n");
	//}
	
	array user1 = ({1, 2, 3, 4, 5, 6});
	array user2 = ({8, 9, 10, 11, 12, 13});
	array boardIndex = ({1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14});
	//toString(boardIndex);
	array board = ({4, 4, 4, 4, 4, 4, 0, 4, 4, 4, 4, 4, 4, 0});		//array creation
	string s = toString(board);						//array to string to put into mancala board format
	write(s);
	string indexstr;
	while(1 != 0){
		write("\nUser Input: " + indexstr + "\nEnter an index: ");		
		indexstr = Stdio.stdin->gets();					//get input from user
		int index = (int) indexstr;					//convert user string input to int
		if(index >= 1 && index <=14 && index != 7 && index != 14){
			//board[index-1] = board[index] - 1;				//decrement that position on board
			int marbleCount = board[index-1];
			board[index-1] = 0;
			int nextMove = index-2;
			while(marbleCount != 0){
				if(index == 14)
					index = 0;
				board[index] = board[index] + 1;
				index++;
				marbleCount--;
			}
			toString(board);
			write(s);
		} else {
			write("\nIndex given is not in range");
		}
	}
	return 0;
}

string toString(array items){
	string s = "done";
	for(int i = 5; i >= 0; i--)						//loop to print top 6 positions of the board
	{
		write(" |" + items[i]);
	}
	write(" | \n");
	write("" + items[6] + "|--|--|--|--|--|--|" + items[13] + "\n");	//prints middle seperator and end parts of the board
	for(int i = 7; i < 13; i++)						//loop to print bottom 6 positions of the board
	{
		write(" |" + items[i]);
	}
	write(" | \n");
	return s;								//return string s which is "done" currently the toString doesnt create a string but just prints the format within the method
}
