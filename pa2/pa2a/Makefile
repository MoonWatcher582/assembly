all: game

game: game.c conway.s
	gcc -g -m32 -o game conway.s game.c

clean:
	rm game
