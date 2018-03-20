int main() 
{
	write("Hello World!\n");						//print statement in pike
	array board = ({4, 4, 4, 4, 4, 4, 0, 4, 4, 4, 4, 4, 4, 0});		//array creation
	string s = toString(board);						//array to string to put into mancala board format
	write(s);
	string indexstr;
	while(1 != 0){
		write("\nUser Input: " + indexstr + "\nEnter an index: ");		
		indexstr = Stdio.stdin->gets();					//get input from user
		int index = (int) indexstr;					//convert user string input to int
		board[index] = board[index] - 1;				//decrement that position on board
		toString(board);
		write(s);
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
