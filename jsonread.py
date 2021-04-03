import json


def readjson(funcname,reached:list):
    with open('{filename}.gcov.json'.format(filename=funcname),'r',encoding='utf8')as fp:
        json_data = json.load(fp)
        lines_info = json_data['files'][0]['lines']
    outfile = "#include \"graph_link.h\"\n\nvoid modify_map(GraphLink* g, map<int,int>* cntmap){\n"
    mode1 = "\tcntmap->insert(pair<int,int>("
    mode2 = "));\n"
    mode3 = "\tmodify_visit(g,"
    mode4 = ");\n"
    for lines in lines_info:
        if lines['function_name'] == "main":
            break
        outfile = outfile + mode1 + str(lines['line_number']) + ',' + str(lines['count']) + mode2
        #if 0 != lines['count'] and lines['line_number'] not in reached:
        #    reached.append(lines['line_number'])
    #reached.sort()
    for idx in reached:
        outfile = outfile + mode3 + str(idx) +mode4
    outfile = outfile + '}'
    with open('modify_map.cpp', 'w') as f:
        print(outfile, file = f)
    
def readall(funcname,reached:list):
    with open('{filename}.gcov.json'.format(filename=funcname),'r',encoding='utf8')as fp:
        json_data = json.load(fp)
        lines_info = json_data['files'][0]['lines']
    for lines in lines_info:
        if lines['function_name'] == "main":
            break
        if 0 != lines['count'] and lines['line_number'] not in reached:
            reached.append(lines['line_number'])
    reached.sort()
