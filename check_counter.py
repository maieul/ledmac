log = open("issue564.log","r")
data = {}
import re
regexp = re.compile(r"(\\.*)(=)(\\[abcdefghijklmnopqrstuvwxyz]*)([0123456789]*)")

for l in log:
    result = regexp.search(l[:-1])
    if result != None:
        result = result.groups()
        register_number = result[3]
        register_type = result[2]
        register_name = result[0]
        this={
           "number":register_number,
           "type":register_type,
           "name":register_name,
        }
        if register_number in data:
            data[register_number].append(this)
        else:
            data[register_number]=[this]

for i in data:
    if len(data[i]) > 1:
        tobeprint=False
        txt = i+ "\n"
        for info in data[i]:
            if info["type"] == "\\insert":
                tobeprint=True
            txt = txt + "\t"+info["type"]+" -> " + info["name"] + "\n"
        if tobeprint:
            print (txt)

