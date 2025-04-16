(: //obra/titol/text() :)

(: text() no funciona amb atributs, s'ha d'emprar string() :)

(: //obra/@pais ATRIBUTS :)

(: //obra/@pais/string() :)

(: distinct-values(//obra[@pais="França"]/museu/string()) :)

(: //obra[@pais="França" or @pais="Espanya"]/museu/string() :)

(: count(//obra) :)

(: //obra[last()] :)

(: //obra[3] :)

(: //obra[position()=3] :)

(: //titol[contains(text(),'h')] :)

(: //museu[@visible="true"]/../titol/text() :)

//museu[@visible="true"]/..//titol