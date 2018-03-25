int main() 
{
	write("Mancala The Video Game\n");						
	write("*Made in Pike*\n");
	write("Would you like to play 1 or 2 player? (Enter 1 or 2)\n");
	string players;
	int numPlayers;

    players = Stdio.stdin->gets();
	numPlayers = (int) players;
	while(numPlayers < 1 || numPlayers > 2){
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
	array board = ({4, 4, 4, 4, 4, 4, 0, 4, 4, 4, 4, 4, 4, 0});
	//array to string to put into mancala board format
	string s = toString(board);						
	write(s);
	string indexstr;
	int end= 0;
	while(1 != 0){
		
		//if(numPlayers ==1){ TODO for multimplayer mode
			int compsTurn = 0;
			int pOneTurn = 0;
			write("\nEnter an index: ");		
			indexstr = Stdio.stdin->gets();					
			int index = (int) indexstr;	
			if(index >= 1 && index <=14 && index != 7 && index != 14){
				if(compsTurn ==0){
					//Player 1 turn
					pOneTurn = playerOneTurn(board,index);
					write(s+"\n");
				}
				if( pOneTurn ==0){
					//Computer's turn
					compsTurn = compTurn(board);
					write(s+"\n");
				}
			} 
			else{
				write("\nIndex given is not in range");
			}
		//}
		end = endCheck(board);
		if(end >0){
			finishUp(board);
		}
	}
	return 0;
}
/*
* Format board
*/ 
string toString(array items){
	string s = "done";
	//loop to print top 6 positions of the board
	for(int i = 5; i >= 0; i--)						
	{
		write(" |" + items[i]);
	}
	write(" | \n");
	//prints middle seperator and end parts of the board
	write("" + items[6] + "|--|--|--|--|--|--|" + items[13] + "\n");	
	//loop to print bottom 6 positions of the board
	for(int i = 7; i < 13; i++)	
	{
		write(" |" + items[i]);
	}
	write(" | \n");
	/*return string s which is "done" 
	* currently the toString doesnt 
	* create a string but just prints 
	* the format within the method*/
	return s;					
}
/*
* Check if game is over
*/
int endCheck(array board){
	int isFinished =0;
	int foundP1 = 0;
	int foundP2 = 0;
	//check if 0-5 is all zeroes
	for(int i =0; i<6; i++){
		if(board[i] >0){
			foundP1 = 1;
			break;
		}
	}
	//check if 7-12 is all zeroes
	for(int i=7; i<13; i++){
		if(board[i] >0){
			foundP2 =1;
			break;
		}
	}
	if(foundP1 == 0 || foundP2 == 0){
		isFinished =1;
	}
	return isFinished;
}
/*
* Find out who won and print
* results
*/
void finishUp(array board){
	int player1Score = board[6];
	int player2Score = board[13];
	if(player1Score > player2Score){
		write("Player 1 wins!");
	}
	else if(player1Score < player2Score){
		write("Player 2 wins!");
	}
	else{
		write("TIE!");
	}
	//delay for 5 seconds to display results
	delay(5);
	exit(0);
}
/*
* Player one's turn
*/
int playerOneTurn(array board, int index){
	int marbleCount = board[index-1];
	board[index-1] = 0;
	int extraTurn =0;
			
	while(marbleCount != 0){
		if(index == 14){
			index = 0;
		}
		if(index != 13){
			board[index] = board[index] + 1;
			marbleCount--;
		}
		index++;
		//Rule 7
		if(marbleCount == 0 && index ==7){
			extraTurn =1;
		}
		//Rule 8
		else if(marbleCount ==0 && board[index-1] ==1){
			capture(board, index, 6);
		}
	}
	toString(board);
	return extraTurn;
}
/*
* computer's turn
*/
int compTurn(array board){
	int extraCompTurn =0;
	//Computer selects a number on the bottom side of the board
	int computerIndex = random((12 - 7) + 1) + 7;
	write("computer selects pit #: "+(computerIndex+1)+"\n");
	//Computer grabs some marbles from the selected index
	int compMarbles = board[computerIndex];
	board[computerIndex] =0;
	//Start adding marbles to selected index+1
	computerIndex++;
	while(compMarbles > 0){
		if(computerIndex == 14){
			computerIndex =0;
		}
		//Add a marble to the pit	
		if(computerIndex != 6){
			board[computerIndex] = board[computerIndex]+1;
			compMarbles --;
		}
		computerIndex ++;
		if(compMarbles == 0 && computerIndex == 14){
			extraCompTurn =1;
		}
		else if(compMarbles ==0 && board[computerIndex-1] ==0){
			capture(board, computerIndex, 13);
		}
	}
	toString(board);
	return extraCompTurn;
}

void capture(array board, int index, int mancalaNum){
	write("Player with mancala: "+(mancalaNum+1)+" captured pit: "+ (12-(index-1)+1)+"\n");
	board[mancalaNum] += 12-(index-1)+board[index-1];
}





