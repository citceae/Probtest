import json

#need a para to get the func name
with open('test.c.gcov.json','r',encoding='utf8')as fp:
    json_data = json.load(fp)
    lines_info = json_data['files'][0]['lines']
    #print('output：',lines_info[1])

#print('output：',lines_info[0])
#print('output：',lines_info[14])
#print('output：',lines_info[1]['count'])
#print('output：',len(lines_info))
outfile = "#include \"graph_link.h\"\n\nvoid modify_map(map<int,int>* cntmap){\n"
mode1 = "\tcntmap->insert(pair<int,int>("
mode2 = "));\n"
for lines in lines_info:
    if lines['function_name'] == "main":
        break
    outfile = outfile + mode1 + str(lines['line_number']) + ',' + str(lines['count']) + mode2
outfile = outfile + '}'
with open('modify_map.cpp', 'w') as f:
    print(outfile, file = f)

