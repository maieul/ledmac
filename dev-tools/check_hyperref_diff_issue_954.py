import re
file = open('toto.txt')
content = file.readlines()
goto = []
dest = []
goto_reg = re.compile('name\{(.*)\}$')
dest_reg = re.compile('pdfdest name\{(.*)\}')
for l in content:
    ok = False
    if l[0] == ' ' or l[0] == '-' or l[0] == '@' or l[0:2] == '++' or l[0:4] == 'diff' or l[0:5]== 'index' :
        ok = True
    if l[0] == '+':
        match = goto_reg.findall(l)
        if (len(match) > 0):
            goto.append(match[0])
            ok = True
        match = dest_reg.findall(l)
        if (len(match) > 0):
            dest.append(match[0])
            ok = True
    if ok == False:
        print("ALERT")
        print (l)

goto = set (goto)
dest = set (dest)

print (goto-dest)
print (dest-goto)
