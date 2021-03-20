reward:graph_linkmain.o linear_link.o modify_map.o graph_link.o graph_gen.o
	g++ graph_gen.o graph_link.o modify_map.o linear_link.o graph_linkmain.o -o reward
	
graph_linkmain.o:graph_linkmain.cpp graph_link.h linear_link.h
	g++ -c graph_linkmain.cpp -o graph_linkmain.o
	
linear_link.o:linear_link.cpp graph_link.h linear_link.h
	g++ -c linear_link.cpp -o linear_link.o
	
modify_map.o:modify_map.cpp graph_link.h
	g++ -c modify_map.cpp -o modify_map.o

graph_link.o:graph_link.c graph_link.h
	g++ -c graph_link.c -o graph_link.o	

graph_gen.o:graph_gen.c graph_link.h
	g++ -c graph_gen.c -o graph_gen.o		
	
clean:
	rm -rf *.o