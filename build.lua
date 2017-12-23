#!/usr/bin/env texlua
module="reledmac"
stdengine="luatex"
checkengines={"xetex","luatex"}
checkruns=3
kpse.set_program_name("kpsewhich")
dofile(kpse.lookup("l3build.lua"))
