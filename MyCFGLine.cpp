#include <llvm/IR/BasicBlock.h>
#include <llvm/IR/Function.h>
#include <llvm/Support/raw_ostream.h>
#include <llvm/IR/User.h>
#include <llvm/IR/Instructions.h>
#include <llvm/Pass.h>
#include <fstream>
#include <llvm/Analysis/CFG.h>
#include <stdio.h>
#include <map>
using namespace llvm;

namespace {
	struct MyCFGLinePass : public FunctionPass {
		static char ID;
		std::error_code error;
		std::string str;
		//StringMap<int> basicblockMap;
		std::map<BasicBlock*, int> basicBlockMap;
		int bbCount;  //Block的编号
		MyCFGLinePass() : FunctionPass(ID){
			bbCount = 0;
		}

		bool runOnFunction(Function &F) override {
			raw_string_ostream rso(str);
			StringRef name(F.getName().str() + ".c");
			
			enum sys::fs::OpenFlags F_None;
			raw_fd_ostream file(name, error, F_None);
			//std::ofstream os;
			//os.open(name.str() + ".dot");
			//if (!os.is_open()){
			//	errs() << "Could not open the " << name << "file\n";
			//	return false;
			//}
			file << "#include \"graph_link.h\"\n\n";
            file << "void " + F.getName() + "(GraphLink* g){\n";
			for (Function::iterator B_iter = F.begin(); B_iter != F.end(); ++B_iter){
				BasicBlock* curBB = &*B_iter;
				std::string name = curBB->getName().str();
				int fromCountNum;
				int toCountNum;
				if (basicBlockMap.find(curBB) != basicBlockMap.end())
				{
					fromCountNum = basicBlockMap[curBB];
				}
				else
				{
					fromCountNum = bbCount;
					basicBlockMap[curBB] = bbCount++;//TODO:bbCount should be replaced by the first line number of this block
                    file << "\tinsert_vertex(g, "<<fromCountNum <<");\n";

                    BasicBlock::iterator In_it = curBB->begin();
                    file << *In_it << "\n";
                    const DebugLoc &location = (&(*In_it))->getDebugLoc();
                    if (location)
                        file << " see line:  " << location.getLine() << ", col " << location.getCol() << " \n";
                    else
                        file << "no debugloc information detected\n";
				}

				for (BasicBlock *SuccBB : successors(curBB)){
					if (basicBlockMap.find(SuccBB) != basicBlockMap.end())
					{
						toCountNum = basicBlockMap[SuccBB];
					}
					else
					{
						toCountNum = bbCount;
						basicBlockMap[SuccBB] = bbCount++;
                        file << "\tinsert_vertex(g, "<<toCountNum <<");\n";

                        BasicBlock::iterator In_it = SuccBB->begin();
                        file << *In_it << "\n";
                        const DebugLoc &location = (&(*In_it))->getDebugLoc();
                        if (location)
                            file << " see line:  " << location.getLine() << ", col " << location.getCol() << " \n";
                        else
                            file << "no debugloc information detected\n";
					}

                    file << "\tinsert_edge_head(g, "<< fromCountNum << ", "<<toCountNum <<");\n";
				}
			}
			file << "}\n";
			file.close();
			return false;
		}
		//void printInstruction(Instruction *inst, std::ofstream os) {

	//}
	};
}
char MyCFGLinePass::ID = 0;
static RegisterPass<MyCFGLinePass> X("MyCFGLine", "MyCFGLine Pass Analyse",
	false, false
);
