import os, re, string

#Read in the DTD

DTDpath = '../DTD/mei19b-all.dtd'
ODDpath = '../ODD/modules.xml'

DTDobj = file(DTDpath, "r")
DTDlines = DTDobj.readlines()
DTDobj.close()

module_p = re.compile('<!ENTITY % mei(.+?)\s+(\'.+?\')>')
#Example: <!ENTITY % meiShared        'INCLUDE'>

#Open the output file
ODDobj = file(ODDpath, 'w')

header = '<?xml version="1.0" encoding="utf-8"?><!-- Modules for MEI converted from DTD (mei19b-all.dtd) $RV 02/08/09 --><aggregation>'
footer = '</aggregation>'

ODDobj.write(header)

for l in DTDlines:
	l = l.strip()
	m = module_p.search(l)
	if m:
		moduleName = m.group(1)
		moduleName = string.lower(moduleName)
		include_switch = m.group(2)
		
		ODDobj.write('<macroSpec xmlns="http://www.tei-c.org/ns/1.0" module="mei" xml:id="'+moduleName+'" type="pe" ident="MEI.'+moduleName+'">')
		ODDobj.write('<gloss>Insert short description here. Example: MEI analytical mechanisms</gloss>')
		ODDobj.write('<desc>Insert description here. Example: controls the inclusion of elements and attribute declarations for analytical mechanisms.</desc>')
		
		ODDobj.write('<content><rng:ref xmlns:rng="http://relaxng.org/ns/structure/1.0" name="'+include_switch+'"/></content>')
		
		ODDobj.write('<remarks><p>Usage remarks</p></remarks>')
		ODDobj.write('</macroSpec>')
		
		
ODDobj.write(footer)