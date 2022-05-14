mex -c ./Source/Seed_generate.cpp ./Source/Graph_init.cpp ./Source/Gradient.cpp ./Source/Auxiliary.cpp  ./Source/DRW_alogorithm.cpp   -I'./Header' -I'/usr/local/include' -L'/usr/local/lib' -lopencv_core.2.4.13 -lopencv_highgui.2.4.13 -lopencv_imgproc.2.4.13

mex -O ./Mex/mexDRW.cpp  -I'./Header' -I'/usr/local/include' -L'/usr/local/lib' -lopencv_core.2.4.13 -lopencv_highgui.2.4.13 -lopencv_imgproc.2.4.13  DRW_alogorithm.o Auxiliary.o Gradient.o Graph_init.o Seed_generate.o

mex -O ./Mex/mexSeedDRW.cpp  -I'./Header' -I'/usr/local/include' -L'/usr/local/lib' -lopencv_core.2.4.13 -lopencv_highgui.2.4.13 -lopencv_imgproc.2.4.13  DRW_alogorithm.o Auxiliary.o Gradient.o Graph_init.o Seed_generate.o

mex -O ./Mex/mexCreateSeed.cpp  -I'./Header' -I'/usr/local/include' -L'/usr/local/lib' -lopencv_core.2.4.13 -lopencv_highgui.2.4.13 -lopencv_imgproc.2.4.13  DRW_alogorithm.o Auxiliary.o Gradient.o Graph_init.o Seed_generate.o