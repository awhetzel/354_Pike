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
	
	array user1 = ({1, 2, 3, 4, 5, 6});
	array user2 = ({8, 9, 10, 11, 12, 13});
	array boardIndex = ({1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14});
	write("Player 1 indexes: 1, 2, 3, 4, 5, 6\n");
	if(numPlayers == 2){
		write("Player 2 indexes: 8, 9, 10, 11, 12, 13\n");
	}
	write("Mancala Board Indexes: \n");
	toString(boardIndex);
	write("\nStarting Board :\n");
	array board = ({4, 4, 4, 4, 4, 4, 0, 4, 4, 4, 4, 4, 4, 0});
	//array to string to put into mancala board format
	string s = toString(board);						
	write(s);
	string indexstr;
	int end= 0;
	int pNum = 1;
	int pOneTurn = 0;
	int pTwoTurn =0;
	int index =0;
	while(1 != 0){
		//Single player
		if(numPlayers ==1){ 
			int compsTurn = 0;
			write("\nEnter an index: ");		
			indexstr = Stdio.stdin->gets();					
			index = (int) indexstr;	
			if(index >= 1 && index <=6 && index != 7 && index != 14){
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
		}
		end = endCheck(board);
		if(end > 0){
			finishUp(board);
		}
		//MultiPlayer
		else if(numPlayers ==2){
			write("\n Player "+pNum +" enter an index: ");
			indexstr = Stdio.stdin->gets();					
			index = (int) indexstr;	
			//Player one
			if(pNum ==1 && index >= 1 && index<= 6 && index != 7 && index != 14){
				if(index >= 1 && index <=6 && index != 7 && index != 14){
					pOneTurn = playerOneTurn(board,index);
					write(s+"\n");
				}
				if(pOneTurn == 0){
					pNum =2;
				}
			}
			//Player two
			else if(pNum == 2 && index >= 7 && index <=14 && index != 7 && index != 14){
				if(index >= 7 && index <=14 && index != 7 && index != 14){
					pTwoTurn = playerTwoTurn(board, index);
					write(s+"\n");
				}
				if(pTwoTurn == 0){
					pNum =1;
				}
			}
			else{
				write("\nIndex given is not in range");
			}
		}
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
	string s = "";
	//loop to print top 6 positions of the board
	for(int i = 5; i >= 0; i--)						
	{
		if(i ==5){
			write(" ");
		}
		if(items[i+1] > 9 && i != 5){
			write(" |" + items[i]);
		} else {
		write("  |" + items[i]);
		}
	}
	if(items[0] > 9){
		write(" | \n");
	} else {
		write("  | \n");
	}
	//prints middle seperator and end parts of the board
	if(items[6] <10){
		write(" ");
	}
	write("" + items[6] + " |---|---|---|---|---|---| " + items[13] + "\n");	
	//loop to print bottom 6 positions of the board
	for(int i = 7; i < 13; i++)	
	{
		if(i==7){
			write(" ");
		}
		if(items[i -1] > 9 && i != 7){
			write(" |" + items[i]);
		} else {
			write("  |" + items[i]);
		}
	}
	if(items[12] > 9){
		write(" | \n");
	} else{
		write("  | \n");
	}
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
	//check if 0-5 is all zeroes
	int extraP1 = 0;
	int extraP2 = 0;
	for(int i =0; i<6; i++){
		if(board[i] >0){
			extraP1 += board[i];
			//write("\n" + extraP1);
			board[i] = 0;
		}
	}
	//check if 7-12 is all zeroes
	for(int i=7; i<13; i++){
		if(board[i] >0){
			extraP2 += board[i];
			//write("\n" + extraP2);
			board[i] = 0;
		}
	}
	board[6] += extraP1;
	board[13] += extraP2;
	toString(board);
	int player1Score = board[6];
	int player2Score = board[13];
	if(player1Score > player2Score){
		write("Player 1 wins!\nFinal Score: Player 1: " + player1Score + " Player 2: " + player2Score);
	}
	else if(player1Score < player2Score){
		write("Player 2 wins!\nFinal Score: Player 1: " + player1Score + " Player 2: " + player2Score);
	}
	else{
		write("TIE!\nFinal Score: Player 1: " + player1Score + " Player 2: " + player2Score);
	}
	//delay for 15 seconds to display results
	delay(15);
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
* Player two's turn
*/
int playerTwoTurn(array board, int index){
	int marbleCount = board[index-1];
	board[index-1] = 0;
	int extraTurn =0;
			
	while(marbleCount != 0){
		if(index == 14){
			index = 0;
		}
		if(index != 6){
			board[index] = board[index] + 1;
			marbleCount--;
		}
		index++;
		//Rule 7
		if(marbleCount == 0 && index ==14){
			extraTurn =1;
		}
		//Rule 8
		else if(marbleCount ==0 && board[index-1] ==1){
			capture(board, index, 13);
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
/*
* Handles rule 8
*/
void capture(array board, int index, int mancalaNum){
	write("Player with mancala: "+(mancalaNum+1)+" captured pit: "+ (12-(index-1)+1)+"\n");
	//capture pieces on opposite side 
	board[mancalaNum] += board[12-(index-1)]+board[index-1];
	board[index-1] =0;
	board[12-(index-1)] =0;
} 
