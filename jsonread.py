import json
import random

def readjson(workpath,outfile, filename):
    with open(f'{workpath}/{filename}.gcov.json','r',encoding='utf8')as fp:
        json_data = json.load(fp)
        lines_info = json_data['files'][0]['lines']
    if len(outfile) == 0:
        outfile = "#include \"graph_link.h\"\n\nvoid modify_map(GraphLink* g, map<FuncLine,int>* cntmap){\n\tFuncLine FL;\n"
    mode1 = "\tFL.name = (char*)\""
    mode2 = "\";FL.line = "
    mode3 = ";\n"
    mode4 = "\tcntmap->insert(std::map<FuncLine, int>::value_type (FL, "
    mode5 = "));\n"

    for lines in lines_info:
        outfile = outfile + mode1 + str(lines['function_name'])+ mode2 + str(lines['line_number']) + mode3 + mode4 + str(lines['count']) + mode5
        #if 0 != lines['count'] and lines['line_number'] not in reached:
        #    reached.append(lines['line_number'])
    #reached.sort()
    return outfile

def prtout(outfile,reached):
    mode6 = "\tmodify_visit(g,(char*)\""
    mode7 = "\", "
    mode8 = ");\n"
    for reach in reached:
        outfile = outfile + mode6 + reach[0] +mode7 + str(reach[1]) + mode8
    #a = random.randint(1,7)
    #outfile = outfile + "\tprintf(\""+str(a) +"\");\n"
    outfile = outfile + '}'
    with open('modify_map.cpp', 'w') as f:
        print(outfile, file = f)
    
def readall(workpath,filename,reached:list):
    with open(f'{workpath}/{filename}.gcov.json','r',encoding='utf8')as fp:
        json_data = json.load(fp)
        lines_info = json_data['files'][0]['lines']
    for lines in lines_info:
        if 0 != lines['count']:
            reach = [lines['function_name'],lines['line_number']]
            if reach not in reached:
                reached.append(reach)
    reached.sort()#reached = [["add",5],["pop",8]]
