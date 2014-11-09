#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#include "conway.h"

/*
 *		Prints the help menu
 */
void printusage(){
    printf("Usage: conway <width> <height>\n");
}
/*
void update(int**board, int width, int height){
	int**newBoard;
	int row;
	int col;
	int count = 0;

	newBoard = malloc(sizeof(int *) * height);
	for(row = 0; row < height; row++){
		newBoard[row] = malloc(sizeof(int) * width);
	}

	for(row = 0; row < height; row++){
		for(col = 0; col < width; col++){
			if(row-1 >= 0 && col-1 >= 0){
				if(board[row-1][col-1] == 1){
					count++;
				}
			}
			if(row-1 >= 0){
				if(board[row-1][col] == 1){
					count++;
				}
			}
			if(col-1 >= 0){
				if(board[row][col-1] == 1){
					count++;
				}
			}
			if(row+1 < height && col+1 < width){
				if(board[row+1][col+1] == 1){
					count++;
				}
			}
			if(row+1 < height){
				if(board[row+1][col] == 1){
					count++;
				}
			}
			if(col+1 < width){
				if(board[row][col+1] == 1){
					count++;
				}
			}
			if(row-1 >= 0 && col+1 < width){
				if(board[row-1][col+1] == 1){
					count++;
				}
			}
			if(row+1 < height && col-1 >= 0){
				if(board[row+1][col-1] == 1){
					count++;
				}
			}

			if(board[row][col] == 1){
				if(count == 2 || count == 3){
					newBoard[row][col] = 1;
				}else if(count < 2 || count > 3){
					newBoard[row][col] = 0;
				}
			}else if(board[row][col] == 0){
				if(count == 3){
					newBoard[row][col] = 1;
				}else{
					newBoard[row][col] = 0;
				}
			}
			count = 0;
		}
	}
	for(row = 0; row < height; row++){
		for(col = 0; col < width; col++){
			board[row][col] = newBoard[row][col];
		}
	}
}
*/
/*
 *		Prints the current iteration of the game board
 */
void printboard(int **board, int width, int height){
    int i, j;

    for(i = 0; i < height; i++){
        for(j = 0; j < width; j++){
            printf("%d ", board[i][j]);
        }
        printf("\n");
    }

}

int main(int argc, char *argv[]){
    int width, height;
    int **board;
    int i;

    if(argc != 3){
        printusage();
        return 1;
    }
    if(sscanf(argv[1], "%d", &width) != 1){ //reads in argv[1] as width
        printusage();
        return 1;
    }

    if(sscanf(argv[2], "%d", &height) != 1){ //reads in argv[2] as height
        printusage();
        return 1;
    }

    /*allocate space for the board*/
    board = malloc(sizeof(int *) * height);
    for(i = 0; i < height; i++){
        board[i] = malloc(sizeof(int) * width);
    }

    /*initialize the board to be in a random state*/
    srand(time(NULL));

    for(i = 0; i < height; i++){
        int j;
        for(j = 0; j < width; j++){
            board[i][j] = rand() % 2;
        }
    }

	/*print initial board*/
    printboard(board, width, height);

    /*call your update method, update the board*/
    update(board, width, height);

    printf("\n");

	/*print the updated board*/
    printboard(board, width, height);

    /*clean things up*/
    for(i = 0; i < height; i++){
        free(board[i]);
    }
    free(board);
}
