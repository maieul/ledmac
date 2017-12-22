#!/usr/bin/env texlua
module="reledmac"
stdengine="xetex"
checkengines={"xetex","luatex"}
checkruns=2
kpse.set_program_name("kpsewhich")
dofile(kpse.lookup("l3build.lua"))
